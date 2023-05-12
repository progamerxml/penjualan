<?php
 $conn = mysqli_connect("localhost","root","") or die ("Error: " . mysqli_error($conn));  
 mysqli_select_db($conn,"msfx") or die ("Error: " . mysqli_error($conn));
?>