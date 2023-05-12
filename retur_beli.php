<script> 
function CEKINPUTRETUR(i,j){ 



 
	sisa_stok_retur=document.getElementById("sisa_stok_retur_"+i).value;
	qty_tmp_retur=document.getElementById("qty_tmp_retur_"+i).value;
	hbeli_tmp_retur=document.getElementById("hbeli_tmp_retur_"+i).value;
 
	noretur=document.getElementById("noretur").value;
  
	nama_cari=document.getElementById("nama_cari").value;  
	kode_cari=document.getElementById("kode_cari").value;
	Cari=document.getElementById("Cari").value; 
	id_beli=j;
	 
 
 
	if (sisa_stok_retur-qty_tmp_retur<0) {
		alert ("Sisa Stok Tidak Mencukupi untuk retur"); 	
		return false;
	}else{ 
		 window.location="?h=retur_beli&noretur="+noretur+"&sisa_stok_retur="+sisa_stok_retur+"&kode_cari="+kode_cari+"&nama_cari="+nama_cari+"&Cari="+Cari+"&qty_tmp_retur="+qty_tmp_retur+"&hbeli_tmp_retur="+hbeli_tmp_retur+"&id_beli="+id_beli+"&addtmpretur=OK"; 
		return false;	
	} 
	 
	
}
 
</script>

<?php 
$sql="";

$jam =date("Y-m-d");
 

$nofakturbeli=$_GET[nofakturbeli];
$hbeli_tmp_retur=$_GET[hbeli_tmp_retur];
$noretur=$_GET[noretur];
$sisa_stok_retur=$_GET[sisa_stok_retur];
$qty_tmp_retur=$_GET[qty_tmp_retur];

$nama_cari=$_GET[nama_cari];
$Cari=$_GET[Cari];
$addtmp=$_GET[addtmp];
$id_beli=$_GET[id_beli]; 
$addtmpretur=$_GET[addtmpretur];

 


//--------vreate Nomor Faktur---------///
if ($noretur==""){ 
	$query = "SELECT noretur,suplier FROM   tmp_retur_beli order by id desc limit 1";  
	$rs = mysql_query($query); 
	$r = mysql_fetch_object($rs);
	$noretur=$r->noretur; 
	if ($noretur=="") {
		$noretur	="NRB".date("Ymdhis");
	}
}


 
if($addtmpretur=="OK"){  
	
	//------------- select nomor  faktur beli---------------//
	$query = "SELECT nofaktur,produk_id,suplier  FROM   beli_rinci where id='$id_beli'";  
	$rs = mysql_query($query); 
	$r = mysql_fetch_object($rs); 
	
	//--------insert temp_retur--------///
	$sql="insert into tmp_retur_beli (noretur,nofaktur,suplier,produk_id,harga_beli,qty) value ('".$noretur."','".$r->nofaktur."','".$r->suplier."','".$r->produk_id."','".$hbeli_tmp_retur."','".$qty_tmp_retur."')";   
	$act="Tambah";
	if (mysql_query($sql)){
		$res="Berhsil  Data Retur Pembelian ";	
	}else{
		$res="Gagal  Data Retur Pembelian   --> ".mysql_error();	
	}
} 




if($_POST['Simpan_Retur_Beli']=="Simpan"){ 
 
 $pembayaran=$_POST[pembayaran];
 $nofaktur=$_POST[nofakbeli_h];
 $totalbeli=$_POST[total_beli];
 $suplier=$_POST[spl_beli_h]; 
	
  

	$sql="select noretur,nofaktur,suplier,produk_id,harga_beli,qty,tgl_add from tmp_retur_beli  where noretur='$noretur' ";
	$query=mysql_query($sql);
	$xx=1;
	while ($r=mysql_fetch_object($query)){  
	 	
		/* Cek Beli rinci, Update Stok berdasarkan no faktur beli dan id produk*/
		mysql_query("update beli_rinci set  sisa_stok=sisa_stok-$r->qty where nofaktur='$r->nofaktur' and  produk_id='$r->produk_id' "); 
 	 
		 
		//insert  retur rinci
		mysql_query("insert into retur_beli_rinci (noretur,nofaktur,suplier,produk_id,harga_beli,qty) value ('".$r->noretur."','".$r->nofaktur."','".$r->suplier."','".$r->produk_id."','".$r->harga_beli."','".$r->qty."')"); 
		
		
		
		


	$xx++;
	} 
 
	mysql_query(" delete from tmp_retur_beli where noretur='$noretur' ");  
	$res="Data Retur Pembelian Berhasil Disimpan";
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  

}



 








 



if ($_GET[act]=="deltmp"){
	if (mysql_query("delete from  tmp_beli  ")){
		$res="Berhsil hapus Data Pembelian Sementara";	
	}else{
		$res="Gagal hapus Data Pembelian Sementara  --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}



if ($_GET[act]=="haptmpretur"){
	if (mysql_query("delete from  tmp_retur_beli where id='".$_GET[id]."' ")){
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
  <div class="form-style-2-heading"> Input Retur Pembelian</div>   
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
          <td  >TOTAL : Rp <span id="totalbeli">100.0000</span></td>
          </tr>
      </table></td>
     
  </tr>
   
 
</table>

</div> 
<div class="form-style-2">

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
  <tr>
    <td valign="top" width="60%">
     <div class="form-style-2-heading">Data Retur Pembelian</div>
     <form action="" name="pembelian" method="post"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
     <input type="hidden" name="nofakbeli_h" value="<?php echo $nofakbeli;?>" />
     <input type="hidden" name="spl_beli_h" value="<?php echo $spl_beli;?>" />
     
     <table id="tabel">
      <tr>
      
        <th>Kode</th>
        <th>Nama</th>
        <th>Jml Retur</th>
        <th>Stok</th>
        <th>Harga Beli</th>
        <th>Sub Total</th>
        <th width="2%">&nbsp;</th>
      </tr>
      <?php   
 
 
$query = "SELECT a.id,a.noretur,a.nofaktur,a.suplier,a.produk_id,a.harga_beli,a.qty,b.nama,b.jml_stok FROM  tmp_retur_beli a,produk b WHERE a.noretur='$noretur' and a.produk_id=b.produk_id"; 
 
 
$rs = mysql_query($query); 
	$k=1;
	while ($r = mysql_fetch_object($rs)) { 
		$subtotal=$r->harga_beli*$r->qty;
	
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td style='font-size:10px;'>$r->nama</td>  
		<td>$r->qty</td>  
		<td>$r->jml_stok</td>  
		<td>$r->harga_beli</td>
		<td>$subtotal</td>
		<td class='options-width'  align='center'>  <a href='?h=$_GET[h]&id=$r->id&act=haptmpretur'> <input  class='hapus' type='button' value='X' name='Batal'/></a> </td>
		</tr>  "; 
		$k++;
		$total_beli=$total_beli+$subtotal;
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
            <th colspan="2"><input type="submit" value="Simpan" name="Simpan_Retur_Beli" />
              <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>&amp;act=deltmp'" />
              <input type="hidden" name="total_beli" value="<?php echo $total_beli;?>" /></th>
            </tr>
        </table>
        
        
        </th>
        </tr>
      
     </table>
    
    </form>
    </td>
    <td  style="padding-left:20px;" valign="top">
     <form action="" name="pembelian" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    <div class="form-style-2-heading">Data Retur </div>
   
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
   <th>Tgl Beli</th> 
   <th>Suplier</th> 
    <th width="6%">Stok</th>  
    <th>Jml Retur</th>
    <th width="6%">Harga Beli</th> 
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

$query = "SELECT id,nofaktur,produk_id,harga_beli,harga_jual,sisa_stok,suplier,date(tgl_add) as tgl FROM   beli_rinci  where id>0 $where order by id desc limit 14 "; 
 
$rs = mysql_query($query); 
	$i=1;
	while ($r = mysql_fetch_object($rs)) {  
	$pid=$r->id;
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td>$r->nofaktur</td>
		<td >$r->tgl</td> 
		<td >$r->suplier</td> 
		<td align='right'>$r->sisa_stok  <input   type='hidden' class='input-fieldB' name='sisa_stok_retur_$i' id='sisa_stok_retur_$i' value='$r->sisa_stok'  style='text-align:center'></td> 
		<td> <input size='6' type='text' class='input-fieldB' name='qty_tmp_retur_$i' id='qty_tmp_retur_$i' value='$r->sisa_stok'  style='text-align:center'></td> 
		<td> <input size='6' type='text' class='input-fieldB' name='hbeli_tmp_retur_$i' id='hbeli_tmp_retur_$i' value='$r->harga_beli'  style='text-align:center'></td> 
		<td class='options-width'> <button  class='hapus' onclick=\"return CEKINPUTRETUR($i,'$pid')\">+</button> 
		
		</td>
		</tr>  ";
		$i++;
	}
	

?>
 
</table></form> </td>
  </tr>
   
</table> 
</div> 
<script>
document.getElementById("totalbeli").innerText="<?php echo number_format($total_beli, 0, ",", ".");?>";
</script>
