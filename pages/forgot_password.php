<?php
include('connection.php');
session_start();

// Import PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader
require 'vendor/autoload.php';

header('Content-Type: application/json');

if (!isset($_POST['email'])) {
    echo json_encode([
        'icon' => 'error',
        'title' => 'Error',
        'text' => 'Email is required'
    ]);
    exit;
}

try {
    $email = $_POST['email'];
    
    // Check if email exists in database for id=1
    $stmt = $con->prepare("SELECT email FROM tbluser WHERE id = 1 AND email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows === 0) {
        echo json_encode([
            'icon' => 'error',
            'title' => 'Error',
            'text' => 'Email not found or not authorized.'
        ]);
        exit;
    }

    // Generate token
    $token = bin2hex(random_bytes(32));
    $reset_token_at = date('Y-m-d H:i:s');

    // Update database with token
    $update_stmt = $con->prepare("UPDATE tbluser SET token = ?, reset_token_at = ? WHERE id = 1");
    $update_stmt->bind_param("ss", $token, $reset_token_at);
    
    if (!$update_stmt->execute()) {
        throw new Exception("Failed to generate reset token.");
    }

    // Create PHPMailer instance
    $mail = new PHPMailer(true);

    // Server settings
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com'; // Replace with your SMTP host
    $mail->SMTPAuth   = true;
    $mail->Username   = 'your-email@gmail.com'; // Replace with your email
    $mail->Password   = 'your-app-password'; // Replace with your app password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = 587;

    // Recipients
    $mail->setFrom('your-email@gmail.com', 'Your Name');
    $mail->addAddress($email);

    // Content
    $reset_link = "https://yourwebsite.com/reset-password.php?token=" . $token;
    
    $mail->isHTML(true);
    $mail->Subject = 'Password Reset Request';
    $mail->Body    = "
        <html>
        <head>
            <style>
                .container {
                    padding: 20px;
                    background-color: #f5f5f5;
                    font-family: Arial, sans-serif;
                }
                .button {
                    background-color: #007bff;
                    color: white;
                    padding: 10px 20px;
                    text-decoration: none;
                    border-radius: 5px;
                    display: inline-block;
                    margin: 20px 0;
                }
            </style>
        </head>
        <body>
            <div class='container'>
                <h2>Password Reset Request</h2>
                <p>You have requested to reset your password. Click the button below to reset it:</p>
                <a href='{$reset_link}' class='button'>Reset Password</a>
                <p>If you didn't request this, please ignore this email.</p>
                <p>This link will expire in 1 hour.</p>
            </div>
        </body>
        </html>
    ";
    $mail->AltBody = "Reset your password by clicking this link: {$reset_link}";

    $mail->send();

    echo json_encode([
        'icon' => 'success',
        'title' => 'Success',
        'text' => 'Password reset link has been sent to your email.'
    ]);

} catch (Exception $e) {
    echo json_encode([
        'icon' => 'error',
        'title' => 'Error',
        'text' => 'An error occurred: ' . $e->getMessage()
    ]);
}
?>
