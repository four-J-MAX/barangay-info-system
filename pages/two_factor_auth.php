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
        <center><h1>Verify Your Admin Gmail</h1></center>
        <form id="resetForm">
            <div class="form-group" id="email-group">
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group" id="code-group" style="display: none;">
                <input type="text" name="verification_code" id="verification_code" placeholder="Enter verification code" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn-submit">Send Verification Code</button>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            $('#resetForm').on('submit', function(e) {
                e.preventDefault();
                
                const email = $('#email').val();
                const verificationCode = $('#verification_code').val();

                if ($('#email-group').is(':visible')) {
                    // Show loading state
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

                    // Send AJAX request to send verification code
                    $.ajax({
                        url: 'verify_gmail.php',
                        type: 'POST',
                        data: { email: email },
                        dataType: 'json',
                        success: function(response) {
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
                                    // Hide email input and show verification code input
                                    $('#email-group').hide();
                                    $('#code-group').show();
                                    $('.btn-submit').text('Verify Code');
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
                                position: 'top-end',
                                backdrop: false
                            });
                        }
                    });
                } else {
                    // Handle verification code submission
                    // You can add your logic here to verify the code
                    Swal.fire({
                        icon: 'success',
                        title: 'Code Verified',
                        text: 'Your verification code has been successfully verified.',
                        timer: 2000,
                        showConfirmButton: false,
                        toast: true,
                        position: 'top-end',
                        backdrop: false
                    }).then(() => {
                        // Redirect to login page or next step
                        window.location.href = '../login.php';
                    });
                }
            });
        });
    </script>
</body>
</html>