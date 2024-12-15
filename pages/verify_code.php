<?php
// Establishing Connection with Server
$con = mysqli_connect('127.0.0.1', 'u510162695_barangay', '1Db_barangay', 'u510162695_barangay') or die(mysqli_error($con));

// Set the default timezone
date_default_timezone_set("Asia/Manila");

// Function to verify the code
function verifyCode($userInputCode) {
    global $con;

    // Fetch the verification code for user with id=1
    $query = "SELECT verification FROM tbluser WHERE id=1";
    $result = mysqli_query($con, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $storedCode = $row['verification'];

        // Compare the stored code with the user input
        if ($storedCode === $userInputCode) {
            // Redirect to login page if the code matches
            header("Location: ../login.php");
            exit();
        } else {
            // Return an error message if the code does not match
            return "Verification code does not match.";
        }
    } else {
        // Return an error message if the user is not found
        return "User not found.";
    }
}

// Assuming the user input is received via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userInputCode = $_POST['verification_code'];

    // Call the verifyCode function
    $message = verifyCode($userInputCode);

    // If there's an error message, display it
    if ($message) {
        echo "<script>alert('$message');</script>";
    }
}
?>