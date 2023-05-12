<?php 
$sql="";
$btn="Simpan";

if($_POST[Simpan_suplier]=="Simpan"){  
	$sql="insert into akun_kas (nama,keterangan) value ('".$_POST[nama]."','".$_POST[keterangan]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_suplier]=="Ubah"){  
	$sql="Update akun_kas set nama='".$_POST[nama]."',keterangan='".$_POST[keterangan]."' where id='".$_POST[id]."'";   
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
	if (mysql_query("delete from  akun_kas where nama='".$_GET[id]."' ")){
		$res="Berhsil hapus Akun Kas";	
	}else{
		$res="Gagal hapus Akun Kas --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="editakun"){
	 $set=mysql_fetch_assoc(mysql_query("select nama,keterangan  from akun_kas where id='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">
<div class="form-style-2-heading">Input Akun Kas</div>
<form action="" method="post">
<input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
<label for="field1"><span>Nama<span class="required">:</span></span>
  <input type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" />
  </label>
  
<label for="field2"><span>Ketrangan <span class="required">:</span></span>
  <input type="text" class="input-field" name="keterangan" value="<?php echo $set[keterangan];?>" size="100" />
  </label>
<label><span> </span><input type="submit" value="<?php echo $btn;?>" name="Simpan_suplier" /> <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" />  </label>
</form>
</div> 
<table id="tabel">
  <tr>
    <th>Nama</th>
    
    <th>Keterangan</th>
     <th>Saldo</th>
    <th>&nbsp;</th>
  </tr>
  
<?php   
$query = "SELECT * FROM   akun_kas order by nama  "; 
$rs = mysql_query($query); 
	while ($r = mysql_fetch_object($rs)) {  
	
		echo "<tr valign='top'> 
		<td>$r->nama</td> 
		<td >$r->keterangan</td> 
		<td align='right'>$r->saldo</td>
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->id&act=editakun'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->id&act=hapakun'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
		$tot=$tot+$r->saldo;
	}

?>
 <tr>
    <th align="left" colspan="2">Total</th>
    <th align="right"><?php echo number_format($tot, 0, ",", ".");?></th>
    <th>&nbsp;</th>
  </tr>
</table> 
   
   
 </div>
  