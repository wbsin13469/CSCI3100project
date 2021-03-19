<?php


include("sql.php");
$mysqli = GETSQLLink();
$email = trim($_POST['email']);
$username = trim($_POST['username']);
$password = trim($_POST['password']);
$query = "SELECT * FROM user";
$res = $mysqli->query($query);
if($res->num_rows > 0){
    $query = "SELECT MAX(userID) as max FROM user";
    $res = $mysqli->query($query);
    $row = $res->fetch_object();
    $id = $row->max +1 ;

}else{
    $id = 0 ;
}

$insert = "insert into user (userID, username, password, email)
        values($id, '$username','$password', '$email')";
$mysqli->query($insert);
$mysqli->close();
echo "<div class='msg'> User Registration Complete</div>";

?>