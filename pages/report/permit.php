<form class="form-inline" action="" method="GET">
                    <div class="form-group">
                        <label for="from_date">From Date</label>
                        <input type="date" class="form-control" id="from_date_permit" name="from_date"
                            value="<?php if(isset($_GET['from_date'])){ echo $_GET['from_date']; } ?>" onchange="handleChange(event, 'min')" />
                    </div>
                    <div class="form-group">
                        <label for="to_date">To Date:</label>
                        <input type="date" class="form-control" id="to_date_permit" name="to_date"
                            value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" onchange="handleChange(event, 'max')" />
                    </div>
                    <button type="submit" name="permit_filter" class="btn btn-primary">Filter</button>
                </form>

                <div style="margin-top: 1rem" id="permit">
                    <table id="table" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                            <th>Resident</th>
                            <th>Business Name</th>
                            <th>Business Address</th>                
                            <th>OR Number</th>
                            <th>Amount</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                       if (isset($_GET['permit_filter'])) {
                        if(isset($_GET['from_date']) && isset($_GET['to_date']))
                        {
                            $from_date = $_GET['from_date'];
                            $to_date = $_GET['to_date'];

                            if ($isZoneLeader) {
                                $query = "SELECT *,CONCAT(r.lname, ', ' ,r.fname, ' ' ,r.mname) as residentname,p.id as pid FROM tblpermit p left join tblresident r on r.id = p.residentid WHERE r.barangay = '$zone_barangay' AND dateRecorded BETWEEN '$from_date' AND '$to_date'";
                            }else{
                                $query = "SELECT *,CONCAT(r.lname, ', ' ,r.fname, ' ' ,r.mname) as residentname,p.id as pid FROM tblpermit p left join tblresident r on r.id = p.residentid WHERE dateRecorded BETWEEN '$from_date' AND '$to_date'";
                            }
                            $result = $con->query($query);

                            if($result->num_rows > 0)
                            {
                                while($row = $result->fetch_assoc()) {
                                    echo '
                                            <tr>
                                                 <td>'.$row['residentname'].'</td>
                                                 <td>'.$row['businessName'].'</td>
                                                 <td>'.$row['businessAddress'].'</td>    
                                                 <td>'.$row['orNo'].'</td>
                                                 <td>₱ '.number_format($row['samount'],2).'</td>
                                            </tr>
                                        ';
                                }
                            }
                            else
                            {
                                echo "
                                        <tr>
                                            <td>No Record Found</td>
                                        </tr>
                                    ";
                            }
                        }
                       }
                    ?>
                        </tbody>
                    </table>
                </div>

               <?php 
                if (isset($_GET['from_date'])) {
                    ?>
                     <a href="print.php?from_date=<?= $_GET['from_date'] ?>&to_date=<?= $_GET['to_date'] ?>&permit_filter" class="btn btn-primary btn-sm" style="margin-left: 20px;">Print</a>
                    <?php 
                }
               ?>
                <script>
                    let btnPermit =document.getElementById("btnPermit")

                    btnPermit.onclick = () => {
                        window.print()
                        // document.getElementById("clearance").classList.add("dont-print")
                        // document.getElementById("blotter").classList.add("dont-print")
                        // document.getElementById("blotter1").classList.add("dont-print")
                    }
                       
                </script>
              
