<?php
session_start();
if(isset($_SESSION["user_id"])) {
    $mysqli = require __DIR__ . "/loginPage/database.php";
    $sql = "SELECT * FROM user
            WHERE id = {$_SESSION["user_id"]}";    
    $result = $mysqli->query($sql);
    $user = $result->fetch_assoc();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="main/styles.css">
</head>
<body>
    <?php if (isset($user)): ?>
        <h1 class="glow">Hello <?= htmlspecialchars($user["name"]) ?>!</h1>
        <p><a href="main/main.html">Return to Event Nostalgia</a> or <a href="loginPage/logout.php">Log out</a></p>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <p><a href="adminPage/admin.html">Admin Page</a></p>
    <?php else: ?>
        <h1 class="glow">Welcome to Event Nostalgia!</h1>
        <p><a href="loginPage/login.php">Log in</a> or <a href="loginPage/signup.html">Sign up</a></p>
    <?php endif; ?>
</body>
</html>