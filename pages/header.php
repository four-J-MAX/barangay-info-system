<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Include SweetAlert CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Include SweetAlert JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.all.min.js"></script>


<?php
// function clean($data)
// {
//     $data = htmlspecialchars(stripslashes(trim($data)));
//     return $data;
// }

// $isZoneLeader = $_SESSION['role'] == 'Zone Leader' ? true : false;

// $zone_barangay = isset($_SESSION['barangay']) ? $_SESSION['barangay'] : '';


// $all_barangay = [
//     "Kangwayan",
//     "Kodia",
//     "Pili",
//     "Bunakan",
//     "Tabagak",
//     "Maalat",
//     "Tarong",
//     "Malbago",
//     "Mancilang",
//     "Kaongkod",
//     "San Agustin",
//     "Poblacion",
//     "Tugas",
//     "Talangnan",
// ];

// $today = date("Y-m-d");

// $count_tblactivity = $con->query("SELECT * FROM tblactivity WHERE DATE(date_created) = '$today'");

// $count_tblactivityphoto = $con->query("SELECT * FROM tblactivityphoto WHERE DATE(date_created) = '$today'");
// $count_tblblotter = $con->query("SELECT * FROM tblblotter WHERE DATE(date_created) = '$today'");
// $count_tblclearance = $con->query("SELECT * FROM tblclearance WHERE DATE(date_created) = '$today'");
// $count_tblhousehold = $con->query("SELECT * FROM tblhousehold WHERE DATE(date_created) = '$today'");
// $count_tbllogs = $con->query("SELECT * FROM tbllogs WHERE DATE(logdate) = '$today'");
// $count_tblofficial = $con->query("SELECT * FROM tblofficial WHERE DATE(date_created) = '$today'");
// $count_tblpermit = $con->query("SELECT * FROM tblpermit WHERE DATE(date_created) = '$today'");
// $count_tblproject = $con->query("SELECT * FROM tblproject WHERE DATE(date_created) = '$today'");
// $count_tblsession = $con->query("SELECT * FROM tblsession WHERE DATE(date_created) = '$today'");
// $count_tblsettings = $con->query("SELECT * FROM tblsettings WHERE DATE(date_created) = '$today'");
// $count_tblstaff = $con->query("SELECT * FROM tblstaff WHERE DATE(date_created) = '$today'");
// $count_tbluser = $con->query("SELECT * FROM tbluser WHERE DATE(date_created) = '$today'");
// $count_tblvisitor = $con->query("SELECT * FROM tblvisitor WHERE DATE(date_created) = '$today'");
// $count_tblzone = $con->query("SELECT * FROM tblzone WHERE DATE(date_created) = '$today'");

// $find_notifications = "Select * from tblresident where  DATE(date_created) = '$today'";
// $result = mysqli_query($con, $find_notifications);
// $count_active = '';
// $notifications_data = array();
// $deactive_notifications_dump = array();
// while ($rows = mysqli_fetch_assoc($result)) {
//     $count_active = mysqli_num_rows($result);
//     $notifications_data[] = array(
//         "id" => $rows['id'],
//         "fname" => $rows['fname'],
//         "lname" => $rows['lname'],
//         "mname" => $rows['mname'],
//         "datemove" => $rows['datemove']



//     );
// }


// $total_count =
//     $count_tblactivity->num_rows +
//     $count_tblactivityphoto->num_rows +
//     $count_tblblotter->num_rows +
//     $count_tblclearance->num_rows +
//     $count_tblhousehold->num_rows +
//     $count_tbllogs->num_rows +
//     $count_tblofficial->num_rows +
//     $count_tblpermit->num_rows +
//     $count_tblproject->num_rows +
//     $count_tblsession->num_rows +
//     $count_tblsettings->num_rows +
//     $count_tblstaff->num_rows +
//     $count_tbluser->num_rows +
//     $count_tblvisitor->num_rows +
//     $count_tblzone->num_rows +
//     $result->num_rows
// ;


// $deactive_notifications = "Select * from tblresident where  DATE(date_created) = '$today' ORDER BY id DESC LIMIT 0,5";
// $result = mysqli_query($con, $deactive_notifications);
// while ($rows = mysqli_fetch_assoc($result)) {
//     $deactive_notifications_dump[] = array(
//         "id" => $rows['id'],
//         "fname" => $rows['fname'],
//         "lname" => $rows['lname'],
//         "mname" => $rows['mname'],
//         "datemove" => $rows['datemove']
//     );
// }


function clean($data)
{
    $data = htmlspecialchars(stripslashes(trim($data)));
    return $data;
}

$today = date("Y-m-d");

// Query for new residents
$new_residents_query = "SELECT id, fname, lname, mname, datemove FROM tblnewresident WHERE DATE(datemove) = '$today'";
$new_residents_result = $con->query($new_residents_query);

// Query for new households
$new_households_query = "SELECT id, headoffamily FROM tblhousehold WHERE DATE(created_at) = '$today'";
$new_households_result = $con->query($new_households_query); // Ensure 'created_at' exists in tblhousehold

// Process notifications
$new_notifications = [];
while ($row = $new_residents_result->fetch_assoc()) {
    $new_notifications[] = [
        "type" => "resident",
        "id" => $row['id'],
        "name" => $row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname'],
        "datemove" => $row['datemove'],
    ];
}

while ($row = $new_households_result->fetch_assoc()) {
    $new_notifications[] = [
        "type" => "household",
        "id" => $row['id'],
        "name" => $row['headoffamily'],
        "datemove" => $today,
    ];
}

$total_count = count($new_notifications);
?>
<style>
    /* Notification Count Badge */
    .round {
        width: 20px;
        height: 20px;
        border-radius: 50%;
        position: absolute;
        background: red;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0;
        margin: 0;
        left: 16px;
        /* Adjust horizontal positioning */
        top: 0px;
        /* Adjust vertical positioning */
        z-index: 99;
        /* Ensure it appears above other elements */
    }

    .round>span {
        color: white;
        font-size: 12px;
        /* Consistent font size */
        font-weight: bold;
        line-height: 1;
    }

    /* Notification Bell Icon */
    .fa-bell {
        position: relative;
        /* Allow badge to position relative to the bell */
        font-size: 20px;
        color: black;
        margin: 1.5rem 0.4rem !important;
    }

    /* Notification Dropdown */
    #list {
        display: none;
        /* Hidden by default */
        position: absolute;
        /* Position relative to bell icon */
        top: 40px;
        /* Adjust below the bell */
        right: 0;
        /* Align to the right edge */
        background: #ffffff;
        /* White background for visibility */
        z-index: 100;
        /* Keep above other elements */
        width: 300px;
        /* Fixed width for consistency */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        /* Subtle shadow for depth */
        border: 1px solid #ddd;
        /* Light border */
        border-radius: 5px;
        /* Optional rounded corners */
        padding: 10px;
        /* Add padding inside */
    }

    .message {
        margin: 10px 0;
        /* Space between messages */
        padding: 10px;
        /* Padding inside each message */
        border-bottom: 1px solid #f0f0f0;
        /* Separate messages */
    }

    .message>.msg {
        color: #333;
        /* Neutral text color */
        font-size: 14px;
        /* Readable font size */
        line-height: 1.5;
        /* Comfortable line height */
    }

    /* Navbar and User Menu Styling */
    .navbar-right {
        display: flex;
        /* Align items horizontally */
        align-items: center;
        /* Vertically align items */
    }

    .user-menu {
        margin-left: 1rem;
        /* Add space between notification and user menu */
    }

    .user-menu a {
        color: black;
        /* Neutral link color */
        text-decoration: none;
        /* Remove underline */
    }

    .user-menu ul {
        list-style: none;
        /* Remove bullet points */
        padding: 0;
        margin: 0;
    }

    .user-menu ul li {
        padding: 10px;
        background: #f9f9f9;
        border-bottom: 1px solid #ddd;
    }

    .user-menu ul li a {
        color: #333;
        text-decoration: none;
    }

    .user-menu ul li a:hover {
        background: #007bff;
        color: white;
    }

    /* Media Query for Responsiveness */
    @media (max-width: 768px) {
        #list {
            width: 90%;
            /* Adjust dropdown width for smaller screens */
            right: 5%;
            /* Center it more */
        }

        .navbar-right {
            flex-direction: column;
            /* Stack items vertically */
        }

        .user-menu {
            margin-left: 0;
            /* Remove unnecessary margin */
        }
    }

    /* Print-Specific Styles */
    @media print {
        .dont-print {
            display: none !important;
        }
    }



    /* Styling for the navbar-right section */
    .navbar-right {
        margin-right: 20px;
    }

    /* Styling the dropdown menu */
    .dropdown-menu {
        background-color: #f8f9fa;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 220px;
        /* Adjust width as needed */
    }

    /* Styling the user-header */
    .user-header {
        background-color: #0000FF;
        color: white;
        text-align: center;
        padding: 20px;
        border-radius: 8px;
    }

    /* Profile image style */
    .user-header img {
        border-radius: 50%;
        width: 50px;
        height: 50px;
        margin-bottom: 10px;
    }

    /* Styling the user-footer */
    .user-footer {
        display: flex;
        justify-content: space-between;
        padding: 10px;
    }

    /* Style for left button */
    .user-footer .pull-left .btn {
        background-color: #000;
        color: white;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 14px;
        text-transform: uppercase;
        transition: background-color 0.3s ease;
    }

    /* Style for right button */
    .user-footer .pull-right .btn {
        background-color: #000;
        color: white;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 14px;
        text-transform: uppercase;
        transition: background-color 0.3s ease;
    }

    /* Hover effect for buttons */
    .user-footer .pull-left .btn:hover,
    .user-footer .pull-right .btn:hover {
        background-color: black;
        /* For the Change Account button */
        background-color: black;
        /* For the Sign Out button */
    }

    /* Styling the dropdown toggle link */
    .dropdown-toggle {
        display: flex;
        align-items: center;
        font-size: 16px;
        color: #333;
    }

    .dropdown-toggle i {
        margin-right: 10px;
    }

    .dropdown-toggle span {
        font-weight: bold;
    }
</style>

<?php



$userid = $_SESSION['userid']; // Logged-in user ID

// Fetch user details and check if the user is an administrator
$query = "
    SELECT u.type, s.name, s.logo 
    FROM tbluser u 
    INNER JOIN tblsettings s 
    ON u.id = s.user_id 
    WHERE u.id = '$userid' AND u.deleted = 0
";
$squery = mysqli_query($con, $query);

if ($squery && mysqli_num_rows($squery) > 0) {
    $data = mysqli_fetch_assoc($squery);
    $isAdmin = $data['type'] === 'administrator';
    $name = $data['name'];
    $logo = $data['logo'];
} else {
    // Default values if no data is found or the user is not an administrator
    $isAdmin = false;
    $name = 'Barangay Management System';
    $logo = 'madridejos.png'; // Replace with a default image path
}

$total_count = isset($total_count) ? $total_count : 0; // Ensure $total_count is defined

echo '<header class="header">
    <a href="#" class="logo">
        <img src="../../images/' . $logo . '" style="height: 50px; width: 50px; float: left; margin-left: -10px;">
        <p style="font-size: 12px; font-family: Arial, sans-serif;">' . $name . '</p>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <ul class="nav navbar-nav navbar-right">';

if ($isAdmin) { // Only show the notification bell for admins
    echo '<li class="dropdown" style="position: relative;">
            <a href="#" class="dropdown-toggle" id="notif-bell" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell" style="font-size:20px;color:black;margin:1.5rem 0.4rem;"></i>';
    if ($total_count > 0) {
        echo '<div class="round" id="bell-count"><span>' . $total_count . '</span></div>';
    }
    echo '</a>
          <ul class="dropdown-menu" aria-labelledby="notif-bell" style="max-height: 300px; overflow-y: auto; width: 300px;">';

    if ($total_count > 0) {
        foreach ($new_notifications as $notif) {
            $type = $notif['type'] === 'resident' ? 'New Resident' : 'New Household';
            echo '<li style="padding: 10px; border-bottom: 1px solid #ccc;">
                    <strong>' . $notif['name'] . '</strong><br>
                    <small>Type: ' . $type . '</small><br>
                    <small>Date Move In: ' . $notif['datemove'] . '</small>
                  </li>';
        }
    } else {
        echo '<li style="padding: 10px; text-align: center;">No new notifications</li>';
    }

    echo '</ul>
        </li>';
}

echo '</ul>
        <div class="navbar-right">
            <ul class="nav navbar-nav" style="background-color:transparent;">
                <li class="dropdown user user-menu">
                    <a href="resident" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i><span>' . $_SESSION['barangay'] . '<i class="caret"></i></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header bg-light-black" style="background-color:#0000FF;">
                            <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#editProfileModal" style="background-color: #000; color:white;">Change Account</a>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="javascript:void(0);" class="btn btn-default btn-flat" style="background-color: #000; color:white;" onclick="confirmLogout()">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>';
?>


<div id="editProfileModal" class="modal fade">
    <form method="post">
        <div class="modal-dialog modal-sm" style="width:300px !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Change Account</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <?php
                            if ($_SESSION['role'] == "administrator") {
                                $user = mysqli_query($con, "SELECT * from tbluser where id = '" . $_SESSION['userid'] . "' ");
                                while ($row = mysqli_fetch_array($user)) {
                                    echo '
                                    <div class="form-group">
                                        <label>Username:</label>
                                        <input name="txt_username" id="txt_username" class="form-control input-sm" type="text" value="' . $row['username'] . '" />
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input name="txt_password" id="txt_password" class="form-control input-sm" type="password"  value="' . $row['password'] . '"/>
                                    </div>';
                                }
                            } elseif ($_SESSION['role'] == "Zone Leader") {
                                $user = mysqli_query($con, "SELECT * from tblzone where id = '" . $_SESSION['userid'] . "' ");
                                while ($row = mysqli_fetch_array($user)) {
                                    echo '
                                    <div class="form-group">
                                        <label>Username:</label>
                                        <input name="txt_username" id="txt_username" class="form-control input-sm" type="text" value="' . $row['username'] . '" />
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input name="txt_password" id="txt_password" class="form-control input-sm" type="password"  value="' . $row['password'] . '"/>
                                    </div>';
                                }
                            } elseif ($_SESSION['staff'] == "Staff") {
                                $user = mysqli_query($con, "SELECT * from tblstaff where id = '" . $_SESSION['userid'] . "' ");
                                while ($row = mysqli_fetch_array($user)) {
                                    echo '
                                    <div class="form-group">
                                        <label>Username:</label>
                                        <input name="txt_username" id="txt_username" class="form-control input-sm" type="text" value="' . $row['username'] . '" />
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input name="txt_password" id="txt_password" class="form-control input-sm" type="password"  value="' . $row['password'] . '"/>
                                    </div>';
                                }
                            } else {
                                $user = mysqli_query($con, "SELECT * from tblresident where id = '" . $_SESSION['userid'] . "' ");
                                while ($row = mysqli_fetch_array($user)) {
                                    echo '
                                    <div class="form-group">
                                        <label>Username:</label>
                                        <input name="txt_username" id="txt_username" class="form-control input-sm" type="text" value="' . $row['username'] . '" />
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input name="txt_password" id="txt_password" class="form-control input-sm" type="password"  value="' . $row['password'] . '"/>
                                    </div>';
                                }
                            }
                            ?>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel" />
                    <input type="submit" class="btn btn-primary btn-sm" id="btn_saveeditProfile"
                        name="btn_saveeditProfile" value="Save" />
                </div>
            </div>
        </div>
    </form>
</div>


<?php
if (isset($_POST['btn_saveeditProfile'])) {
    $username = $_POST['txt_username'];
    $password = $_POST['txt_password'];

    if ($_SESSION['role'] == "Administrator") {
        $updadmin = mysqli_query($con, "UPDATE tbluser set username = '$username', password = '$password' where id = '" . $_SESSION['userid'] . "' ");
        if ($updadmin == true) {
            header("location: " . $_SERVER['REQUEST_URI']);
        }
    } elseif ($_SESSION['role'] == "Zone Leader") {
        $updzone = mysqli_query($con, "UPDATE tblzone set username = '$username', password = '$password' where id = '" . $_SESSION['userid'] . "' ");
        if ($updzone == true) {
            header("location: " . $_SERVER['REQUEST_URI']);
        }
    } elseif ($_SESSION['staff'] == "Staff") {
        $updstaff = mysqli_query($con, "UPDATE tblstaff set username = '$username', password = '$password' where id = '" . $_SESSION['userid'] . "' ");
        if ($updstaff == true) {
            header("location: " . $_SERVER['REQUEST_URI']);
        }
    }
}

?>
<script>
    function confirmLogout() {
        Swal.fire({
            title: 'Are you sure?',
            text: "You want to log out of your account?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, log out!',
            cancelButtonText: 'Cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Redirect to logout page if user confirms
                window.location.href = '../../logout.php';
            } else {
                // Optionally: Handle cancel action here (e.g., show message)
                Swal.fire('Cancelled', 'You are still logged in!', 'info');
            }
        });
    }
</script>

<script>
    $(document).ready(function () {
        var ids = new Array();

        // Toggle dropdown visibility
        $('#over').on('click', function (e) {
            e.stopPropagation(); // Prevent click from propagating to the document
            $('#list').toggle();
        });

        // Hide dropdown when clicking outside
        $(document).on('click', function (e) {
            if (!$(e.target).closest('#list').length && !$(e.target).is('#over')) {
                $('#list').hide();
            }
        });

        // Message with Ellipsis
        $('div.msg').each(function () {
            var len = $(this).text().trim(" ").split(" ");
            if (len.length > 12) {
                var add_elip = $(this).text().trim().substring(0, 1000);
                $(this).text(add_elip);
            }
        });

        // Handle bell count click
        $("#bell-count").on('click', function (e) {
            e.preventDefault();
            let belvalue = $('#bell-count').attr('data-value');

            if (belvalue === '') {
                console.log("inactive");
            } else {
                $(".round").css('display', 'none');
                $("#list").css('display', 'block');

                // Ajax for deactivating notifications
                $('.message').click(function (e) {
                    e.preventDefault();
                    $.ajax({
                        url: '../connection/deactive.php',
                        type: 'POST',
                        data: { "id": $(this).attr('data-id') },
                        success: function (data) {
                            console.log(data);
                            location.reload();
                        }
                    });
                });
            }
        });

        // Insert notification
        $('#notify').on('click', function (e) {
            e.preventDefault();
            var name = $('#notifications_name').val();
            var ins_msg = $('#message').val();
            if ($.trim(name).length > 0 && $.trim(ins_msg).length > 0) {
                var form_data = $('#frm_data').serialize();
                $.ajax({
                    url: './connection/insert.php',
                    type: 'POST',
                    data: form_data,
                    success: function (data) {
                        location.reload();
                    }
                });
            } else {
                alert("Please Fill All the fields");
            }
        });


    });

    <?php
    if ($_SESSION['role'] == "administrator") {

        ?>

        // Function to check for pending approvals
        function checkForApprovals() {
            $.ajax({
                url: '../check_approvals.php', // Backend endpoint
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    // Log response for debugging
                    console.log('Server Response:', response);

                    // Check for errors in the response
                    if (response.error) {
                        console.error('Error:', response.error);
                        return;
                    }

                    // Check for pending approvals
                    if (response.pendingCount > 0) {
                        Swal.fire({
                            title: 'Pending Approvals!',
                            text: There are ${ response.pendingCount } Zone Leaders waiting for approval.,
                                icon: 'warning',
                                    showCancelButton: true,
                                        confirmButtonText: 'Go to Approvals',
                                            cancelButtonText: 'Dismiss',
                                }).then((result) => {
                                                if (result.isConfirmed) {
                                                    window.location.href = 'https://barangayportal.com/pages/user/user.php'; // Redirect to the user page
                                                }
                                            });
        }
                        },
        error: function(xhr, status, error) {
            // Log AJAX errors
            console.error('Error fetching pending approvals:', error);
            console.error('Response status:', status);
            console.error('Response text:', xhr.responseText);
        }
                    });
                }

        // Set an interval to check for approvals every 1 minute
        setInterval(checkForApprovals, 60000);

        // Call immediately on page load
        checkForApprovals();

        <?php
    }

    ?>

</script>