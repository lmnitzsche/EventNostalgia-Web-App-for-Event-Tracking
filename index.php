<?php
session_start();
if(isset($_SESSION["user_id"])) {
    $mysqli = require __DIR__ . "/loginPage/database.php";
    $sql = "SELECT * FROM user
            WHERE id = {$_SESSION["user_id"]}";    
    $result = $mysqli->query($sql);
    $user = $result->fetch_assoc();
    
    // Admin User IDS
    $allowedUserIds = ["1", "13", "14"];
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <link rel="icon" href="images/lmn.png" type="image/png">
    <link rel="apple-touch-icon" href="images/lmn.png">
    <link rel="stylesheet" href="main/styles.css">
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-4880288893316569"
     crossorigin="anonymous"></script>
</head>
<body>
    <?php if (isset($user)): ?>
        <h1 class="glow">Hello <?= htmlspecialchars($user["name"]) ?>!</h1>
        <p><a href="main/main.html">Return to Event Nostalgia</a> or <a href="loginPage/logout.php">Log out</a></p>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <?php if (in_array($_SESSION["user_id"], $allowedUserIds)): ?>
            <p><a href="adminPage/admin.html">Admin Page</a></p>
        <?php endif; ?>
    <?php else: ?>
        <br><br><br><br><br><br><br><br><br><br><br>
        <h1 style="font-size: 4em; margin: 20px 0;">
        Welcome to Event Nostalgia!
        </h1>
        <p style="font-family: 'Roboto', sans-serif; font-size: 2em; margin: 20px 0;">
        <a href="loginPage/login.php" style="margin: 0 15px; font-weight: bold;">Log in</a>, 
        <a href="loginPage/signup.html" style="margin: 0 15px; font-weight: bold;">Sign up</a>, 
        or 
        <a href="main/main.html" style="margin: 0 15px; font-weight: bold;">Continue as a guest</a>
        </p>
    <?php endif; ?>
</body>
</html>