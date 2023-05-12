<?php 
$sql="";
$btn="Simpan";

if($_POST[Simpan_suplier]=="Simpan"){  
	$sql="insert into suplier (nama,alamat,keterangan) value ('".$_POST[nama]."','".$_POST[alamat]."','".$_POST[keterangan]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_suplier]=="Ubah"){  
	$sql="Update suplier set nama='".$_POST[nama]."',alamat='".$_POST[alamat]."',keterangan='".$_POST[keterangan]."' where id='".$_POST[id]."'";   
	$act="Ubah";
} 

if ($sql!=""){
	if (mysql_query($sql)){
		$res="Berhasil $act data";	
	}else{
		$res="Gagal $act data --> ".mysql_error();	
	}
} 

if ($_GET[act]=="hapkat"){
	if (mysql_query("delete from  suplier where nama='".$_GET[id]."' ")){
		$res="Berhsil hapus suplier";	
	}else{
		$res="Gagal hapus divisi --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="editkat"){
	 $set=mysql_fetch_assoc(mysql_query("select nama,alamat,keterangan  from suplier where id='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">
<div class="form-style-2-heading">Input suplier</div>
<form action="" method="post">
<input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
<label for="field1"><span>Nama<span class="required">:</span></span>
  <input type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" />
  </label>
  
<label for="field2"><span>Alamat <span class="required">:</span></span>
  <input type="text" class="input-field" name="alamat" value="<?php echo $set[alamat];?>" size="100" />
  </label>
  
  <label for="field2"><span>Keterangan <span class="required">:</span></span>
  <input type="text" class="input-field" name="keterangan" value="<?php echo $set[keterangan];?>" />
  </label>
  
  
<label><span> </span><input type="submit" value="<?php echo $btn;?>" name="Simpan_suplier" /> <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" />  </label>
</form>
</div> 
<table id="tabel">
  <tr>
    <th>Nama</th>
     <th>Alamat</th>
    <th>Keterangan</th>
    <th>&nbsp;</th>
  </tr>
<?php   
$query = "SELECT * FROM   suplier  "; 
$rs = mysql_query($query); 
	while ($r = mysql_fetch_object($rs)) {  
		echo "<tr valign='top'> 
		<td>$r->nama</td>
		<td>$r->alamat</td>  
		<td>$r->keterangan</td>  
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->id&act=editkat'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->id&act=hapkat'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
	}

?>
 
</table> 
   
   
 </div>
  