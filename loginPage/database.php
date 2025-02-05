<?php
$host = "35.239.115.242";
$dbname = "project";
$username = "Git";
$password = "MZXfnC2lX6E3v";
$mysqli = new mysqli(hostname: $host,
                     username: $username,
                     password: $password,
                     database: $dbname);

if($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}
return $mysqli;