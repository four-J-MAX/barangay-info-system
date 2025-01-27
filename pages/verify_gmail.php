<?php
session_start();
require '../vendor/autoload.php'; // Ensure PHPMailer is autoloaded

// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'dbcon.php';
if (!$con) {
    echo json_encode(['icon' => 'error', 'title' => 'Database Error', 'text' => 'Failed to connect to the database.']);
    exit;
}

date_default_timezone_set("Asia/Manila");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($con, $_POST['email']);

    // Initialize session variables if not set
    if (!isset($_SESSION['attempts'])) {
        $_SESSION['attempts'] = 0;
        $_SESSION['last_attempt_time'] = time();
    }

    $cooldown_period = 180; // 3 minutes in seconds

    // Check if the user is in cooldown period
    if ($_SESSION['attempts'] >= 3 && (time() - $_SESSION['last_attempt_time']) < $cooldown_period) {
        echo json_encode([
            'icon' => 'error',
            'title' => 'Too Many Attempts',
            'text' => 'Please wait for 3 minutes before trying again.'
        ]);

        // Send a report email if 3 attempts have been made
        if ($_SESSION['attempts'] == 3) {
            $reportMail = new PHPMailer\PHPMailer\PHPMailer();
            $reportMail->isSMTP();
            $reportMail->Host = 'smtp.gmail.com';
            $reportMail->SMTPAuth = true;
            $reportMail->Username = 'cuevaj186@gmail.com';
            $reportMail->Password = 'evyp xrgb resd wwhh';
            $reportMail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;
            $reportMail->Port = 587;

            $reportMail->setFrom('cuevaj186@gmail.com', 'Attempt Report');
            $reportMail->addAddress('cuevaj186@gmail.com');

            $reportMail->isHTML(true);
            $reportMail->Subject = 'Multiple Failed Attempts Detected';
            $reportMail->Body = "There have been 3 failed attempts to verify the gmail using the email: <strong>$email</strong>.";

            $reportMail->send();
        }

        exit;
    }

    // Check if the email exists and belongs to user with id=1
    $query = "SELECT * FROM tbluser WHERE email = '$email' AND id = 1";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        // Generate a 5-digit verification code
        $verificationCode = rand(10000, 99999);
        
        // Generate a new token
        $newToken = bin2hex(random_bytes(16)); // Generates a 32-character hexadecimal token
        
        // Set expiration time for the code (e.g., 15 minutes from now)
        $expirationTime = date('Y-m-d H:i:s', strtotime('+15 minutes'));

        // Save the code, token, and expiration time in the database
        $updateQuery = "UPDATE tbluser SET code = '$verificationCode', token = '$newToken', reset_code_at = '$expirationTime' WHERE id = 1";
        if (!mysqli_query($con, $updateQuery)) {
            echo json_encode(['icon' => 'error', 'title' => 'Database Error', 'text' => 'Failed to update the database.']);
            exit;
        }

        // Prepare the email
        $mail = new PHPMailer\PHPMailer\PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
        $mail->SMTPAuth = true;
        $mail->Username = 'cuevaj186@gmail.com'; // SMTP username
        $mail->Password = 'evyp xrgb resd wwhh'; // SMTP password
        $mail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('cuevaj186@gmail.com', 'Barangay Portal Reset Password');
        $mail->addAddress($email);

        $mail->isHTML(true);
        $mail->Subject = 'Verification Code';
        $mail->Body = "Your verification code is: <strong>$verificationCode</strong>. This code will expire in 15 minutes.";

        if ($mail->send()) {
            // Reset attempts on successful email send
            $_SESSION['attempts'] = 0;
            echo json_encode(['icon' => 'success', 'title' => 'Email Sent', 'text' => 'Check your email for the verification code.']);
        } else {
            // Increment attempts on failure
            $_SESSION['attempts']++;
            $_SESSION['last_attempt_time'] = time();
            echo json_encode(['icon' => 'error', 'title' => 'Email Error', 'text' => 'Failed to send email.']);
        }
    } else {
        // Increment attempts on invalid email
        $_SESSION['attempts']++;
        $_SESSION['last_attempt_time'] = time();
        echo json_encode(['icon' => 'error', 'title' => 'Invalid Email', 'text' => 'The email does not exist or is not associated with the correct user.']);
    }
}
?>