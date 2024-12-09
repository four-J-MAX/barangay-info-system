<!DOCTYPE html>
<html>
<?php
session_start();
function clean($data)
{
    return htmlspecialchars(stripslashes(trim($data)));
}

include "pages/connection.php";
$request = $_SERVER['REQUEST_URI'];
if (substr($request, -4) == '.php') {
    $new_url = substr($request, 0, -4);
    header("Location: $new_url", true, 301);
    exit();
}

// Security headers
header('Strict-Transport-Security: max-age=31536000; includeSubDomains; preload');
header("Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; object-src 'none'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self'; connect-src 'self'; frame-ancestors 'none';");
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
header('X-XSS-Protection: 1; mode=block');
header('Referrer-Policy: no-referrer-when-downgrade');
header('Permissions-Policy: geolocation=(self), microphone=(), camera=()');
header('Cache-Control: no-store, no-cache, must-revalidate, proxy-revalidate');
header('Pragma: no-cache');
header('Expires: 0');
header('Expect-CT: max-age=86400, enforce, report-uri="https://example.com/report"');
?>

<head>
    <meta charset="UTF-8">
    <title>Barangay Information System</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon_io/apple-touch-icon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js?render=6LepTJUqAAAAAGXDqio3o4OI9Rr9OtBiPDaOIJ71"></script>
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(./images/bg-img.jpeg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .container {
            min-height: 100vh;
            display: grid;
            place-items: center;
        }

        .eye-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #777;
        }

        .eye-icon:hover {
            color: #333;
        }

        .card {
            width: 400px !important;
        }

        @media (max-width: 400px) {
            .card {
                width: 100% !important;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align:center;">
                    <img src="images/madridejos.png" style="height:150px;" />
                    <h3 class="panel-title"><strong>Management System</strong></h3>
                    <p>Login</p>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" id="loginForm">
                        <div class="form-group">
                            <label for="txt_username">Email</label>
                            <input type="text" class="form-control" name="txt_username" placeholder="Enter Email" required />
                        </div>
                        <div class="form-group">
                            <label for="txt_password">Password</label>
                            <div style="position: relative;">
                                <input type="password" class="form-control" name="txt_password" id="txt_password" placeholder="Enter Password" required />
                                <i class="fas fa-eye eye-icon" id="togglePassword"></i>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-sm btn-primary" name="btn_login" style="background-color:#00BB27;">Log in</button>
                        <a href="pages/forgotpass" style="float: right;">Forgot password</a>
                        <label id="error" class="label label-danger pull-right"></label>
                        <p class="text-center" style="margin-top: 20px;">Don't have an account? <a href="signup.php">Sign Up</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // reCAPTCHA v3 integration
            grecaptcha.ready(function() {
                grecaptcha.execute('6LepTJUqAAAAAGXDqio3o4OI9Rr9OtBiPDaOIJ71', { action: 'login' }).then(function(token) {
                    let recaptchaInput = document.createElement("input");
                    recaptchaInput.setAttribute("type", "hidden");
                    recaptchaInput.setAttribute("name", "g-recaptcha-response");
                    recaptchaInput.value = token;
                    document.getElementById("loginForm").appendChild(recaptchaInput);
                });
            });

            // Toggle password visibility
            let passwordInp = document.querySelector("input[name='txt_password']");
            let showPass = document.getElementById("togglePassword");

            showPass.onclick = () => {
                if (passwordInp.getAttribute("type") == "password") {
                    passwordInp.setAttribute("type", "text");
                    showPass.classList.replace("fa-eye", "fa-eye-slash");
                } else {
                    passwordInp.setAttribute("type", "password");
                    showPass.classList.replace("fa-eye-slash", "fa-eye");
                }
            };
        });
    </script>
</body>

<?php
if (isset($_POST['btn_login'])) {
    // Verify reCAPTCHA v3
    $recaptchaResponse = $_POST['g-recaptcha-response'];
    $secretKey = '6LepTJUqAAAAADNU42GE1ZgbXUOP4n1RulY5OVCC';
    $verifyResponse = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$recaptchaResponse");
    $responseData = json_decode($verifyResponse);

    if (!$responseData->success || $responseData->score < 0.5) { // Adjust threshold
        echo "<script>
                Swal.fire({
                    title: 'Error!',
                    text: 'reCAPTCHA verification failed. Please try again.',
                    icon: 'error',
                    timer: 2000,
                    showConfirmButton: false
                });
              </script>";
        exit;
    }

    // Process login
    $username = clean($_POST['txt_username']);
    $password = clean($_POST['txt_password']);

    $stmt = $con->prepare("SELECT * FROM tbluser WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            $_SESSION['login_attempts'] = 0;

            $_SESSION['role'] = clean($row['type']);
            $_SESSION['userid'] = clean($row['id']);
            $_SESSION['username'] = clean($row['username']);
            $_SESSION['barangay'] = clean($row['barangay']);

            echo "<script>
                    Swal.fire({
                        title: 'Success!',
                        text: 'Welcome, " . $row['type'] . "!',
                        icon: 'success',
                        timer: 2000,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.href = 'pages/dashboard/dashboard.php';
                    });
                  </script>";
        } else {
            echo "<script>
                    Swal.fire({
                        title: 'Error!',
                        text: 'Incorrect username or password.',
                        icon: 'error',
                        timer: 2000,
                        showConfirmButton: false
                    });
                  </script>";
        }
    } else {
        echo "<script>
                Swal.fire({
                    title: 'Error!',
                    text: 'Account does not exist.',
                    icon: 'error',
                    timer: 2000,
                    showConfirmButton: false
                });
              </script>";
    }
}
?>
