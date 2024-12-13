

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

        .form-content-box h3 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-content-box .form-group {
            margin-bottom: 15px;
        }

        .form-content-box .form-group input {
            width: 90%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 0 3px black;
        }

        .form-content-box .btn-submit {
            background: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-shadow: 0 0 10px #0056b3;
        }

        .form-content-box .btn-submit:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <section class="bg-grey">
        <div class="form-content-box">
            <div class="login-header">
                <center><h1 class="text-center">Reset Password</h1></center>
            </div>
            <div class="details">
                <form action="" method="post">
                    <div class="form-group">
                        <input type="email" name="email" placeholder="Enter your email" autocomplete="on" required class="form-control">
                    </div>
                    <div class="form-group">
                        <button type="submit" name="reset" class="btn btn-submit">Send Link</button>
                    </div>
                </form>
            </div>
            
        </div>
    </section>
</body>
</html>
