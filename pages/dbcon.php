<?php

// Establishing Connection with Server
$con = mysqli_connect('127.0.0.1', 'u510162695_barangay', '1Db_barangay', 'u510162695_barangay');

if (!$con) {
    die(json_encode(['icon' => 'error', 'title' => 'Database Error', 'text' => 'Failed to connect to the database.']));
}


?>