<!-- ========================= MODAL ======================= -->
<div id="addCourseModal" class="modal fade">
    <form method="post">
        <div class="modal-dialog modal-sm" style="width:300px !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Manage Officials</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Positions:</label>
                                <select name="ddl_pos" class="form-control input-sm">
                                    <option selected="" disabled="">-- Select Positions -- </option>
                                    <option value="Captain">Barangay Captain</option>
                                    <option value="Kagawad(Peace and Order)">Barangay Kagawad (Peace and Order)</option>
                                    <option value="Kagawad(Religious Affairs)">Barangay Kagawad (Religious Affairs)</option>
                                    <option value="Kagawad(Health)">Barangay Kagawad (Health)</option>
                                    <option value="Kagawad(Budget & Finance)">Barangay Kagawad (Budget & Finance)</option>
                                    <option value="Kagawad(Socio-Cultural Affairs)">Barangay Kagawad (Socio-Cultural Affairs)</option>
                                    <option value="Kagawad(Education)">Barangay Kagawad (Education)</option>
                                    <option value="Kagawad(Infrastracture)">Barangay Kagawad (Infrastructure)</option>
                                    <option value="Kagawad">Barangay Kagawad</option>
                                    <option value="SK Chairman">SK Chairman</option>
                                    <option value="Secretary">Barangay Secretary</option>
                                    <option value="Treasurer">Barangay Treasurer</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Name:</label>
                                <input name="txt_cname" class="form-control input-sm" type="text" placeholder="Lastname, Firstname Middlename" />
                            </div>
                            <div class="form-group">
                                <label>Contact #:</label>
                                <input name="txt_contact" class="form-control input-sm" type="number" placeholder="Contact #" />
                            </div>
                            <div class="form-group">
                                <label>Address:</label>
                                <input name="txt_address" class="form-control input-sm" type="text" placeholder="Address" />
                            </div>
                            
                            <?php if ($_SESSION['role'] == 'Administrator') { ?>
                            <div class="form-group">
                                <label>Barangay:</label>
                                <select name="ddl_barangay" class="form-control input-sm">
                                    <option selected="" disabled="">-- Select Barangay --</option>
                                    <option value="Poblacion">Poblacion</option>
                                    <option value="Mancilang">Mancilang</option>
                                    <option value="Talangnan">Talangnan</option>
                                    <option value="Malbago">Malbago</option>
                                    <option value="Tarong">Tarong</option>
                                    <option value="Tugas">Tugas</option>
                                    <option value="Maalat">Maalat</option>
                                    <option value="Pili">Pili</option>
                                    <option value="Kaongkod">Kaongkod</option>
                                    <option value="Bunakan">Bunakan</option>
                                    <option value="Tabagak">Tabagak</option>
                                    <option value="Kodia">Kodia</option>
                                    <option value="Kangwayan">Kangwayan</option>
                                    <option value="San Agustin">San Agustin</option>
                                </select>
                            </div>
                            <?php } ?>
                            
                            <div class="form-group">
                                <label>Start Term:</label>
                                <input id="txt_sterm" name="txt_sterm" class="form-control input-sm" type="date" placeholder="Start Term" />
                            </div>
                            <div class="form-group">
                                <label>End Term:</label>
                                <input name="txt_eterm" class="form-control input-sm" type="date" placeholder="End Term" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel" />
                    <input type="submit" class="btn btn-primary btn-sm" name="btn_add" value="Add Officials" />
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('input[name="txt_sterm"]').change(function () {
            var startterm = document.getElementById("txt_sterm").value;
            console.log(startterm);
            document.getElementsByName("txt_eterm")[0].setAttribute('min', startterm);
        });
    });
</script>
