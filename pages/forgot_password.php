<?php
require '../vendor/autoload.php'; // Ensure PHPMailer is autoloaded

// Establishing Connection with Server
$con = mysqli_connect('127.0.0.1', 'u510162695_barangay', '1Db_barangay', 'u510162695_barangay') or die(mysqli_error($con));

date_default_timezone_set("Asia/Manila");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($con, $_POST['email']);

    // Check if the email exists and belongs to user with id=1
    $query = "SELECT * FROM tbluser WHERE email = '$email' AND id = 1";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        // Generate a secure token
        $token = bin2hex(random_bytes(16));

        // Save the token in the database
        $updateQuery = "UPDATE tbluser SET token = '$token', reset_token_at = NOW() WHERE id = 1";
        mysqli_query($con, $updateQuery);

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
        $mail->Subject = 'Password Reset Request';
        $mail->Body = "Click the link to reset your password: <a href='https://barangayportal.com/pages/new_password.php?token=$token'>Reset Password</a>";

        if ($mail->send()) {
            echo json_encode(['icon' => 'success', 'title' => 'Email Sent', 'text' => 'Check your email for the reset link.']);
        } else {
            echo json_encode(['icon' => 'error', 'title' => 'Email Error', 'text' => 'Failed to send email.']);
        }
    } else {
        echo json_encode(['icon' => 'error', 'title' => 'Invalid Email', 'text' => 'The email does not exist or is not associated with the correct user.']);
    }
}
?>
