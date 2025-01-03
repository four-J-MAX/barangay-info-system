<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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
        <center>
            <h1>Verify Your Admin Gmail</h1>
        </center>
        <form id="resetForm">
            <div class="form-group">
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn-submit">Send Verification Code</button>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function () {

            $('#resetForm').on('submit', function (e) {
                e.preventDefault();

                const email = $('#email').val();

                Swal.fire({
                    title: 'Sending...',
                    text: 'Please wait while we process your request.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    },
                    toast: true,
                    position: 'top-end',
                    backdrop: false
                });

                $.ajax({
                    url: 'verify_gmail.php',
                    type: 'POST',
                    data: { email: email },
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire({
                            icon: response.icon,
                            title: response.title,
                            text: response.text,
                            timer: 2000,
                            showConfirmButton: false,
                            toast: true,
                            position: 'top-end',
                            backdrop: false
                        }).then(() => {
                            if (response.icon === 'success') {
                                const newFormHtml = `
                            <form id="newForm" method="POST">
                                <div class="form-group">
                                    <input type="text" name="verification_code" id="verification_code" placeholder="Enter verification code" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn-submit">Verify Code</button>
                                </div>
                            </form>
                        `;
                                $('.form-content-box').html(newFormHtml);
                            } else if (response.title === 'Too Many Attempts') {
                                $('#resetForm button[type="submit"]').prop('disabled', true);
                                setTimeout(() => {
                                    $('#resetForm button[type="submit"]').prop('disabled', false);
                                }, 180000); // 3 minutes in milliseconds
                            }
                        });
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'An error occurred. Please try again later.',
                            timer: 2000,
                            showConfirmButton: false,
                            toast: true,
                            position: 'top-end',
                            backdrop: false
                        });
                    }
                });
            });

            // Handle the new form submission
            $(document).on('submit', '#newForm', function (e) {
                e.preventDefault();

                const verificationCode = $('#verification_code').val();

                // Show loading state
                Swal.fire({
                    title: 'Verifying...',
                    text: 'Please wait while we verify your code.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    },
                    toast: true,
                    position: 'top-end',
                    backdrop: false
                });

                // Send AJAX request to verify the code
                $.ajax({
                    url: 'verify_code.php',
                    type: 'POST',
                    data: { verification_code: verificationCode },
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire({
                            icon: response.status,
                            title: response.status === 'success' ? 'Success' : 'Error',
                            text: response.message,
                            timer: 2000,
                            showConfirmButton: false,
                            toast: true,
                            position: 'top-end',
                            backdrop: false
                        }).then(() => {
                            if (response.status === 'success') {
                                // Redirect to login.php with token
                                window.location.href = `../login.php?token=${encodeURIComponent(response.token)}`;
                            }
                        });
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'An error occurred. Please try again later.',
                            timer: 2000,
                            showConfirmButton: false,
                            toast: true,
                            position: 'top-end',
                            backdrop: false
                        });
                    }
                });
            });
        });
    </script>
</body>

</html>