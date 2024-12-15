<?php
// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Establishing Connection with Server by passing inputs as a parameter
$con = mysqli_connect('127.0.0.1', 'u510162695_barangay', '1Db_barangay', 'u510162695_barangay');

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Set the default timezone
date_default_timezone_set("Asia/Manila");
?>