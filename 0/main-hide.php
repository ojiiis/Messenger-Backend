<?php
//this is for main.php file 
date_default_timezone_set("Africa/Lagos");
$devSetting = [
    "development"=>1,
    "devUrl"=>'/love',
    "devUrlPattern"=>'\/love',
    "host"=>'lin.com.ng',
    "scheme"=>"https"
];

if($devSetting['development'] == 0){
//    $devSetting['devUrl'] = ""; 
//      $devSetting['devUrlPattern'] = ""; 
//       $devSetting['scheme'] = "https"; 
}
$connection = mysqli_connect("localhost","doksummz_love","28r4X*CY=&;=","doksummz_love");
//$connection = mysqli_connect("localhost","doksummz_fin","E(v)*r]1Te_E","doksummz_fin");
function uid($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }

    return $randomString;
}

function shortStr($str,$len){
  if(strlen($str) > $len){
      return substr($str,0,$len)."...";
  }else{
     return $str;
  }
}
function urlStr($input) {
    // Trim leading and trailing spaces
    $trimmed = trim($input);
    
    // Replace multiple consecutive spaces with a single dash
    $formatted = preg_replace('/\s+/', '-', $trimmed);
    
    return strtolower($formatted);
}


function userData($id){
    global $connection;
    $id = mysqli_real_escape_string($connection,$id);
    $query = "SELECT * FROM `users` WHERE  `user_id`='".$id."' ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
        foreach($run as $row){
          $dob = DateTime::createFromFormat('Y-m-d', $row['dob']);
          $today = new DateTime();
          $row['age']  = $today->diff($dob)->y;
        return $row;
    }
    }
    return false;
}



function getListId($user,$party){
global $connection;
$query = "SELECT `cid` FROM `connections` WHERE party1='$user' && party2='$party' || party1='$party' && party2='$user'  ";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return $row['cid'];
}
}
return false;
}


function getLastMid($user,$party){
global $connection;
$query = "SELECT `last_mid` FROM `connections` WHERE party1='$user' && party2='$party' || party2='$user' && party1='$party'  ";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return $row['last_mid'];
}
}
return false;
}
function partnerUsername($user,$list_id){
    global $connection;
$query = "SELECT `party1`,`party2` FROM `connections` WHERE cid='$list_id' ";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return ($row['party1'] == $user)?$row['party2']:$row['party1'];
}
}
return false;
}
function party($user,$party){
    global $connection;
$query = "SELECT `party1`,`party2`  FROM `connections` WHERE party1='$user' && party2='$party' || party2='$user' && party1='$party'  ";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return ($row['party1'] == $user)?1:2;
}
}
return false;
}


function userLastReadMid($user,$list_id){
  global $connection;
  $query = "SELECT `mid`  FROM `messages` WHERE `list_id`='$list_id' && `user_id` !='$user' && `seen`=1 ORDER BY mid DESC LIMIT 1";
  $run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return $row['mid'];
}
}
return 0;
}

function userFirstUnreadMid($user,$list_id){
  global $connection;
  

  $query = "SELECT `mid`  FROM `messages` WHERE `list_id`='$list_id' && `user_id` !='$user' && `seen`=0 ORDER BY mid ASC LIMIT 1";
  $run = mysqli_query($connection,$query);
if($run->num_rows > 0){
foreach($run as $row){
return $row['mid'];
}
}
return 0;
}

function init_message($user,$party){
$return = [];
global $connection;
$list_id = getListId($user,$party);
$last_mid = getLastMid($user,$party);
$user_last_read = userLastReadMid($user,$list_id);
$join = false;

$query0 = "SELECT * FROM messages WHERE `mid` > ".$user_last_read." && `list_id`='$list_id' && `user_id` != '$user' && seen=0 LIMIT 1";

$key = userFirstUnreadMid($user,$list_id);


/*
$total_seen = mysqli_query($connection,"SELECT id FROM messages WHERE list_id='$list_id' && mid <= ".$last_mid);
$offset = $total_seen->num_rows - (1*20);

if($offset < 0){
$offset = 0;
}

$query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` <= ".$last_mid." ORDER BY date,time ASC LIMIT ".$offset.",20";
*/



/*
$query = "SELECT * FROM ( 
SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` <= ".$last_mid." ORDER BY date,time DESC LIMIT 0,20
) AS main ORDER BY date,time ASC";
*/

//$all = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` <= ".$last_mid;
//$total_rows = ($all->num_rows > 0)?$all->num_rows:0;
//$offset = $total_rows - (1 * 20);

$offset = 0;
$query = "SELECT * FROM (SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` <= ".$last_mid." ORDER BY mid DESC LIMIT ".$offset.",20) AS main ORDER BY mid ASC";

//SELECT * FROM `messages` where list_id ='someid2' order by mid DESC LIMIT 20, 5;

if($key > 0){
$join = true;


//$query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` <= ".$user_last_read." ORDER BY date,time ASC LIMIT 0,20 ";
//$key = userFirstUnreadMid($user,$list_id);


$query = "SELECT * FROM ( 
SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` < ".$key." ORDER BY mid DESC LIMIT 0,20
) AS main ORDER BY mid ASC";



/*
$total_seen = mysqli_query($connection,"SELECT id FROM messages WHERE list_id='$list_id' && mid > ".$key);
$offset = $total_seen->num_rows - (1*20);
if($offset < 0){
$offset = 0;
}
$query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` > ".$key." ORDER BY date,time ASC LIMIT ".$offset.",20";
 
 */
 
 $query1 = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` >= ".$key." ORDER BY mid ASC LIMIT 0,20";    
    
}

$init_msg = [];
   $unread_msg = [];
   $run = mysqli_query($connection,$query);
   
   if($run->num_rows > 0){
       foreach($run as $im){
       $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
          $init_msg[] = $im;
          
       }
      
   }
   
   if($join){
       $run1 = mysqli_query($connection,$query1);
        if($run1->num_rows > 0){
       foreach($run1 as $im){
       $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
    $im['time'] = date('h:i:s A',strtotime($im["time"]));
          $unread_msg[] = $im;
          
       }
      
   }
   
   }
   
  
 $im_join[] = [
              "mid"=>"",
              "message"=>($join && $run1->num_rows > 0)?$run1->num_rows." new messages.":"",
              "user_id"=>"",
              "list_id"=>$list_id,
              "seen"=>1,
              "time"=>"",
              "date"=>"",
               "side"=>'center'
              ]; 
  
return array_merge($init_msg,$im_join,$unread_msg);
}

function messageData($id,$list_id){
    global $connection;
    $id = mysqli_real_escape_string($connection,$id);
    $query = "SELECT * FROM `messages` WHERE  `mid`='".$id."' && `list_id`='$list_id' ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
        foreach($run as $row){
          
        return $row;
    }
    }
    return false;
}

function last_message($list_id){
    global  $connection;
    $return = [
        "message"=>"",
        "time"=>""
        ];
    $query = "SELECT last_mid from connections WHERE cid='".$list_id."' ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
        foreach($run as $row){
        $msg = messageData($row['last_mid'],$list_id);
          $return["message"] = shortStr($msg['message'],25);
      
          $return["time"] = date('h:i:s A',strtotime($msg["time"]));
          
    }
    }
    return $return;
}


function unread_messages($user_id,$list_id){
    global  $connection;
    $query = "SELECT id from messages WHERE list_id='".$list_id."' && user_id != '".$user_id."' && seen=0 ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
        return $run->num_rows;
    }
    return 0;
}
function is_list($message_list){
    
}
function timeElapsed($dateString) {
    $startTime = new DateTime($dateString); // Convert the given date string to DateTime
    $currentTime = new DateTime();         // Get the current time

    $interval = $startTime->diff($currentTime); // Get the difference as a DateInterval object

    // Calculate the total elapsed minutes
    $totalMinutes = ($interval->days * 24 * 60) + ($interval->h * 60) + $interval->i;

    // Display in a human-readable format
    if ($interval->days > 0) {
        return $interval->days . " days ago";
    } elseif ($interval->h > 0) {
        return $interval->h . " hours ago";
    } elseif ($interval->i > 0) {
        return $interval->i . " minutes ago";
    } else {
        return "just now";
    }
}


function is_username($key){
       global $connection;
    $key = mysqli_real_escape_string($connection,$key);
    $query = "SELECT `user_id` FROM `users` WHERE  `username`='".$key."' ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
       foreach($run as $row){
        return $row['user_id'];
       }
    }
    return false;
}
function liked($userid,$liked){
    global $connection;
     $query1 = "SELECT * FROM `likes` WHERE `user_id`='".$userid."' && `liked`='".$liked."' ";
     $run = mysqli_query($connection,$query1);
     return ($run->num_rows > 0)?true:false;
}
function is_userid($key){
       global $connection;
    $key = mysqli_real_escape_string($connection,$key);
    $query = "SELECT `user_id` FROM `users` WHERE  `user_id`='".$key."' ";
    $run = mysqli_query($connection,$query);
    if($run->num_rows > 0){
       foreach($run as $row){
        return true;
       }
    }
    return false;
}

function is_state($key){
       global $nigeria;
return (isset($nigeria[$key]))?true:false;
}

function is_city($key){
return true;
}



//echo Json_encode(init_message("OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6","PqzXuatBDYLwZzBmE1lF8oS2GaHS2H"));

//echo userFirstUnreadMid("OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6","someid2");

//print_r(init_message("OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6","PqzXuatBDYLwZzBmE1lF8oS2GaHS2H"));

//print_r(last_message("someid2"));