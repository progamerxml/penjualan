<?php 
$sql="";
$btn="Simpan";

if($_POST[Simpan_provider]=="Simpan"){  
	$sql="insert into provider (nama,keterangan,tipe) value ('".$_POST[nama]."','".$_POST[keterangan]."','".$_POST[tipe]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_provider]=="Ubah"){  
	$sql="Update provider set nama='".$_POST[nama]."',keterangan='".$_POST[keterangan]."' where nama='".$_POST[id]."'";   
	$act="Ubah";
} 

if ($sql!=""){
	if (mysql_query($sql)){
		$res="Berhasil $act data";	
	}else{
		$res="Gagal $act data --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>"; 
} 

if ($_GET[act]=="hapkat"){
	if (mysql_query("delete from  provider where nama='".$_GET[id]."' ")){
		$res="Berhsil hapus provider";	
	}else{
		$res="Gagal hapus divisi --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="editkat"){
	 $set=mysql_fetch_assoc(mysql_query("select nama,keterangan,tipe  from provider where nama='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">
<div class="form-style-2-heading">Input Provider / Merek</div>
<form action="" method="post">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td><label for="field3"><span><input type="hidden" name="id" value="<?php echo $_GET[id];?>" />Tipe <span class="required">:</span></span>
      <select name="tipe" id="tipe" class="select-field">
        <option value="">Pilih</option>
        <?php 
						$sel_1="";
						$query = "SELECT  nama  FROM tipe order by nama      ";   $rs = mysql_query($query);  
						while ($r = mysql_fetch_object($rs)) {
							if($set[tipe]==$r->nama){$sel_1="selected";}else{$sel_1="";}
								echo "<option value='$r->nama' $sel_1>&nbsp; $r->nama &nbsp;</option>"; 
						} 
					?>
      </select>
    </label></td>
    <td><label for="field2"><span>Nama<span class="required">:</span></span>
        <input type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" />
    </label></td>
    <td><label for="field2"><span>Keterangan <span class="required">:</span></span>
      	<input type="text" class="input-field" name="keterangan" value="<?php echo $set[keterangan];?>"  size="40"/>
    </label>
      <label></label></td>
     
  </tr>
  <tr>
    <td colspan="3"><label><span></span><input type="submit" value="<?php echo $btn;?>" name="Simpan_provider" />
      <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" /></label></td>
    </tr>
</table>
</form>
</div> 
<table id="tabel">
  <tr>
    <th>Nama</th>
    <th>Keterangan</th>
    <th>Tipe</th>
    <th>&nbsp;</th>
  </tr>
<?php   
$query = "SELECT * FROM   provider  "; 
$rs = mysql_query($query); 
	while ($r = mysql_fetch_object($rs)) {  
		echo "<tr valign='top'> 
		<td>$r->nama</td>
		<td>$r->keterangan</td>  
		<td>$r->tipe</td>  
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->nama&act=editkat'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->nama&act=hapkat'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
	}

?>
 
</table> 
   
   
 </div>
  