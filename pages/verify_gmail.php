<?php
require '../vendor/autoload.php'; // Ensure PHPMailer is autoloaded

// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Establishing Connection with Server
$con = mysqli_connect('127.0.0.1', 'u510162695_barangay', '1Db_barangay', 'u510162695_barangay');

if (!$con) {
    echo json_encode(['icon' => 'error', 'title' => 'Database Error', 'text' => 'Failed to connect to the database.']);
    exit;
}

date_default_timezone_set("Asia/Manila");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($con, $_POST['email']);

    // Check if the email exists and belongs to user with id=1
    $query = "SELECT * FROM tbluser WHERE email = '$email' AND id = 1";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        // Generate a 5-digit verification code
        $verificationCode = rand(10000, 99999);
        
        // Set expiration time for the code (e.g., 15 minutes from now)
        $expirationTime = date('Y-m-d H:i:s', strtotime('+15 minutes'));

        // Save the code and expiration time in the database
        $updateQuery = "UPDATE tbluser SET code = '$verificationCode', code_reset_at = '$expirationTime' WHERE id = 1";
        if (!mysqli_query($con, $updateQuery)) {
            echo json_encode(['icon' => 'error', 'title' => 'Database Error', 'text' => 'Failed to update the database.']);
            exit;
        }

        // Prepare the email
        $mail = new PHPMailer\PHPMailer\PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
        $mail->SMTPAuth = true;
        $mail->Username = 'montgomeryaurelia06@gmail.com'; // SMTP username
        $mail->Password = 'oylq mpnj adlw iuod'; // SMTP password
        $mail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('montgomeryaurelia06@gmail.com', 'Barangay Portal Reset Password');
        $mail->addAddress($email);

        $mail->isHTML(true);
        $mail->Subject = 'Password Reset Verification Code';
        $mail->Body = "Your verification code is: <strong>$verificationCode</strong>. This code will expire in 15 minutes.";

        if ($mail->send()) {
            echo json_encode(['icon' => 'success', 'title' => 'Email Sent', 'text' => 'Check your email for the verification code.']);
        } else {
            echo json_encode(['icon' => 'error', 'title' => 'Email Error', 'text' => 'Failed to send email.']);
        }
    } else {
        echo json_encode(['icon' => 'error', 'title' => 'Invalid Email', 'text' => 'The email does not exist or is not associated with the correct user.']);
    }
}
?>