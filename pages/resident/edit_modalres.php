<?php
if (isset($row['id'])) {
    echo '<div id="editModal' . $row['id'] . '" class="modal fade">';

    // Rest of your code...

} else {
    echo "No data found for editing.";
}
?>

<form class="form-horizontal" method="post" enctype="multipart/form-data">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Edit Resident Information</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="container-fluid">
                        <div class="col-md-6 col-sm-12">
                            <input type="hidden" name="hidden_id" value="<?= $row['id'] ?>">

                            <div class="form-group">
                                <!--<label class="control-label" >Name:</label><br>-->
                                <div class="col-sm-4">
                                    <input name="txt_lname" class="form-control input-sm" type="text"
                                        placeholder="Lastname" required="" value="<?= $row['lname'] ?>" />
                                </div>
                                <div class="col-sm-4">
                                    <input name="txt_fname" class="form-control input-sm col-sm-4" type="text"
                                        placeholder="Firstname" required="" value="<?= $row['fname'] ?>" />
                                </div>
                                <div class="col-sm-4">
                                    <input name="txt_mname" class="form-control input-sm col-sm-4" type="text"
                                        placeholder="Middlename" value="<?= $row['mname'] ?>" />
                                </div>
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Birthdate:</label>-->
                                <input name="txt_bdate" class="form-control input-sm input-size" type="date"
                                    placeholder="Birthdate" required="" value="<?= $row['bdate'] ?>" />
                            </div>
                            <!--
                                    <div class="form-group">
                                        <label class="control-label">Age:</label>
                                        <input name="txt_age" class="form-control input-sm input-size" type="number" placeholder="Age"/>
                                    </div> -->


                            <?php



                            $isZoneLeader = $_SESSION['role'] === 'Zone_Leader'; // Check if user is a Zone Leader
                            $all_barangay = [];

                            if ($isZoneLeader) {
                                // Fetch the Zone Leader's barangay
                                $username = $_SESSION['username']; // Assuming username is stored in session
                                $query = "SELECT barangay FROM tbluser WHERE username = ? AND type = 'Zone_Leader' AND deleted = 0 LIMIT 1";
                                $stmt = $conn->prepare($query);
                                $stmt->bind_param("s", $username);
                                $stmt->execute();
                                $stmt->bind_result($barangay);
                                if ($stmt->fetch()) {
                                    $all_barangay = [$barangay]; // Zone Leader has one barangay
                                    $_SESSION['barangay'] = $barangay; // Store barangay in session
                                }
                                $stmt->close();
                            } else {
                                // Static list of barangays for other users
                                $all_barangay = [
                                    "Kangwayan",
                                    "Kodia",
                                    "Pili",
                                    "Bunakan",
                                    "Tabagak",
                                    "Maalat",
                                    "Tarong",
                                    "Malbago",
                                    "Mancilang",
                                    "Kaongkod",
                                    "San Agustin",
                                    "Poblacion",
                                    "Tugas",
                                    "Talangnan"
                                ];
                            }
                            ?>

                            <div class="form-group">
                                <select name="txt_brgy" class="form-control input-sm" required="">
                                    <option selected="" disabled="">-Select Barangay-</option>
                                    <?php
                                    if ($isZoneLeader) {
                                        // Zone Leader: Display only their barangay
                                        if (!empty($all_barangay)) {
                                            foreach ($all_barangay as $brgy) {
                                                echo "<option value=\"$brgy\" selected>$brgy</option>";
                                            }
                                        } else {
                                            echo "<option disabled>No barangay available</option>";
                                        }
                                    } else {
                                        // Non-Zone Leader: Display static barangays
                                        foreach ($all_barangay as $brgy) {
                                            $selected = (isset($_SESSION['barangay']) && $_SESSION['barangay'] == $brgy) ? 'selected' : '';
                                            echo "<option value=\"$brgy\" $selected>$brgy</option>";
                                        }
                                    }
                                    ?>
                                </select>
                            </div>


                            <div class="form-group">
                                <!--  <label class="control-label">Household #:</label>-->
                                <input name="txt_householdnum" class="form-control input-sm input-size" type="number"
                                    min="1" placeholder="Household #" required="" value="<?= $row['householdnum'] ?>" />
                            </div>

                            <div class="form-group">
                                <!--<label class="control-label">Civil Status:</label>-->
                                <select name="txt_cstatus" class="form-control input-sm" required="">
                                    <option selected="" disabled="">-Select Civil Status-</option>
                                    <option value="Single" <?= $row['civilstatus'] == 'Single' ? 'selected' : '' ?>>Single
                                    </option>
                                    <option value="Married" <?= $row['civilstatus'] == 'Married' ? 'selected' : '' ?>>
                                        Married</option>
                                    <option value="Widow" <?= $row['civilstatus'] == 'Widow' ? 'selected' : '' ?>>Widow
                                    </option>
                                </select>
                            </div>

                            <div class="form-group">
                                <!--<label class="control-label">Region:</label>-->
                                <input name="txt_region" class="form-control input-sm input-size" type="text"
                                    placeholder="Region" required="" value="<?= $row['region'] ?>" />
                            </div>
                            <div class="form-group">
                                <!--<label class="control-label">Educational Attainment:</label>-->
                                <select name="ddl_eattain" class="form-control input-sm input-size" required="">
                                    <option selected="" disabled="">-Select Educational Attainment -</option>
                                    <option value="No schooling completed" <?= $row['highestEducationalAttainment'] == 'No schooling completed' ? 'selected' : '' ?>>No schooling completed</option>
                                    <option value="Elementary" <?= $row['highestEducationalAttainment'] == 'Married' ? 'selected' : '' ?>>Elementary</option>
                                    <option value="High school, undergrad"
                                        <?= $row['highestEducationalAttainment'] == 'High school, undergrad' ? 'selected' : '' ?>>High school, undergrad</option>
                                    <option value="High school graduate" <?= $row['highestEducationalAttainment'] == 'High school graduate' ? 'selected' : '' ?>>High school graduate</option>
                                    <option value="College, undergrad"
                                        <?= $row['highestEducationalAttainment'] == 'College, undergrad' ? 'selected' : '' ?>>College, undergrad</option>
                                    <option value="Vocational" <?= $row['highestEducationalAttainment'] == 'Vocational' ? 'selected' : '' ?>>Vocational</option>
                                    <option value="Bachelor’s degree"
                                        <?= $row['highestEducationalAttainment'] == 'Bachelor’s degree' ? 'selected' : '' ?>>Bachelor’s degree</option>
                                    <option value="Master’s degree" <?= $row['highestEducationalAttainment'] == 'Master’s degree' ? 'selected' : '' ?>>Master’s degree</option>
                                    <option value="Doctorate degree" <?= $row['highestEducationalAttainment'] == 'Doctorate degree' ? 'selected' : '' ?>>Doctorate degree</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <!--<label class="control-label">Municipality:</label>-->
                                <input name="txt_Municipality" class="form-control input-sm input-size" type="text"
                                    placeholder="Municipality" required="" value="<?= $row['Municipality'] ?>" />
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Civil Status:</label>-->
                                <select name="status" class="form-control input-sm input-size" required>
                                    <option selected="" disabled="">-Select Status -</option>
                                    <option value="New Resident" <?= $row['status'] == 'New Resident' ? 'selected' : '' ?>>
                                        New Resident</option>
                                    <option value="PWD" <?= $row['status'] == 'PWD' ? 'selected' : '' ?>>PWD</option>
                                    <option value="Senior" <?= $row['status'] == 'Senior' ? 'selected' : '' ?>>Senior
                                    </option>
                                    <option value="Pregnant" <?= $row['status'] == 'Pregnant' ? 'selected' : '' ?>>Pregnant
                                    </option>
                                    <option value="InActive" <?= $row['status'] == 'InActive' ? 'selected' : '' ?>>InActive
                                    </option>
                                    <option value="Active" <?= $row['status'] == 'Active' ? 'selected' : '' ?>>Active
                                    </option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Date Moved In:</label>
                                <input id="txt_date_of_transfer" name="datemove" class="form-control input-sm"
                                    type="date" placeholder="Date Moved In" required=""
                                    value="<?= date('Y-m-d', strtotime($row['datemove'])) ?>" />
                                <span id="length_of_stay"></span>
                                <!-- This span will display the calculated length of stay -->
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Username:</label>
                                        <input name="txt_uname" id="username" class="form-control input-sm input-size" type="text" placeholder="Username" required="" />
                                        <label id="user_msg" style="color:#CC0000;" ></label>-->
                            </div>

                        </div>

                        <div class="col-md-6 col-sm-12">

                            <div class="form-group">
                                <!--<label class="control-label">Gender:</label>-->
                                <select name="ddl_gender" class="form-control input-sm" required>
                                    <option selected="" disabled="">-Select Gender-</option>
                                    <option value="Male" <?= $row['gender'] == 'Male' ? 'selected' : '' ?>>Male</option>
                                    <option value="Female" <?= $row['gender'] == 'Female' ? 'selected' : '' ?>>Female
                                    </option>
                                </select>
                            </div>

                            <div class="form-group">
                                <!--  <label class="control-label">Birthplace:</label>-->
                                <input name="txt_bplace" class="form-control input-sm" type="text"
                                    placeholder="Birthplace" required="" value="<?= $row['bplace'] ?>" />
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Province:</label>-->
                                <input name="txt_province" class="form-control input-sm" type="text"
                                    placeholder="Province" required="" value="<?= $row['province'] ?>" />
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Purok/Zone #:</label>-->

                                <select name="txt_zone" class="form-control input-sm" required>
                                    <option selected="" disabled="">-- Select Zone/Purok -- </option>
                                    <option value="Rosas" <?= $row['zone'] == 'Rosas' ? 'selected' : '' ?>> Rosas</option>
                                    <option value="Bombil" <?= $row['zone'] == 'Bombil' ? 'selected' : '' ?>> Bombil
                                    </option>
                                    <option value="Santan" <?= $row['zone'] == 'Santan' ? 'selected' : '' ?>> Santan
                                    </option>
                                    <option value="Kumintang" <?= $row['zone'] == 'Kumintang' ? 'selected' : '' ?>>
                                        Kumintang</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Total Household Member:</label>-->
                                <input name="txt_householdmem" class="form-control input-sm" type="number" min="1"
                                    placeholder="Total Household Member" required=""
                                    value="<?= $row['totalhousehold'] ?>" />
                            </div>

                            <div class="form-group">
                                <!-- <label class="control-label">Occupation:</label>-->
                                <input name="txt_occp" class="form-control input-sm" type="text"
                                    placeholder="Occupation" required="" value="<?= $row['occupation'] ?>" />
                            </div>
                            <div class="form-group">
                                <!--<label class="control-label">Citizenship:</label>-->
                                <input name="txt_Citizenship" class="form-control input-sm" type="text"
                                    placeholder="Citizenship" required="" value="<?= $row['Citizenship'] ?>" />
                            </div>
                            <div class="form-group">
                                <!--<label class="control-label">Former Address:</label>-->
                                <input name="txt_faddress" class="form-control input-sm" type="text"
                                    placeholder="Former Address" required="" value="<?= $row['formerAddress'] ?>" />
                            </div>


                            <div class="form-group">
                                <!--<label class="control-label">Password:</label>
                                        <input name="txt_upass" class="form-control input-sm" type="password" placeholder="Password" required="" />-->
                            </div>

                            <div class="form-group">
                                <label class="control-label">Image:</label>
                                <input name="txt_image" class="form-control input-sm" type="file" />
                            </div>



                        </div>

                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel" />
                <input type="submit" class="btn btn-primary btn-sm" name="btn_save" value="Update" />
            </div>
        </div>
    </div>
</form>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Function to calculate length of stay and send notification 
        function sendNotification(selectedDate) {
            // Convert the selected date string to a Date object
            var dateMovedIn = new Date(selectedDate);

            // Get the current date
            var today = new Date();

            // Calculate the difference in milliseconds between the current date and the selected date
            var diffInMilliseconds = today - dateMovedIn;

            // Calculate the difference in months (approximately)
            var diffInMonths = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24 * 30));

            // Display the calculated length of stay in months
            $('#length_of_stay').html('Length of stay: ' + diffInMonths + ' months');

            // Check if 6 months have passed
            if (diffInMonths >= 6) {
                // Send notification
                alert("The new resident will now be considered as a citizen of the barangay.");
                // You can replace the alert with an AJAX call to send the notification to the server
            }
        }

        // When the "Add Resident" button is clicked
        $('#btn_add').click(function () {
            // Get the selected date from the input field
            var selectedDate = $('#txt_date_of_transfer').val();

            // Check if a date is selected
            if (selectedDate !== '') {
                // Call the function to send notification
                sendNotification(selectedDate);
            } else {
                // If no date is selected, clear the displayed length of stay
                $('#length_of_stay').html('');
            }
        });
    });  
</script>