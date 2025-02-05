<?php
$host = "35.239.115.242";
$dbname = "project";
$username = "Git";
$password = "MZXfnC2lX6E3v";
$mysqli = new mysqli($host, $username, $password, $dbname);

if ($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}

$data = json_decode(file_get_contents("php://input"));
$id = $data->id;

$sql = "DELETE FROM concerts WHERE id = $id";
$mysqli->query($sql);

echo json_encode(['status' => 'success']);
?>
