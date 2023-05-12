<?php 
$sql="";
$btn="Simpan";

if($_POST[Simpan_Kategori]=="Simpan"){  
	$sql="insert into kategori value ('".$_POST[nama]."','".$_POST[keterangan]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_Kategori]=="Ubah"){  
	$sql="Update kategori set nama='".$_POST[nama]."',keterangan='".$_POST[keterangan]."' where nama='".$_POST[id]."'";   
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
	if (mysql_query("delete from  kategori where nama='".$_GET[id]."' ")){
		$res="Berhsil hapus kategori";	
	}else{
		$res="Gagal hapus divisi --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="editkat"){
	 $set=mysql_fetch_assoc(mysql_query("select nama,keterangan  from kategori where nama='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">
<div class="form-style-2-heading">Input Kategori</div>
<form action="" method="post">
<input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
<label for="field1"><span>Kategori<span class="required">:</span></span><input type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" /></label>
<label for="field2"><span>Keterangan <span class="required">:</span></span><input type="text" class="input-field" name="keterangan" value="<?php echo $set[keterangan];?>" /></label>
<label><span> </span><input type="submit" value="<?php echo $btn;?>" name="Simpan_Kategori" /> <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" />  </label>
</form>
</div> 
<table id="tabel">
  <tr>
    <th>Tipe</th>
    <th>Keterangan</th>
    <th>&nbsp;</th>
  </tr>
<?php   
$query = "SELECT * FROM   kategori  "; 
$rs = mysql_query($query); 
	while ($r = mysql_fetch_object($rs)) {  
		echo "<tr valign='top'> 
		<td>$r->nama</td>
		<td>$r->keterangan</td>  
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->nama&act=editkat'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->nama&act=hapkat'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
	}

?>
 
</table> 
   
   
 </div>
  