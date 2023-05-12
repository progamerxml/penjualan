<?php

function savelog($sql) {
	    mysql_query("insert into err_log(tgl, user, sql_query) values (NOW(),'".$_SESSION['UseName']."','".addslashes($sql)."')");
		 
		
	    echo "Error $sql"; 
	}
		


function cek_format($a){
 
 
	$dt="".substr($a,0, -8)." ".substr($a,-8).""; 
	return $dt; 
}

function get_stock_gudang($prod_id) {
	$rstmp = mysql_query("select Qty from product where ProductID='$prod_id' "); 
	$rw = mysql_fetch_object($rstmp); 
	$curr = $rw->Qty;
	mysql_free_result($rstmp);
	return $curr; 
}


function get_currbalance_akun($kas_id) {
	
	$rstmp = mysql_query("select saldo from akun_kas where nama='$kas_id'");
	$rw = mysql_fetch_object($rstmp); 
	$curr = $rw->saldo ;
	mysql_free_result($rstmp);
	return $curr; 
}


function get_stock_sales($id_sales,$id_barang) {
	$rstmp = mysql_query("select qty from salesman_stock where id_sales='$id_sales' and id_barang='$id_barang' ");
	$rw = mysql_fetch_object($rstmp); 
	$curr = $rw->qty;
	mysql_free_result($rstmp);
	return $curr; 
}




 


function TabelFooter($filename, $rCount,$pg,$jml, $parameter) {
$pgCount = ceil($rCount / $jml);
if ($pgCount) {
	$pgNext = $pgCount;
	$pgFirst = 1;
	$pgLast = $pgCount;
	if ($pgCount > 10) { 
	    $pgFirst = ($pg > 10) ? $pg - 5 : 1;
	    $pgLast = $pg + 5;
	} 
	if ($pgLast > $pgCount) $pgLast = $pgCount;
	if ($rCount > $jml) {
		echo "<div class='pagination'>";
		
		echo "&nbsp;<a href='$filename?$parameter&pg=1&mn=".$_GET[mn]."'>First</a>&nbsp;";
		if ($pg > 1) echo "&nbsp;<a href='$filename?$parameter&pg=".($pg-1)."&mn=".$_GET[mn]."'>Prev</a>&nbsp;";
		for ($i=$pgFirst;$i<=$pgLast;$i++) {
		    if ($i == $pg) { 
		         echo "&nbsp;<a  class='active' href='$filename?$parameter&pg=$i&mn=".$_GET[mn]."'>$i</a>&nbsp;";
		    } else { 
		        echo "&nbsp;<a href='$filename?$parameter&pg=$i&mn=".$_GET[mn]."'>$i</a>&nbsp;";
		    }	 
		}
		if ($pg < $pgCount) echo "&nbsp;<a href='$filename?$parameter&mn=".$_GET[mn]."&pg=".($pg+1)."'>Next</a>&nbsp;";
		echo "&nbsp;<a href='$filename?$parameter&pg=$pgCount&mn=".$_GET[mn]."'>Last</a>&nbsp;";
		echo " </div>";
	}
  	echo "<div class='pagination2'>&nbsp;Halaman $pg dari $pgCount halaman dari total $rCount record</div>";
	return true;
    }
}



function Customer_Number(){
	
	$set=mysql_fetch_assoc(mysql_query("select count(*)+1 as jml  from customer  "));
	$ret="C-".date("dmy").date("his").$set[jml];
	return $ret;

}

function Supp_Number(){
	
	$set=mysql_fetch_assoc(mysql_query("select count(*)+1 as jml  from supplier  "));
	$ret="C-".date("dmy").date("his").$set[jml];
	return $ret;

}

function CashIn_Number(){
	
	$set=mysql_fetch_assoc(mysql_query("select count(*)+1 as jml  from cashin  "));
	$ret="IN-".date("dmy").date("his").$set[jml];
	return $ret;

}

 
 
function  red_msg_result($msg){
	
echo '<div id="message-green">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td class="red-left">'.$msg.'</td>
    <td class="red-right"><a class="close-green"><img src="images/table/icon_close_red.gif"   alt="" /></a></td>
</tr>
</table>
</div>';
	
}
function getcurrsupp_balance($supp_id) {
	$rstmp = mysql_query("select balance from supplier where Number='$supp_id'");
	$rw = mysql_fetch_object($rstmp); 
	$curr = $rw->balance;
	mysql_free_result($rstmp);
	return $curr; 
}
?>