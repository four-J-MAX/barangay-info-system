<?php

    $ids = array();
    // $ids = implode(",",$_POST["id"]);
    $ids = $_POST["id"];
    
    
    // $deactive = "UPDATE inf SET active=0 where n_id IN(".$ids.")";
    $deactive = "UPDATE tblnewresident SET active=0 where id= ".$ids." ";
    
    $result = mysqli_query($con,$deactive);
    echo mysqli_error($con);

?>