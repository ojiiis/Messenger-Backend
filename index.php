<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: content-type,token');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Content-Type: application/json');
date_default_timezone_set("Africa/Lagos");
session_start();
include "0/love_schemma.php";
include "0/nigeria.php";
include "0/main.php";

$_REQ = [];
$_RES = [
  'status'=>1,
  'data'=>[],
  'error'=>[],
  'devError'=>[]
    ];
$parse = explode('?',$_SERVER['REQUEST_URI']);
$_REQ['url'] = explode("love",$parse[0])[1];
$_REQ['query'] = (count($parse) > 1)?$parse[1]:'';


$data = file_get_contents("php://input");
try{
    $data = json_decode($data,1);
}catch(EXECPTION $e){
    $data = json_decode('[]',1);
}
if(is_array($data)){
foreach($data as $key => $value){
$data[$key] = (!is_array($value))?mysqli_real_escape_string($connection,$value):$value;
}
}
//Route:
//emapi/list/(user_id):/(page_number)
if($_REQ['url'] == "/emapi/test/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/test" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
    $_RES['data'] = init_message($_SERVER['HTTP_TOKEN'],$data['user_id']);
    $_RES['route'] = "Hello world";
    
    //$_RES['data'] = $data;
    
}



/*

if($_REQ['url'] == "/emapi/messages/down" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/messages/down/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
  //  $_RES['data'] = init_message($_SERVER['HTTP_TOKEN'],$data['user_id']);
 //   $_RES['route'] = "Hello world";
    
    //$_RES['data'] = $data;
    
    
    $list_id = $data['list_id'];
$key = $data['key'];
$query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` > ".$key." ORDER BY mid ASC LIMIT 0,20";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){

foreach($run as $im){
      $side = ($im["user_id"] != $_SERVER['HTTP_TOKEN'])?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
}

}else{
     $_RES["status"] = 0;
   }

    
}
*/



if($_REQ['url'] == "/emapi/messages/up" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/messages/up/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
   // $_RES['data'] = init_message($_SERVER['HTTP_TOKEN'],$data['user_id']);
  //  $_RES['route'] = "Hello world";
    
    $_RES['test'] = $data;
    $list_id = $data['list_id'];
$key = $data['key'];
$query = "SELECT * FROM ( 
SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` < ".$key." ORDER BY mid DESC LIMIT 0,20
) AS main ORDER BY mid ASC";
$run = mysqli_query($connection,$query);
if($run->num_rows > 0){

foreach($run as $im){
      $side = ($im["user_id"] != $_SERVER['HTTP_TOKEN'])?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
}

}else{
     $_RES["status"] = 0;
   }
}



if($_REQ['url'] == "/emapi/new-messages/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/new-messages" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
   // $_RES['data'] = init_message($_SERVER['HTTP_TOKEN'],$data['user_id']);
   // $_RES['route'] = "Hello world";
    
    //$_RES['data'] = $data;
    $_RES["data"] = [];
$list_id = $data['cid'];
$new = userFirstUnreadMid($_SERVER['HTTP_TOKEN'],$list_id);
if($new > 0){
   $query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` >= ".$new." ORDER BY mid ASC";
   $run = mysqli_query($connection,$query);
   foreach($run as $im){
        $side = ($im["user_id"] != $_SERVER['HTTP_TOKEN'])?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
    mysqli_query($connection,"UPDATE `messages` SET seen=1 WHERE id='".$im["id"]."' ");
   }

}else{
     $_RES["status"] = 0;
   }

   
}


if($_REQ['url'] == "/emapi/seen/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/seen" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
    $_RES['data'] = "Seen Registered.";
   
    //$query = "UPDATE `messages` SET `seen`=1 WHERE `list_id`='{$data["lid"]}' &&  `mid`='{$data["mid"]}'  ";
   $query = "UPDATE `messages` SET `seen`=1 WHERE `list_id`='{$data["lid"]}'  ";
    
    
    
    mysqli_query($connection,$query);
    

    
}


if($_REQ['url'] == "/emapi/send_message/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/send_message" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
 
 
if(strlen($data["message"]) > 0 && $data["message"] != ""){    
$last_mid = getLastMid($_SERVER["HTTP_TOKEN"],$data["pid"]);
$list_id = (getListId($_SERVER["HTTP_TOKEN"],$data["pid"]))?getListId($_SERVER["HTTP_TOKEN"],$data["pid"]):connectUsers($_SERVER["HTTP_TOKEN"],$data["pid"]);
$mid = $last_mid + 1;
$query1 = "INSERT INTO `messages` (`list_id`, `mid`, `user_id`, `message`) VALUES('$list_id','$mid','{$_SERVER["HTTP_TOKEN"]}','{$data["message"]}') ";
$query2 = "UPDATE `connections` SET `last_mid`='$mid', last_active='".strtotime("now")."' WHERE `cid`='$list_id' ";
mysqli_query($connection,$query1);
mysqli_query($connection,$query2);
$d = [];
$er =  "Error sending message.";
$query3 = "SELECT * FROM `messages` WHERE `mid`='$mid' && `list_id`='$list_id' ";
$run3 = mysqli_query($connection,$query3);
if($run3->num_rows > 0){
    foreach($run3 as $row){
       $row['time'] = date('h:i:s A',strtotime($row["time"]));
       $d = $row;  
       $er =  "Message sent.";
    }
}
$_RES["message"] = $er;
$_RES["data"] = $d;

}else{
$_RES["message"] = 'Server regected message';
$_RES["data"] = [];
} 
 
    
}



if(preg_match("/\/emapi\/list\/([0-9])+/",$_REQ['url'],$match) && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
    $offset = ($match[1] - 1) * 10;
   $query = "SELECT * FROM `connections` WHERE `party1`='".$_SERVER['HTTP_TOKEN']."' || `party2`='".$_SERVER['HTTP_TOKEN']."' ORDER BY last_active DESC LIMIT ".$offset.",10" ;
   $run = mysqli_query($connection,$query);
  if($run->num_rows > 0){
       foreach($run as $rows){
           $return_user_id = ($rows["party1"] == $_SERVER['HTTP_TOKEN'])?$rows["party2"]:$rows["party1"];
           $return_user_data = userData($return_user_id);
           $last_message = last_message($rows["cid"]);
          
          $init_msg = init_message($_SERVER['HTTP_TOKEN'],$return_user_id);

           
       $_RES['data'][] = [
             "id"=> $rows["id"],
             "user_id"=> $return_user_id,
             "list_id"=>$rows["cid"],
             "avi"=>explode(",",$return_user_data['media'])[0],
             "fullname"=>$return_user_data['fullname'],
             "last_message"=>$last_message["message"],
             "last_message_date"=>$last_message["time"],
             "unread_messages_count"=>unread_messages($_SERVER['HTTP_TOKEN'],$rows["cid"]),
             "init_messages"=>$init_msg
               ];
   }
  }else{
     $_RES['data'] = []; 
  }
  
}


if(preg_match("/\/emapi\/messages\/read\/([a-zA-Z0-9]+)\/([0-9])+/",$_REQ['url'],$match) && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
  
     $offset = ($match[2] - 1) *20;
      $query = "SELECT * FROM `messages` WHERE `seen`=1 && `list_id`='".$match[2]."' ORDER BY date DESC LIMIT ".$offset.",20" ;
   $run = mysqli_query($connection,$query);
   if($run->num_rows > 0){
       foreach($run as $rows){
          $_RES['data'][] = [
              "mid"=>$rows['mid'],
              "message"=>$rows['message'],
              "user_id"=>$rows['user_id'],
              "seen"=>$rows['seen'],
              "time"=>$rows['time'],
              "date"=>$rows['date'],
              "side"=>($rows["user_id"] != $_SERVER["HTTP_TOKEN"])?'other':'',
              ]; 
       }
      
   }
   

}

if(preg_match("/\/emapi\/messages\/unread\/([a-zA-Z0-9]+)\/([0-9])+/",$_REQ['url'],$match) && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
  
     $offset = ($match[2] - 1) *20;
      $query = "SELECT * FROM `messages` WHERE `seen`=0 && `list_id`='".$match[2]."' && `user_id` !='".$_SERVER['HTTP_TOKEN']."' ORDER BY date DESC LIMIT ".$offset.",20" ;
   $run = mysqli_query($connection,$query);
   if($run->num_rows > 0){
       foreach($run as $rows){
          $_RES['data'][] = [
              "mid"=>$rows['mid'],
              "message"=>$rows['message'],
              "user_id"=>$rows['user_id'],
              "seen"=>$rows['seen'],
              "time"=>$rows['time'],
              "date"=>$rows['date'],
               "side"=>($rows["user_id"] != $_SERVER["HTTP_TOKEN"])?'other':''
              ]; 
       }
      
   }
   

}
//user media
if($_REQ['url'] == "/" || $_REQ['url'] == ""){
    $_RES['data'] = [];
    
  
    if(isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){
        $userdata = userData($_SERVER['HTTP_TOKEN']);
    $_RES['user'] = $userdata;
     if($userdata['gender'] != "" && $userdata['media'] !="" && explode(",",$userdata['media'])[1] != ""){
                      $_RES['redirect'] = 'home';
                  }else if($userdata['gender'] == ""){
                      $_RES['redirect'] = 'let-know-you';
                  }else if($userdata['media'] == "" ||  explode(",",$userdata['media'])[1] == ""){
                      $_RES['redirect'] = 'add-media';
                  }
    $query  = "SELECT `user_id`,`fullname`,`dob`,`state`,`city`,`gender`,`lookingfor`,`about`,`media`,`date` FROM users WHERE `media` != '' && `user_id`!='".$_SERVER['HTTP_TOKEN']."' ORDER BY `date` DESC LIMIT 40";
    $run = mysqli_query($connection,$query);
     if($run->num_rows > 0){
         foreach($run as $rows){
             $dob = DateTime::createFromFormat('Y-m-d', $rows['dob']);
          $today = new DateTime();
          $rows['age']  = ($dob)?$today->diff($dob)->y:'';
          $rows['liked'] = liked($_SERVER['HTTP_TOKEN'],$rows['user_id']);
            $_RES['data'][] = $rows; 
            
         }
     }
     $_RES['status'] = 1; 
    }else{
        $_RES['status'] = 0; 
     }
}

if($_REQ['url'] == "/signin" || $_REQ['url'] == "signin" && isset($data['email']))
{
    $errors = [];
      $query = "SELECT * FROM users WHERE email='{$data['email']}' ";  
      $check = mysqli_query($connection,$query);
      if($check->num_rows > 0){
          foreach($check as $rows){
              if(password_verify($data['password'],$rows['password'])){
                  $_RES['token'] = $rows['user_id'];
                  if($rows['gender'] != "" && $rows['media'] !="" && explode(",",$rows['media'])[1] != ""){
                      $_RES['redirect'] = 'home';
                  }else if($rows['gender'] == ""){
                      $_RES['redirect'] = 'let-know-you';
                  }else if($rows['media'] == "" || explode(",",$rows['media'])[1] == ""){
                      $_RES['redirect'] = 'add-media';
                  }
                  
                  $_RES['data'] = userData($_RES['token']);
              }else{
    $errors[] = "Invalid login details.";
    $_RES['status'] = 0;
              }
          }
          
      }else{
    $errors[] = "Invalid login details.";
    $_RES['status'] = 0;
    }
   $_RES['error'] = $errors; 
}
if($_REQ['url'] == "/signup" || $_REQ['url'] == "signup"){
    $errors = [];
    // Validate email
if (empty($data['email']) || !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Invalid email address.";
    $_RES['status'] = 0;
}

// Validate fullname
if (empty($data['fullname']) || strlen(trim($data['fullname'])) < 3) {
    $errors[] = "Fullname must be at least 3 characters long.";
    $_RES['status'] = 0;
}

// Validate password (minimum 8 characters, at least one letter and one number)
if (empty($data['password']) || strlen($data['password'])  < 8) {
    $errors[] = "Password must be at least 8 characters long.";
    $_RES['status'] = 0;
}

// Validate date of birth (check if age is at least 18)
if (empty($data['dob'])) {
    $errors[] = "Date of birth is required.";
    $_RES['status'] = 0;
} else {
    $dob = DateTime::createFromFormat('Y-m-d', $data['dob']);
    $today = new DateTime();
    $age = $today->diff($dob)->y;
 
    if ($age < 18) {
        $errors[] = "You must be at least 18 years old.";
        $_RES['status'] = 0;
    }
}

if (empty($data['state']) || empty($data['city'])) {
    $errors[] = "Kindly provide where you live.";
    $_RES['status'] = 0;
}
$exisiting = mysqli_query($connection,"SELECT `email` FROM `users` WHERE email='{$data['email']}' ");
if($exisiting->num_rows > 0){
     $errors[] = "A user with this email already exist.";
     $_RES['status'] = 0;
}
  if($_RES['status'] == 1){
        $uid = uid(30);
        $password = password_hash($data['password'],PASSWORD_DEFAULT);
    $query  = "INSERT INTO users (user_id, email, password, fullname, dob, state, city) VALUES (
    '$uid', 
    '{$data['email']}', 
    '{$password}', 
    '{$data['fullname']}', 
    '{$data['dob']}', 
    '{$data['state']}', 
    '{$data['city']}'
)";
mysqli_query($connection,$query);
$_RES['data'] = $data['fullname'];
$_RES['redirect'] = 'let-know-you';
$_RES['token'] = $uid;
  }

$_RES['error'] = $errors; 
     
     
}

if($_REQ['url'] == "/let-know-you" || $_REQ['url'] == "/let-know-you/"){
     $errors = [];
    if(isset($_SERVER['HTTP_TOKEN']) && is_userid($_SERVER['HTTP_TOKEN'])){
try{
            $uid = (isset($_SERVER['HTTP_TOKEN']))?$_SERVER['HTTP_TOKEN']:'';
         $query = "UPDATE users SET 
    gender = '{$data['gender']}', 
    lookingfor = '{$data['lookingfor']}', 
    about = '{$data['about']}'
WHERE user_id = '$uid' ";
mysqli_query($connection,$query);
$_RES['redirect'] = 'add-media';
$_RES['token'] = $uid;   
}catch(exeptional $e){
   $_RES['devError'] = [];
    $_RES['devError'][] = $e; 
} 
    }else{
        $_RES['status'] = 0; 
        $errors[] = "Invalid token";
    }
   $_RES['error'] = $errors; 
}


if($_REQ['url'] == "/add-media" || $_REQ['url'] == "/add-media/"){
    if(isset($_SERVER["HTTP_TOKEN"]) && is_array(userData($_SERVER["HTTP_TOKEN"]))){
        $userdata = userData($_SERVER["HTTP_TOKEN"]);
    if(count(explode(",",$userdata['media'])) == 4){
         $_RES['status'] = 0; 
       $_RES['error'][] = "You can only upload maximum of 4 images.";
    }    
   
    $newName = uid(37).".".pathinfo($_FILES['media']["name"], PATHINFO_EXTENSION);
    if(!in_array(strtolower(pathinfo($_FILES['media']["name"], PATHINFO_EXTENSION)), ['jpeg', 'png', 'jpg','gif'])){
       $_RES['status'] = 0; 
       $_RES['error'][] = "Invalid image format. only jpeg, png and gif image format is allowed.";
    }
    if($_RES['status'] == 1){
       if(move_uploaded_file($_FILES['media']['tmp_name'],'media/'.$newName)){
           $_RES['data'] = $newName;
            $newmedia = ($userdata['media'] == "")?$newName:$userdata['media'].','.$newName;
            mysqli_query($connection,"UPDATE users SET media='".$newmedia."' WHERE user_id='".$_SERVER["HTTP_TOKEN"]."' ");
            $_RES['current_media'] = $newmedia; 
       }else{
           $_RES['status'] = 0; 
           $_RES['error'][] = "Internal error, try again later.";
       }
       
    }
    
    }
}

if($_REQ['url'] == "/like" || $_REQ['url'] == "/like/"){
    $_RES['data'] = [];
    if(isset($_SERVER['HTTP_TOKEN'])){
        $query1 = "SELECT * FROM `likes` WHERE `user_id`='".$_SERVER['HTTP_TOKEN']."' && `liked`='".$data['user']."' ";
        $run = mysqli_query($connection,$query1);
        if($run->num_rows > 0){
            mysqli_query($connection,"DELETE FROM `likes` WHERE `user_id`='".$_SERVER['HTTP_TOKEN']."' && `liked`='".$data['user']."' ");
            $_RES['data'] = 0;
        }else{
            mysqli_query($connection,"INSERT INTO `likes`(`user_id`, `liked`) VALUES ('".$_SERVER['HTTP_TOKEN']."','".$data['user']."') ");
             $_RES['data'] = 1;
        }
    }
}


if($_REQ['url'] == "/emapi/delete_media/" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN'])) || $_REQ['url'] == "/emapi/delete_media" && isset($_SERVER['HTTP_TOKEN']) && is_array(userData($_SERVER['HTTP_TOKEN']))){

   
 $medias =  userData($_SERVER['HTTP_TOKEN'])['media'];
 $media_array =  explode(",",$medias);
 $media = $media_array[$data["i"]];
 try{
 unlink('media/'.$media);
 $newMeda_array = [];
 foreach($media_array as $m){
 if($m != $media){
 $newMeda_array[] = $m;
 }
 }
 $newMeda = implode(",",$newMeda_array);
 $query = "UPDATE `users` SET `media`='$newMeda' WHERE `user_id`='{$_SERVER["HTTP_TOKEN"]}' ";
 mysqli_query($connection,$query);
 }catch(EXECPTIONAL $e){
 $_RES["status"] = 0;
 $_RES["error"][] = $e;
 }
   
 }



if($_REQ['url'] == "/keep" || $_REQ['url'] == "/keep/"){
    $_RES['data'] = [];
    $query1 = "";
    $run = mysqli_query($connection,$query1);
}
if($_REQ['url'] == "/nigeria" || $_REQ['url'] == "/nigeria/"){
    $_RES['data'] = $nigeria;
}

if(preg_match('/\/nigeria\/([A-Za-z_\- ]+)/',urldecode($_REQ["url"]),$g)){
    //echo "this is it ".$g[1];
    $key = ucfirst($g[1]); 

    $_RES['data'] = (isset($nigeria[$key]))?$nigeria[ucfirst($g[1])]:[$_REQ["url"]];
    
}

/*
if(in_array(1,explode("nigeria/",$_REQ['url'])) && explode("nigeria/",$_REQ['url'])[1] != ""){
   $_RES["test"] = ucfirst(explode("nigeria/",$_REQ['url'])[1]);
   $_RES['data'] = (isset($nigeria[ucfirst(explode("nigeria/",$_REQ['url'])[1])]))?$nigeria[ucfirst(explode("nigeria/",$_REQ['url'])[1])]:[];
}

*/


//echo explode("nigeria/",$_REQ['url'])[1]

function utf8ize($data) {
    if (is_array($data)) {
        foreach ($data as $key => $value) {
            $data[$key] = utf8ize($value);
        }
    } elseif (is_string($data)) {
        $data = mb_convert_encoding($data, 'UTF-8', 'UTF-8');
        return preg_replace('/[^\x{0000}-\x{10FFFF}]/u', '', $data); 
    }
    return $data;
}

$_RES = utf8ize($_RES);
$json = json_encode($_RES);

if ($json === false) {
    echo '{"status":0,"error":["Server error: ' . json_last_error_msg().'"]}';
} else {
    echo $json;
}







/*
if($REQ["url"] ){
//listen to new message.
$_RES["data"] = [];
$list_id = $data['cid'];
$new = userFirstUnreadMid($_SERVER['HTTP_TOKEN'],$list_id);
if($new > 0){
   $query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` >= ".$new." ORDER BY mid ASC";
   if($run->num_rows > 0){

foreach($run as $im){
      $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
}

}else{
     $_RES["status"] = 0;
   }
   foreach($query as $im){
        $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
    
   }else{
     $_RES["status"] = 0;
   }

}


}


if(){
// messages/up
$list_id = $data['list_id'];
$key = $data['key'];
$query = "SELECT * FROM ( 
SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` < ".$key." ORDER BY mid DESC LIMIT 0,20
) AS main ORDER BY mid ASC";

if($query->num_rows > 0){

foreach($query as $im){
      $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
}

}else{
     $_RES["status"] = 0;
   }


}


if(){

// messages/down
$list_id = $data['list_id'];
$key = $data['key'];
$query = "SELECT * FROM `messages` WHERE `list_id`='".$list_id."' && `mid` > ".$key." ORDER BY mid ASC LIMIT 0,20";

if($query->num_rows > 0){

foreach($query as $im){
      $side = ($im["user_id"] != $user)?'other':'';
       $status = ($im["seen"] != 1)?'sent':'seen';
    
          $im['side'] = $side;
          $im['seen'] = $status;
       $im['time'] = date('h:i:s A',strtotime($im["time"]));
    $_RES["data"][] = $im;
}

}else{
     $_RES["status"] = 0;
   }




}

*/