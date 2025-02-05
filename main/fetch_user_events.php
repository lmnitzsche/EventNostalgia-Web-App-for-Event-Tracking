<?php
$host = "35.239.115.242";
$dbname = "project";
$username = "Git";
$password = "MZXfnC2lX6E3v";
$mysqli = new mysqli($host, $username, $password, $dbname);

if ($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}

function getUserId() {
    session_start();

    if (isset($_SESSION['user_id'])) {
        return $_SESSION['user_id'];
    } else {
        return null;
    }
}

$user_id = getUserId();

$eventsResult = $mysqli->query("SELECT * FROM events WHERE user_id = $user_id");
$events = [];
while ($row = $eventsResult->fetch_assoc()) {
    $events[] = $row;
}

$concertsResult = $mysqli->query("SELECT * FROM concerts WHERE user_id = $user_id");
$concerts = [];
while ($row = $concertsResult->fetch_assoc()) {
    $concerts[] = $row;
}

echo json_encode(['events' => $events, 'concerts' => $concerts]);
?>
