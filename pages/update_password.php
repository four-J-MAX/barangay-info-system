<?php
// Establishing Connection with Server
include 'dbcon.php';
date_default_timezone_set("Asia/Manila");

// Check if the request method is POST and the new password is set
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['new_password'])) {
    $newPassword = $_POST['new_password'];

    // Hash the new password
    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

    // Update the password in the database for user with id=1
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
} else {
    echo json_encode([
        'icon' => 'error',
        'title' => 'Invalid Request',
        'text' => 'Invalid request method or missing parameters.'
    ]);
}

// Close the database connection
mysqli_close($con);
?>