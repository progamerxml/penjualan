<script> 
function CEKINPUTRETUR(i,j,k){ 
	sisa_stok_retur=document.getElementById("sisa_stok_retur_"+i).value;
	qty_tmp_retur=document.getElementById("qty_tmp_retur_"+i).value;
	hjual_tmp_retur=document.getElementById("hjual_tmp_retur_"+i).value;
 
	noretur=document.getElementById("noretur").value;
  
	nama_cari=document.getElementById("nama_cari").value;  
	kode_cari=document.getElementById("kode_cari").value;
	Cari=document.getElementById("Cari").value; 
	id_jual=j;
	p_id=k;

	if (sisa_stok_retur-qty_tmp_retur<0) {
		alert ("Sisa Stok Tidak Mencukupi untuk retur"); 	
		return false;
	}else{ 
		 window.location="?h=retur_jual&noretur="+noretur+"&sisa_stok_retur="+sisa_stok_retur+"&kode_cari="+kode_cari+"&nama_cari="+nama_cari+"&Cari="+Cari+"&qty_tmp_retur="+qty_tmp_retur+"&hjual_tmp_retur="+hjual_tmp_retur+"&id_jual="+id_jual+"&addtmpretur=OK"+"&p_id="+p_id; 
		return false;	
	} 
	 
	
}

</script>

<?php 
$sql="";

$jam =date("Y-m-d");


$nofakturjual=$_GET[nofakturjual];
$hjual_tmp_retur=$_GET[hjual_tmp_retur];
$noretur=$_GET[noretur];
$sisa_stok_retur=$_GET[sisa_stok_retur];
$qty_tmp_retur=$_GET[qty_tmp_retur];

$nama_cari=$_GET[nama_cari];
$Cari=$_GET[Cari];
$addtmp=$_GET[addtmp];
$id_jual=$_GET[id_jual]; 
$p_id=$_GET[p_id];
$addtmpretur=$_GET[addtmpretur];



if ($noretur==""){ 
	$query = "SELECT noretur,sales FROM tmp_retur_jual order by id desc limit 1";  
	$rs = mysql_query($query); 
	$r = mysql_fetch_object($rs);
	$noretur=$r->noretur; 
	if ($noretur=="") {
		$noretur	="NRJ".date("Ymdhis");
	}
}

if($addtmpretur=="OK"){  


	if ( $sisa_stok_retur<$qty_tmp_retur ){
		echo "<script>alert('Stok tidak mencukupi !');</script>";
	}else{

		//------------- select nomor  faktur jual---------------//
		$query = "SELECT nofaktur,produk_id,sales  FROM   jual_rinci where id='$id_jual'";  
		$rs = mysql_query($query); 
		$r = mysql_fetch_object($rs); 
		
		//--------insert temp_retur--------///
		$scek = mysql_query("SELECT noretur,produk_id,sales  FROM   tmp_retur_jual where produk_id='$p_id'");
		$hcek = mysql_num_rows($scek);
	
		if($hcek <= 0) {
			$sql="insert into tmp_retur_jual (noretur,nofaktur,sales,produk_id,harga_jual,qty) value ('".$noretur."','".$r->nofaktur."','".$r->sales."','".$r->produk_id."','".$hjual_tmp_retur."','".$qty_tmp_retur."')";   
			$act="Tambah";
			if (mysql_query($sql)){
				$res="Berhsil Data Retur Penjualan ";	
			}else{
				$res="Gagal Data Retur Penjualan   --> ".mysql_error();	
			}
		}
	}
} 




if($_POST['Simpan_Retur_Jual']=="Simpan"){ 
 
 $pembayaran=$_POST[pembayaran];
 $nofaktur=$_POST[nofakjual_h];
 $totaljual=$_POST[total_jual];
 $sales=$_POST[sales_h];
 $admin = $_SESSION['admin']; 
 $waktu = date("Y-m-d H:i:s"); 
 $ket = "Nomor Retur : ".$noretur."<br>"."waktu : ".$waktu; 
	
  

	$sql="select noretur,nofaktur,sales,produk_id,harga_jual,qty,tgl_add from tmp_retur_jual  where noretur='$noretur' ";
	$query=mysql_query($sql);
	$xx=1;
	while ($r=mysql_fetch_object($query)){ 
		$qtyjual = $r->qty; 
		$hjual = $r->harga_jual;
		$pord_id = $r->produk_id;
		$jum_total=$qtyjual*$hjual; 
	 	
		/* Cek jual rinci, Update Stok berdasarkan no faktur jual dan id produk*/
		// mysql_query("update jual_rinci set sisa_stok=sisa_stok-$r->qty where nofaktur='$r->nofaktur' and  produk_id='$r->produk_id' ");
 	 
		//update stok produk
		mysql_query ("update transaksi_distribusi set qty=qty+$r->qty where kode_barang='$r->produk_id'");

		//insert  retur rinci
		// mysql_query(" INSERT INTO `msfx`.`retur_jual_rinci` ( `noretur`, `nofaktur`, `sales`, `produk_id`, `harga_jual`, `qty`, `total_jual` ) VALUES ( '$r->noretur', '$r->nofaktur', '$r->sales', '$r->produk_id', '$r->harga_jual', '$r->qty', '$jum_total' ) ");
		
		// insert input retur beli
		// mysql_query("insert into input_rjual VALUES (null,'$pord_id','$qtyjual','$admin','$waktu','$ket')");

		
		


	$xx++;
	}
	

	// mysql_query(" delete from tmp_retur_jual where noretur='$noretur' ");  
	// $res="Data Retur Penjualan Berhasil Disimpan";
	// echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  

}


if ($_GET[act]=="deltmp"){
	if (mysql_query("delete from  tmp_jual  ")){
		$res="Berhsil hapus Data Penjualan Sementara";	
	}else{
		$res="Gagal hapus Data Penjualan Sementara  --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}



if ($_GET[act]=="haptmpretur"){
	if (mysql_query("delete from  tmp_retur_jual where id='".$_GET[id]."' ")){
		$res="Berhsil hapus Data Retur Temp";	
	}else{
		$res="Gagal hapus Data Retur Temp --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div>
<?php } ?>


  <div class="form-style-2">
  <div class="form-style-2-heading"> Input Retur Penjualan</div>   
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tabel_input"> 
  <tr>
    <td width="4%" ><strong>Tanggal</strong></td>
    <td width="1%" ><strong>:</strong></td>
   
    <td width="5%"  ><?php echo date("Y-m-d"); ?></td>
    <td width="4%"  ><strong>No Retur </strong></td>
    <td width="2%"  ><strong>:</strong></td>
    <td width="13%"  ><input size="20" type="text" class="input-fieldB" name="noretur"  id="noretur" value="<?php echo $noretur; ?>" /></td>
    <td width="60%" rowspan="2"  align="right"  valign="top">
      
      <table width="47%"  id="tbl_header_jual" cellspacing="0" cellpadding="0"> 
        <tr>
          <td  >TOTAL : Rp <span id="totaljual">100.0000</span></td>
          </tr>
      </table></td>
     
  </tr>
   
 
</table>

</div> 
<div class="form-style-2">

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
  <tr>
    <td valign="top" width="60%">
     <div class="form-style-2-heading">Data Retur Penjualan</div>
     <form action="" name="penjualan" method="post"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
     <input type="hidden" name="nofakjual_h" value="<?php echo $nofakjual;?>" />
     <input type="hidden" name="sales_h" value="<?php echo $sales;?>" />
     
     <table id="tabel">
      <tr>
      
        <th>Kode</th>
        <th>Nama</th>
        <th>Jml Retur</th>
        <th>Stok</th>
        <th>Harga jual</th>
        <th>Sub Total</th>
        <th width="2%">&nbsp;</th>
      </tr>
      <?php   
 
 
$query = "SELECT a.id,a.noretur,a.nofaktur,a.sales,a.produk_id,a.harga_jual,a.qty,b.nama,b.jml_stok FROM  tmp_retur_jual a,produk b WHERE a.noretur='$noretur' and a.produk_id=b.produk_id"; 
 
 
$rs = mysql_query($query); 
	$k=1;
	while ($r = mysql_fetch_object($rs)) { 
		$subtotal=$r->harga_jual*$r->qty;
	
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td style='font-size:10px;'>$r->nama</td>  
		<td>$r->qty</td>  
		<td>$r->jml_stok</td>  
		<td>$r->harga_jual</td>
		<td>$subtotal</td>
		<td class='options-width'  align='center'>  <a href='?h=$_GET[h]&id=$r->id&act=haptmpretur'> <input  class='hapus' type='button' value='X' name='Batal'/></a> </td>
		</tr>  "; 
		$k++;
		$total_jual=$total_jual+$subtotal;
	}
	
	if ($k=="1"){
		
		echo "<tr valign='top'> 
		<td colspan='8' align='center' height='200'><strong>Data Belum Ada</strong></td>
		</tr> 
      <tr>";
		
	}

?>  
        <th colspan="8" align="left">
        
        <table width="20%" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <th>Pembayaran :</th>
            <th align="left"><select name="pembayaran" id="pembayaran" class="select-field">
              <option value="">Pilih</option>
              <?php $query = "SELECT  nama  FROM akun_kas order by nama      ";   $rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { echo "<option value='$r->nama' >&nbsp; $r->nama &nbsp;</option>"; } ?>
            </select></th>
          </tr>
          <tr>
            <th colspan="2"><input type="submit" value="Simpan" name="Simpan_Retur_Jual" />
              <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>&amp;act=deltmp'" />
              <input type="hidden" name="total_jual" value="<?php echo $total_jual;?>" /></th>
            </tr>
        </table>
        
        
        </th>
        </tr>
      
     </table>
    
    </form>
    </td>
    <td  style="padding-left:20px;" valign="top">
     <form action="" name="penjualan" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    <div class="form-style-2-heading">Data Penjualan</div>
   
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10%"><label for="field2" class="kosong" ><strong>Kode</strong></label></td>
        <td width="5%"><strong>:</strong></td>
        <td width="26%"><input size="20" type="text" class="input-fieldB" name="kode_cari"   id="kode_cari" value="<?php echo $_GET[kode_cari];?>"   /></td>
        <td width="18%"><strong>Nama</strong></td>
        <td width="3%"><strong>:</strong></td>
        <td width="26%"><input size="20" type="text" class="input-fieldB" name="nama_cari"   id="nama_cari"  value="<?php echo $_GET[nama_cari];?>" /></td>
        <td width="12%"><button type="submit"  id="Cari" value="Cari" name="Cari" class='button cariB'>Cari</button></td>
      </tr>
    </table>
    <table id="tabel" style="margin-top:3px;">
      	<tr>
      	<th>Kode Produk</th>
  		<th>Nota </th>
		<th>Tgl jual</th> 
		<th>Sales</th> 
		<th width="6%">Stok</th>  
		<th>Jml Retur</th>
		<th width="6%">Harga jual</th> 
		<th width="2%">&nbsp;</th>
  		</tr>
<?php   
$provider_cari=$_GET[provider_cari];
$nama_cari=$_GET[nama_cari];
$kode_cari=$_GET[kode_cari];

$where="";
if ($provider_cari!=""){ $where.=" and  provider='$provider_cari'"; }
if ($kode_cari!=""){ $where.=" and  produk_id like '%$kode_cari%'"; }
if ($nama_cari!=""){ $where.=" and  nama like '%$nama_cari%'"; }

$query = "SELECT id,nofaktur,produk_id,harga_beli,harga_jual,sisa_stok,sales,date(tgl_add) as tgl FROM jual_rinci where id>0 $where order by id desc limit 14"; 
 
$rs = mysql_query($query); 
	$i=1;
	while ($r = mysql_fetch_object($rs)) {  
	$pid=$r->id;
	$p_id=$r->produk_id;
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td>$r->nofaktur</td>
		<td >$r->tgl</td> 
		<td >$r->sales</td> 
		<td align='right'>$r->sisa_stok  <input type='hidden' class='input-fieldB' name='sisa_stok_retur_$i' id='sisa_stok_retur_$i' value='$r->sisa_stok' style='text-align:center'></td> 
		<td> <input size='6' type='text' class='input-fieldB' name='qty_tmp_retur_$i' id='qty_tmp_retur_$i' value='0'  style='text-align:center'></td> 
		<td> <input size='6' type='text' class='input-fieldB' name='hjual_tmp_retur_$i' id='hjual_tmp_retur_$i' value='$r->harga_jual'  style='text-align:center'></td> 
		<td class='options-width'> <button  class='hapus' onclick=\"return CEKINPUTRETUR($i,'$pid','$p_id')\">+</button> 
		
		</td>
		</tr>  ";
		$i++;
	}
	

?>
 
</table></form> 

</td>
  </tr>
   
</table> 
</div> 
<script>
document.getElementById("totaljual").innerText="<?php echo number_format($total_jual, 0, ",", ".");?>";
</script>
