<?php
$host = "localhost";
$dbname = "u545255404_en";
$username = "u545255404_lmnitzsche";
$password = "Loganlmn75!";
$mysqli = new mysqli(hostname: $host,
                     username: $username,
                     password: $password,
                     database: $dbname);

if($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}
return $mysqli;