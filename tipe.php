<?php 
$sql="";
$btn="Simpan";

if($_POST[Simpan_Tipe]=="Simpan"){  
	$sql="insert into tipe (nama,keterangan,kategori) value ('".$_POST[nama]."','".$_POST[keterangan]."','".$_POST[kategori]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_Tipe]=="Ubah"){  
	$sql="Update tipe set nama='".$_POST[nama]."',keterangan='".$_POST[keterangan]."',kategori='".$_POST[kategori]."' where id='".$_POST[id]."'";   
	$act="Ubah";
} 

if ($sql!=""){
	if (mysql_query($sql)){
		$res="Berhasil $act data";	
	}else{
		$res="Gagal $act data --> ".mysql_error();	
	}
} 

if ($_GET[act]=="haptipe"){
	if (mysql_query("delete from  tipe where nama='".$_GET[id]."' ")){
		$res="Berhsil Hapus Tipe";	
	}else{
		$res="Gagal  Hapus Tipe --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="edittipe"){
	 $set=mysql_fetch_assoc(mysql_query("select nama,keterangan,kategori  from tipe where id='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">
<div class="form-style-2-heading">Input Tipe</div>



<form action="" method="post">
  
<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="tabel_input">
  <tr>
    <td  >
    	<label for="field2">
        	<input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
        	<span>Kategori <span class="required">:</span> </span>
            <select name="kategori" id="kategori" class="select-field">
  				<option value="">Pilih</option>
  					<?php 
						$sel_1="";
						$query = "SELECT  nama  FROM kategori order by nama      ";   $rs = mysql_query($query);  
						while ($r = mysql_fetch_object($rs)) {
							if($set[kategori]==$r->nama){$sel_1="selected";}else{$sel_1="";}
								echo "<option value='$r->nama' $sel_1>&nbsp; $r->nama &nbsp;</option>"; 
						} 
					?>
			</select> 
       	</label>
 	</td>
    <td><label for="field2"><span>Nama<span class="required">:</span></span>
      <input type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" />
    </label></td>
    <td><label for="field2"><span>Keterangan <span class="required">:</span></span>
      <input type="text" class="input-field" name="keterangan" value="<?php echo $set[keterangan];?>" />
    </label></td>
    <td></td>
  </tr>
  <tr>
    <td colspan="4"><label><span></span><input type="submit" value="<?php echo $btn;?>" name="Simpan_Tipe" />
    <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" />  </label>
    </td>
    </tr>
   
</table>
</form>
</div> 
<table id="tabel">
  <tr>
  	<th>Nama</th>
   	<th>Keterangan</th>
    <th>Kategori</th>
   
    <th>&nbsp;</th>
  </tr>
<?php   
$query = "SELECT * FROM   tipe  "; 
$rs = mysql_query($query); 
	while ($r = mysql_fetch_object($rs)) {  
		echo "<tr valign='top'> 
		<td>$r->nama</td>
		<td>$r->keterangan</td>  
		<td>$r->kategori</td> 
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->id&act=edittipe'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->id&act=haptipe'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
	}

?>
 
</table> 
   
   
 </div>
  