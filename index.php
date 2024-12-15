<?php
session_start();

// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

function clean($data)
{
    return htmlspecialchars(stripslashes(trim($data)));
}


include 'pages/connection.php';

// Check if the user is logged in
if (!isset($_SESSION['username']) && !isset($_SESSION['role']) && !isset($_SESSION['userid']) && !isset($_SESSION['barangay'])) {
    header('Location: login.php');
    exit();
}

// Check if the URL contains a token parameter
if (isset($_GET['token'])) {
    $urlToken = clean($_GET['token']);

    // Retrieve the token from the database for user with id=1
    $stmt = $con->prepare("SELECT token FROM tbluser WHERE id = 1");
    if (!$stmt) {
        die("Prepare failed: (" . $con->errno . ") " . $con->error);
    }
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $dbToken = $row['token'];

        // Compare the URL token with the database token
        if ($urlToken !== $dbToken) {
            // Redirect to two_factor_auth.php if they do not match
            header("Location: pages/two_factor_auth.php");
            exit();
        }
    } else {
        // If no user found, redirect to two_factor_auth.php
        header("Location: pages/two_factor_auth.php");
        exit();
    }
} else {
    // If no token parameter in URL, redirect to two_factor_auth.php
    header("Location: pages/two_factor_auth.php");
    exit();
}

// Rest of your index.php content goes here
?>