<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 15; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;



if($_POST[Simpan_Produk]=="Simpan"){  
	$sql="insert into produk (produk_id,provider,nama,harga_jual) value ('".$_POST[kode]."','".$_POST[provider]."','".$_POST[nama]."','".$_POST[harga_jual]."')";   
	$act="Tambah";
} 

if($_POST[Simpan_Produk]=="Ubah"){  
	$sql="Update produk set produk_id='".$_POST[kode]."',provider='".$_POST[provider]."',nama='".$_POST[nama]."',harga_jual='".$_POST[harga_jual]."' where id='".$_POST[id]."'";   
	$act="Ubah";
} 

if ($sql!=""){
	if (mysql_query($sql)){
		$res="Berhasil $act Data Produk";	
	}else{
		$res="Gagal $act Data Produk --> ".mysql_error();	
	}
} 

if ($_GET[act]=="happrod"){
	if (mysql_query("delete from  produk where id='".$_GET[id]."' ")){
		$res="Berhsil hapus Data Produk";	
	}else{
		$res="Gagal hapus Data Produk --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

if ($_GET[act]=="editprod"){
	 $set=mysql_fetch_assoc(mysql_query("select id,produk_id,kategori,provider,nama,harga_jual  from produk where id='$_GET[id]'"));
	 $btn="Ubah";
}


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?> 

<div class="form-style-2">
<div class="form-style-2-heading">Input Produk</div>
<form action="" method="post">  
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tabel_input">
  <tr>
    <td width="15%" >
      <input type="hidden" name="id" value="<?php echo $_GET[id];?>" /><label for="field7"><span >provider <span class="required">:</span></span> 
      <select name="provider" id="provider" class="select-field">
          <option value="">Pilih</option>
          <?php $sel_2=""; $query = "SELECT  nama  FROM provider order by nama";$rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { if($set[provider]==$r->nama){$sel_2="selected";}else{$sel_2="";}  echo "<option value='$r->nama' $sel_2>&nbsp; $r->nama &nbsp;</option>"; } ?>
        </select>
       </label>
	  </td>
     
    <td width="18%"  ><label for="field1"><span>Kode<span class="required">:</span></span>
  <input type="text" class="input-field" name="kode" value="<?php echo $set[produk_id];?>" /></label></td>
    <td width="30%" ><label for="field5"><span>Nama <span class="required">:</span></span>
        <input size="60" type="text" class="input-field" name="nama" value="<?php echo $set[nama];?>" />
    </label></td>
    
    <td width="15%" ><label for="field5"><span>Harga Jual<span class="required">:</span></span>
      <input type="text" class="input-field" name="harga_jual" value="<?php echo $set[harga_jual];?>" />
      </label></td>
  </tr> 
  <tr>
    <td colspan="4" style="padding-top:10px;"><label><span></span>
      <input type="submit" value="<?php echo $btn;?>" name="Simpan_Produk" />
      <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" /> </label> </td>
    </tr>
</table>
</form>
<div class="form-style-2-heading">Pencarian</div>

<form action="" method="get">  
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tabel_input"> 
  <tr>
    <td width="15%" >
    	<input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    	<input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
      <label for="field1"><span>Kode<span class="required">:</span></span>
        <input type="text" class="input-field" name="kode_cari" value="<?php echo $_GET[kode_cari];?>" />
      </label></td>
   
    <td width="18%"  ><label for="field7"><span >provider <span class="required">:</span></span> 
      <select name="provider_cari" id="provider_cari" class="select-field">
        <option value="">Pilih</option>
        <?php $query = "SELECT  nama  FROM provider order by nama      ";   $rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { $sel_1=""; if($_GET[provider_cari]==$r->nama){$sel_1="selected";}else{$sel_1="";}   echo "<option value='$r->nama' $sel_1>&nbsp; $r->nama &nbsp;</option>"; } ?>
      </select>
    </label></td>
    <td width="30%" ><label for="field5"><span>Nama <span class="required">:</span></span>
        <input size="60" type="text" class="input-field" name="nama_cari" value="<?php echo $_GET[nama_cari];?>" />
    </label></td>
    <td width="15%"  class='options-vlgn'    >  <button type="submit"  value="Cari" name="Cari" class='button cari'>Cari</button></td>
  </tr>
 
</table>
</form>
</div> 
<table id="tabel">
  <tr>
    <th>Kode</th>
    <th>Nama</th> 
    <th>Provider</th>  
    <th>Stok</th>
    <th>Harga Jual</th>
    <th>&nbsp;</th>
  </tr>
<?php   
$provider_cari=$_GET[provider_cari];
$nama_cari=$_GET[nama_cari];
$kode_cari=$_GET[kode_cari];

$where="";
if ($provider_cari!=""){ $where.=" and  provider='$provider_cari'"; }
if ($kode_cari!=""){ $where.=" and  produk_id like '%$kode_cari%'"; }
if ($nama_cari!=""){ $where.=" and  nama like '%$nama_cari%'"; }


$q = "select count(*) as jml from produk where 1  $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;
					
					
$query = "SELECT * FROM   produk  where id>0 $where order by id desc limit  $from, $jml "; 
 
$rs = mysql_query($query); 

	while ($r = mysql_fetch_object($rs)) { 
	
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td>$r->nama</td>  
		<td>$r->provider</td>  
		<td>$r->jml_stok</td> 
		<td>$r->harga_jual</td> 
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->id&act=editprod'><button class='button edit'>Ubah</button></a><a href='?h=$_GET[h]&id=$r->id&act=happrod'><button class='button hapus'>Hapus</button></a></td>
		</tr>  "; 
	}

?>
 
</table> 
   <br />
<?php
 TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?><br />
 </div>
  