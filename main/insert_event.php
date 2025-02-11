<?php
$env = parse_ini_file(__DIR__ . '/../.env');

$host = $env['DB_HOST'];
$dbname = $env['DB_NAME'];
$username = $env['DB_USER'];
$password = $env['DB_PASS'];
$mysqli = new mysqli($host, $username, $password, $dbname);

if($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}

$data = json_decode(file_get_contents("php://input"));

function getUserId() {
    session_start();

    if(isset($_SESSION['user_id'])) {
        return $_SESSION['user_id'];
    } else {
        return null;
    }
}
$user_id = getUserId();

$name = $data->name;
$date = $data->date;
$description = $data->description;
$rating = $data->rating;
$venue = $data->venue;

$sql = "INSERT INTO events(user_id, name, venue, date, rating, description) VALUES ($user_id, '$name', '$venue', '$date', $rating, '$description')";
$mysqli->query($sql);

echo json_encode(['status' => 'success']);
?>
