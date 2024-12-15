<?php
session_start();

include 'connection.php';

// Check if token is provided in the URL
if (!isset($_GET['token'])) {
    header("Location: 404.php");
    exit();
}

$token = $_GET['token'];

// Fetch the token from the database for user with id=1
$query = "SELECT token FROM tbluser WHERE id = 1";
$result = mysqli_query($con, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $dbToken = $row['token'];

    // Check if the token matches
    if ($token !== $dbToken) {
        // Token does not match, redirect to 404
        header("Location: 404.php");
        exit();
    }
} else {
    // No user found or query failed, redirect to 404
    header("Location: 404.php");
    exit();
}

// Close the database connection
mysqli_close($con);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set New Password</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <center><h1>Set New Password</h1></center>
        <form id="newPasswordForm">
            <div class="form-group">
                <input type="password" name="new_password" id="new_password" placeholder="Enter new password" required>
            </div>
            <div class="form-group">
                <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm new password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn-submit">Set Password</button>
            </div>
        </form>
    </div>

    <script>
       $(document).ready(function() {
    $('#newPasswordForm').on('submit', function(e) {
        e.preventDefault();
        
        const newPassword = $('#new_password').val();
        const confirmPassword = $('#confirm_password').val();

        // Password strength validation
        const passwordStrengthRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
        if (!passwordStrengthRegex.test(newPassword)) {
            Swal.fire({
                icon: 'error',
                title: 'Weak Password',
                text: 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.',
                timer: 3000,
                showConfirmButton: false,
                toast: true,
                position: 'top-end'
            });
            return;
        }

        if (newPassword !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Passwords do not match',
                text: 'Please ensure both passwords are the same.',
                timer: 2000,
                showConfirmButton: false,
                toast: true,
                position: 'top-end'
            });
            return;
        }

        // Send AJAX request to update the password
        $.ajax({
            url: 'update_password.php',
            type: 'POST',
            data: { new_password: newPassword },
            dataType: 'json',
            success: function(response) {
                Swal.fire({
                    icon: response.icon,
                    title: response.title,
                    text: response.text,
                    timer: 2000,
                    showConfirmButton: false,
                    toast: true,
                    position: 'top-end'
                }).then(() => {
                    if (response.icon === 'success') {
                        // Redirect to login page on success
                        window.location.href = '../login.php';
                    }
                });
            },
            error: function() {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'An error occurred. Please try again later.',
                    timer: 2000,
                    showConfirmButton: false,
                    toast: true,
                    position: 'top-end'
                });
            }
        });
    });
});
    </script>
</body>
</html>