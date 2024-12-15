<?php
// Establishing Connection with Server

include 'pages/dbcon.php';

// Set the default timezone
date_default_timezone_set("Asia/Manila");

// Function to verify the code
function verifyCode($userInputCode) {
    global $con;

    // Fetch the code and token for user with id=1
    $query = "SELECT code, token FROM tbluser WHERE id=1";
    $result = mysqli_query($con, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $storedCode = $row['code'];
        $token = $row['token'];

        // Compare the stored code with the user input
        if ($storedCode === $userInputCode) {
            // Redirect to index.php with the token if the code matches
            header("Location: ../login.php?token=" . urlencode($token));
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