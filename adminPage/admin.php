<?php
$host = "localhost";
$dbname = "project";
$username = "root";
$password = "root";
$mysqli = new mysqli($host, $username, $password, $dbname);

if($mysqli->connect_errno) {
    die("Connection error: " . $mysqli->connect_error);
}

if(isset($_POST['add_user'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO user(name, email, password_hash) VALUES('$name', '$email', '$password')";
    $mysqli->query($sql);
}

$usersResult = $mysqli->query("SELECT * FROM user");

if(isset($_POST['update_user'])) {
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
    $new_name = isset($_POST['new_name']) ? $_POST['new_name'] : null;

    if($user_id !== null && $new_name !== null) {
        $sql = "UPDATE user SET name = '$new_name' WHERE id = $user_id";
        $mysqli->query($sql);
    }
}

if(isset($_POST['update_email'])) {
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
    $new_email = isset($_POST['new_email']) ? $_POST['new_email'] : null;

    if($user_id !== null && $new_email !== null) {
        $sql = "UPDATE user SET email = '$new_email' WHERE id = $user_id";
        $mysqli->query($sql);
    }
}

if(isset($_POST['update_password'])) {
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
    $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : null;

    if($user_id !== null && $new_password !== null) {
        $new_password_hash = password_hash($new_password, PASSWORD_DEFAULT);
        $sql = "UPDATE user SET password_hash = '$new_password_hash' WHERE id = $user_id";
        $mysqli->query($sql);
    }
}

if(isset($_POST['delete_user'])) {
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;

    if($user_id !== null) {
        $sql = "DELETE FROM user WHERE id = $user_id";
        $mysqli->query($sql);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="../main/styles.css">
    <style>
        .container {
            text-align: center;
        }
    </style>
    <title>Admin Page</title>
</head>
<body>
    <div class="w3-container container">
        <h1><u>Admin Terminal</u></h1>
        <br>
        <h3>Add User</h3>
        <form method="post" action="">
            <label for="name">Name:</label>
            <input type="text" name="name" required>
            <br><br>
            <label for="email">Email:</label>
            <input type="text" name="email" required>
            <br><br>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
            <br><br>
            <button type="submit" name="add_user">Add User</button>
        </form>
        <br><br><br>
        <h3>Users</h3>
        <div class="w3-margin container">
            <table border="1">
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                <?php while($user = $usersResult->fetch_assoc()) { ?>
                    <tr>
                        <td><?= $user['id'] ?></td>
                        <td><?= $user['name'] ?></td>
                        <td><?= $user['email'] ?></td>
                        <td>
                            <form method="post" action="">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <label for="new_name">New Name:</label>
                                <input type="text" name="new_name" required>
                                <br><br>
                                <button type="submit" name="update_user">Update Name</button>
                            </form>
                            <form method="post" action="">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <label for="new_email">New Email:</label>
                                <input type="text" name="new_email" required>
                                <br><br>
                                <button type="submit" name="update_email">Update Email</button>
                            </form>
                            <form method="post" action="">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <label for="new_password">New Password:</label>
                                <input type="password" name="new_password" required>
                                <br><br>
                                <button type="submit" name="update_password">Update Password</button>
                            </form>
                            <form method="post" action="" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <button type="submit" name="delete_user">Delete</button>
                            </form>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </div>
        <a href="admin.html">Return</a>
    </div>
</body>
</html>
