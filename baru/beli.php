<script>   
function CEKINPUT(i,j){ 
	qtytmp=document.getElementById("qty_tmp_"+i).value; 
	hb=document.getElementById("hb_"+i).value;  
	hj=document.getElementById("hj_"+i).value;  
	nofaktur=document.getElementById("nofaktur").value;
	spl_beli=document.getElementById("spl_beli").value; 
	nama_cari=document.getElementById("nama_cari").value;  
	kode_cari=document.getElementById("kode_cari").value;
	Cari=document.getElementById("Cari").value; 
	pord_id=j;
	
	// alert(qtytmp +"-"+   spl_beli  +"-"+  nofaktur  +"-"+  spl_beli  +"-"+  pord_id );
	
	
	
	
	if (spl_beli==""){
		alert ("Suplier harus di pilih");	
		return false;
	}else{ 
		window.location="?h=beli&nofaktur="+nofaktur+"&spl_beli="+spl_beli+"&kode_cari="+kode_cari+"&nama_cari="+nama_cari+"&Cari="+Cari+"&qty="+qtytmp+"&pord_id="+pord_id+"&hb="+hb+"&hj="+hj+"&addtmp=OK"; 
		return false;	
	} 
	 
	
}
 
</script>

<?php 

/*

1 Pembelian
- tambah data qty di produk
- insert qty di beli_rinci 
- Mutasi KAS 
- Mutasi Suplier 
2. Retur Pembelian 
- Kurangi data qty di produk
- insert qty di retur_beli_rinci 
- Mutasi KAS 
- Mutasi Suplier 


*/












$sql="";

$jam =date("Y-m-d");
$nofakbeli=$_GET[nofaktur];
$qty=$_GET[qty];
$nofaktur=$_GET[nofaktur];
$spl_beli=$_GET[spl_beli];
$kode_cari=$_GET[kode_cari];
$nama_cari=$_GET[nama_cari];
$Cari=$_GET[Cari];
$addtmp=$_GET[addtmp];
$pord_id=$_GET[pord_id];
$addtmp=$_GET[addtmp];
$harga_beli=$_GET[hb];
$harga_jual=$_GET[hj];



//--------create Nomor Faktur---------///
if ($nofakbeli==""){
	
	$query = "SELECT nofaktur,suplier FROM   tmp_beli order by id desc limit 1";  
	$rs = mysql_query($query); 
	$r = mysql_fetch_object($rs);
	$nofakbeli=$r->nofaktur;
	$spl_beli=$r->suplier;
	
	if ($nofakbeli=="") {
		$nofakbeli	="FBI".date("Ymdhis");
	}
}


//--------insert temp_bli---------///
 
if($addtmp=="OK"){  
	$sql="insert into tmp_beli (nofaktur,produk_id,harga_beli,harga_jual,qty,suplier) value ('".$nofaktur."','".$pord_id."','".$harga_beli."','".$harga_jual."','".$qty."','".$spl_beli."')";   
	$act="Tambah";
	if (mysql_query($sql)){
		$res="Berhsil  Data Pembelian ";	
	}else{
		$res="Gagal  Data Pembelian   --> ".mysql_error();	
	}
} 


//--------insert Simpan Pembelian---------///

if($_POST['Simpan_Beli']=="Simpan"){ 
 
 $pembayaran=$_POST[pembayaran];
 $nofaktur=$_POST[nofakbeli_h];
 $totalbeli=$_POST[total_beli];
 $suplier=$_POST[spl_beli_h]; 
	
	//insert  pembelian
 	mysql_query("insert into beli (nofaktur,suplier,total,pembayaran) value ('".$nofaktur."','".$suplier."','".$totalbeli."','".$pembayaran."')"); 
 
  	//--------insert Mutasi KAs---------///
	$balance = get_currbalance_akun($pembayaran); 
	$currbalance=$balance-$totalbeli;
	$sql="insert into mutasi_kas (kas_id, opr, ket, kredit, lastbalance, currbalance)  values ('".$pembayaran."','User','No Faktur : $nofaktur  $totalbeli','".$totalbeli."','$balance','$currbalance')"; 
	mysql_query($sql);
 	mysql_query("update akun_kas set saldo=saldo-$totalbeli where nama='$pembayaran' "); 
 

	$sql="select nofaktur,produk_id,harga_beli,harga_jual,qty,suplier from  tmp_beli where nofaktur='$nofaktur'";
	$query=mysql_query($sql);
	$xx=1;
	while ($r=mysql_fetch_object($query)){  
	 
		// update stok , harga beli, harga jual
		mysql_query("update produk set harga_jual='$r->harga_jual',harga_beli='".$r->harga_beli."', jml_stok=jml_stok+$r->qty where produk_id='$r->produk_id' ");   
		
		//insert detail pembelian
		
		 
		mysql_query("insert into beli_rinci (nofaktur,produk_id,harga_beli,qty,suplier,harga_jual,sisa_stok) value ('".$r->nofaktur."','".$r->produk_id."','".$r->harga_beli."','".$r->qty."','".$r->suplier."','".$r->harga_jual."','".$r->qty."')");  
	$xx++;
	} 
 
	mysql_query(" delete from tmp_beli where nofaktur='$nofaktur' ");  
	$res="Data Pembelian Berhasil Disimpan";
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  

}



 








 



if ($_GET[act]=="deltmp"){
	if (mysql_query("delete from  tmp_beli")){
		$res="Berhsil hapus Data Pembelian Sementara";	
	}else{
		$res="Gagal hapus Data Pembelian Sementara  --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}



if ($_GET[act]=="haptmpbeli"){
	if (mysql_query("delete from  tmp_beli where id='".$_GET[id]."' ")){
		$res="Berhsil hapus Data Produk";	
	}else{
		$res="Gagal hapus Data Produk --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}

 

?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div>
<?php } ?>


  <div class="form-style-2">
  <div class="form-style-2-heading">Input Pembelian</div>   
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tabel_input"> 
  <tr>
    <td width="4%" ><strong>Tanggal</strong></td>
    <td width="1%" ><strong>:</strong></td>
   
    <td width="5%"  ><?php echo date("Y-m-d"); ?></td>
    <td width="4%"  ><strong>No Faktur </strong></td>
    <td width="2%"  ><strong>:</strong></td>
    <td width="13%"  ><input size="20" type="text" class="input-fieldB" name="nofaktur"  id="nofaktur" value="<?php echo $nofakbeli; ?>" /></td>
    <td width="4%" ><strong>Suplier</strong></td>
    <td width="2%" ><strong>:</strong></td>
    <td width="5%" ><select name="spl_beli" id="spl_beli" class="select-field">
      <option value="">Pilih</option>
      <?php $query = "SELECT  nama  FROM suplier order by nama";   $rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) {  $sel_1=""; if($spl_beli==$r->nama){$sel_1="selected";}else{$sel_1="";} echo "<option value='$r->nama' $sel_1>&nbsp; $r->nama &nbsp;</option>"; } ?>
    </select></td>
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
     <div class="form-style-2-heading">Data Pembelian</div>
     <form action="" name="pembelian" method="post"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
     <input type="hidden" name="nofakbeli_h" value="<?php echo $nofakbeli;?>" />
     <input type="hidden" name="spl_beli_h" value="<?php echo $spl_beli;?>" />
     
     <table id="tabel">
      <tr>
        <th>Kode</th>
        <th>Nama</th>
        <th>Qty</th>
        <th>Stok</th>
        <th>Harga Jual</th>
        <th>Harga Beli</th>
        <th>Sub Total</th>
        <th width="2%">&nbsp;</th>
      </tr>
      <?php   
 
 
$query = "SELECT a.id,a.produk_id,a.qty,b.nama,a.harga_jual,a.harga_beli,b.jml_stok FROM  tmp_beli a, produk b WHERE a.produk_id=b.produk_id"; 
 
$rs = mysql_query($query); 
	$k=1;
	while ($r = mysql_fetch_object($rs)) { 
		$subtotal=$r->harga_beli*$r->qty;
	
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td style='font-size:10px;'>$r->nama</td>  
		<td>$r->qty</td>  
		<td>$r->jml_stok</td> 
		<td>$r->harga_jual</td>
		<td>$r->harga_beli</td>
		<td>$subtotal</td>
		<td class='options-width'  align='center'>  <a href='?h=$_GET[h]&id=$r->id&act=haptmpbeli'> <input  class='hapus' type='button' value='X' name='Batal'/></a> </td>
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
            <th colspan="2">
				<input type="submit" value="Simpan" name="Simpan_Beli" />
              	<input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>&amp;act=deltmp'" />
              	<input type="hidden" name="total_beli" value="<?php echo $total_beli;?>" />
			</th>
        	</tr>
        </table>
        
        
        </th>
        </tr>
      
     </table>
    
    </form>
    </td>
    <td  style="padding-left:20px;" valign="top">
     <form action="" name="pembelian" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    <div class="form-style-2-heading">Data Barang</div>
   
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10%">
			<label for="field2" class="kosong" >
				<strong>Kode</strong>
			</label>
		</td>
        <td width="5%">
			<strong>:</strong>
		</td>
        <td width="26%">
			<input size="20" type="text" class="input-fieldB" name="kode_cari"   id="kode_cari" value="<?php echo $_GET[kode_cari];?>"/>
		</td>
        <td width="18%">
			<strong>Nama</strong>
		</td>
        <td width="3%">
			<strong>:</strong>
		</td>
        <td width="26%">
			<input size="20" type="text" class="input-fieldB" name="nama_cari"   id="nama_cari"  value="<?php echo $_GET[nama_cari];?>"/>
		</td>
        <td width="12%">
			<button type="submit"  id="Cari" value="Cari" name="Cari" class='button cariB'>Cari</button>
		</td>
      </tr>
    </table>
    <table id="tabel" style="margin-top:3px;">
      <tr>
  <th>Kode</th>
   <th>Nama</th>  
    <th width="6%">Qty</th>  
    <th>Stok</th>
    <th width="6%">Harga Beli</th>
    <th width="6%">Harga Jual</th>
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

$query = "SELECT * FROM   produk  where id>0 $where order by id desc limit 14 "; 
 
$rs = mysql_query($query); 
	$i=1;
	while ($r = mysql_fetch_object($rs)) { 
	$pid=$r->produk_id;
	
		echo "<tr valign='top'> 
		<td>$pid</td>
		<td style='font-size:10px;'>$r->nama</td>  
		<td> <input size='8' type='text' class='input-fieldB' name='qty_tmp_$i' id='qty_tmp_$i' value='1'  style='text-align:center'></td>  
		<td align='right'>$r->jml_stok</td> 
		<td> <input size='6' type='text' class='input-fieldB' name='hb_tmp_beli_$i' id='hb_$i' value='$r->harga_beli'  style='text-align:center'></td> 
		<td> <input size='6' type='text' class='input-fieldB' name='hj_tmp_beli_$i' id='hj_$i' value='$r->harga_jual'  style='text-align:center'></td> 
		<td class='options-width'> <button  class='hapus' onclick=\"return CEKINPUT($i,'$pid')\">+</button>
		
		 
		
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
