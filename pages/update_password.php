<?php

include 'connection.php';
// Check if token is provided in the URL
if (!isset($_GET['token'])) {
    header("Location: 404.php");
    exit();
}

$token = $_GET['token'];

// Fetch the token from the database for user with id=1
$query = "SELECT token FROM tbluser WHERE id = 1";
$result = mysqli_query($con, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $dbToken = $row['token'];

    // Check if the token matches
    if ($token === $dbToken) {
        // Get the new password from the POST request
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['new_password'])) {
            $newPassword = $_POST['new_password'];

            // Hash the new password
            $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

            // Update the password in the database
            $updateQuery = "UPDATE tbluser SET password = '$hashedPassword' WHERE id = 1";
            if (mysqli_query($con, $updateQuery)) {
                echo json_encode([
                    'icon' => 'success',
                    'title' => 'Password Updated',
                    'text' => 'Your password has been successfully updated.'
                ]);
            } else {
                echo json_encode([
                    'icon' => 'error',
                    'title' => 'Update Failed',
                    'text' => 'Failed to update the password. Please try again.'
                ]);
            }
        }
    } else {
        // Token does not match, redirect to 404
        header("Location: 404.php");
        exit();
    }
} else {
    // No user found or query failed, redirect to 404
    header("Location: 404.php");
    exit();
}

// Close the database connection
mysqli_close($con);
?>