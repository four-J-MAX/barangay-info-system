<?php
include('connection.php');
session_start();

// Import PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader
require 'vendor/autoload.php';

if (isset($_POST['email'])) {
    sendResetLink($_POST['email']);
}

function sendResetLink($email) {
    global $con;
    
    // Check if email exists in database for id=1
    $stmt = $con->prepare("SELECT email FROM tbluser WHERE id = 1 AND email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows === 0) {
        $_SESSION['alert'] = [
            "icon" => "error",
            "title" => "Error",
            "text" => "Email not found or not authorized."
        ];
        return;
    }

    // Generate token
    $token = bin2hex(random_bytes(32));
    $reset_token_at = date('Y-m-d H:i:s');

    // Update database with token
    $update_stmt = $con->prepare("UPDATE tbluser SET token = ?, reset_token_at = ? WHERE id = 1");
    $update_stmt->bind_param("ss", $token, $reset_token_at);
    
    if (!$update_stmt->execute()) {
        $_SESSION['alert'] = [
            "icon" => "error",
            "title" => "Error",
            "text" => "Failed to generate reset token."
        ];
        return;
    }

    // Create PHPMailer instance
    $mail = new PHPMailer(true);

    try {
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

        $_SESSION['alert'] = [
            "icon" => "success",
            "title" => "Success",
            "text" => "Password reset link has been sent to your email."
        ];

    } catch (Exception $e) {
        $_SESSION['alert'] = [
            "icon" => "error",
            "title" => "Error",
            "text" => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"
        ];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(../images/bg-img.jpeg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-content-box {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px black;
            width: 100%;
            max-width: 400px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input {
            width: 90%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 0 3px black;
        }

        .btn-submit {
            background: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-shadow: 0 0 10px #0056b3;
        }

        .btn-submit:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-content-box">
        <center><h1>Reset Password</h1></center>
        <form method="POST">
            <div class="form-group">
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn-submit">Send Reset Link</button>
            </div>
        </form>
        <?php
        if (isset($_SESSION['alert'])) {
            $alert = $_SESSION['alert'];
            echo "<script>
                Swal.fire({
                    icon: '{$alert['icon']}',
                    title: '{$alert['title']}',
                    text: '{$alert['text']}'
                });
            </script>";
            unset($_SESSION['alert']);
        }
        ?>
    </div>
</body>
</html>
