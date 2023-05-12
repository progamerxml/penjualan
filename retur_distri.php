<script> 
function CEKINPUT(i,j){ 
	qtytmp=document.getElementById("qty_tmp_"+i).value; 
  sisastok=document.getElementById("sisa_stok_retur_"+i).value;
	hb=document.getElementById("hb_"+i).value;  
	hj=document.getElementById("hj_"+i).value;  
	noretur=document.getElementById("noretur").value;
	sales=document.getElementById("sales").value; 
	nama_cari=document.getElementById("nama_cari").value;  
	kode_cari=document.getElementById("kode_cari").value;
	Cari=document.getElementById("Cari").value; 
	pord_id=j;
	
	// alert(qtytmp +"-"+   spl_jual  +"-"+  nofaktur  +"-"+  spl_jual  +"-"+  pord_id );




	if (sales==""){
		alert ("Sales harus di pilih");
		return false;
	}else{ 
		window.location="?h=retur_distri&sales="+sales+"&noretur="+noretur+"&kode_cari="+kode_cari+"&nama_cari="+nama_cari+"&Cari="+Cari+"&qty="+qtytmp+"&stok="+sisastok+"&pord_id="+pord_id+"&hb="+hb+"&hj="+hj+"&addtmp=OK"; 
		return false;	
	} 
	 
	
}

function sales(){
  sales=document.getElementById("sales").value; 
  window.location="?h=retur_distri&sales="+sales;
}
</script>



<?php 

/*

1 penjualan
- tambah data qty di produk
- insert qty di jual_rinci 
- Mutasi KAS 
- Mutasi Suplier 
2. Retur penjualan 
- Kurangi data qty di produk
- insert qty di retur_jual_rinci 
- Mutasi KAS 
- Mutasi Suplier 


*/
$sql="";

$jam =date("Y-m-d");
$nofakjual=$_GET[nofaktur];
$sisastok= $_GET[stok];
$qty=$_GET[qty];
$nofaktur=$_GET[nofaktur];
$sales=$_GET[sales];
$kode_cari=$_GET[kode_cari];
$nama_cari=$_GET[nama_cari];
$Cari=$_GET[Cari];
$addtmp=$_GET[addtmp];
$pord_id=$_GET[pord_id];
$harga_beli=$_GET[hb];
$harga_jual=$_GET[hj];

$n = mysql_fetch_object(mysql_query("select * from transaksi_distribusi where kode_barang = '$pord_id'"));
$nodistribusi = $n->kode_transaksi;

//--------create Nomor Faktur---------///
if ($noretur==""){
	
	$query = "SELECT noretur,sales FROM tmp_retur_distri order by id desc limit 1";  
	$rs = mysql_query($query); 
	$r = mysql_fetch_object($rs);
	$noretur=$r->noretur;
	$sales=$r->sales;
	
	if ($noretur=="") {
		$noretur	="NRD".date("Ymdhis");
	} 
}


//--------insert temp_bli---------///
 
if($addtmp=="OK"){
  if ( $qty>$sisastok ){
    echo "<script>alert('stok retur tidak mencukupi !');</script>";
  }else{
    $sales = $_GET["sales"];
    $cek =mysql_query("SELECT * FROM tmp_retur_distri where noretur = '$noretur' and sales = '$sales' and produk_id='$pord_id' and jumlah = '$qty'");
    $cekf = mysql_num_rows($cek);
    if($cekf <= 0){
      
      $sql="insert into tmp_retur_distri (nodistribusi,noretur,produk_id,harga_jual,jumlah,sales) value ('".$n->kode_transaksi."','".$noretur."','".$pord_id."','".$harga_jual."','".$qty."','".$sales."')";   
      $act="Tambah";
      if (mysql_query($sql)){
        $res="Berhsil  Data Distribusi ";	
      }else{
        $res="Gagal  Data Distribusi   --> ".mysql_error();
      }
    }
  }
} 


//--------insert Simpan Retur Distribusi---------///

if($_POST['Simpan_Retur_Distri']=="Simpan"){ 

 $nodistribusi = $n->kode_transaksi;
 $totalretur=$_POST[total_retur];
 $sales=$_POST[sales_h];
 $admin = $_SESSION['admin']; 
 $waktu = date("Y-m-d H:i:s"); 
 $ket = "No Distribusi : ".$nodistribusi."<br>"."waktu : ".$waktu;
	
  $sql_query = mysql_query ("select * from tmp_retur_distri where noretur = '$noretur'");
  $r=1;
  while($nsql = mysql_fetch_object($sql_query)) { 

      $subtotal = $nsql->jumlah*$nsql->harga_jual;
      // insert  retur_distribusi
      mysql_query("INSERT INTO `msfx`.`retur_distribusi` (`id`,`noretur`,`no_distribusi`,`sales`,`produk_id`,`qty`,`total`,`tgl_retur`,`admin`) VALUES (NULL , '$noretur', '$nsql->nodistribusi', '$sales', '$nsql->produk_id', '$nsql->jumlah', '$subtotal', '$waktu', '$admin')");

      //update stok produk
		  mysql_query("update produk set jml_stok=jml_stok+'$nsql->jumlah' where produk_id='$nsql->produk_id'");

      //update stok produk
		  mysql_query("update transaksi_distribusi set qty=qty-'$nsql->jumlah' where kode_barang='$nsql->produk_id'");

      // insert input retur distribusi
      mysql_query ("INSERT INTO `msfx`.`input_rdistribusi` ( `id` , `produk_id` , `jumlah` , `sales` , `admin` , `keterangan` ) VALUES (NULL, '$nsql->produk_id', '$nsql->jumlah', '$sales', '$admin', '$ket')");
     $r++;
  }

	mysql_query(" delete from tmp_retur_distri where noretur='$noretur' ");  
	$res="Data Retur Distribusi Berhasil Disimpan";
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  

}


if ($_GET[act]=="deltmp"){
	if (mysql_query("delete from tmp_retur_distri")){
		$res="Berhsil hapus Data Retur Distribusi Sementara";	
	}else{
		$res="Gagal hapus Data Retur Distribusi Sementara  --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}



if ($_GET[act]=="haptmpdistri"){
	if (mysql_query("delete from  tmp_retur_distri where id='".$_GET[id]."' ")){
		$res="Berhsil hapus Data Produk";	
	}else{
		$res="Gagal hapus Data Produk --> ".mysql_error();	
	}
	echo "<script language='javascript'> window.location='?h=$_GET[h]&res=$res'</script>";  
}



?>

<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div>
<?php } ?>

<div class="row">
  <div class="form-style-2"class = "col">
  <div class="form-style-2-heading">Input Retur Distribusi</div>   
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tabel_input"> 
  <tr>
    <td width="4%" ><strong>Tanggal</strong></td>
    <td width="1%" ><strong>:</strong></td>
   
    <td width="5%"  ><?php echo date("Y-m-d"); ?></td>
    <td width="4%"  ><strong>No Retur</strong></td>
    <td width="1%"  ><strong>:</strong></td>
    <td width="13%"  ><input size="20" type="text" class="input-fieldB" name="noretur"  id="noretur" value="<?php echo $noretur; ?>" /></td>
    <td width="4%" ><strong>Sales</strong></td>
    <td width="2%" ><strong>:</strong></td>
    <td width="5%" >
      <select name="sales" id="sales" class="select-field">
        <option onclick="window.location='?h=<?php echo $_GET[h];?>'" value="">Pilih</option>
        <?php 
          $query = "SELECT  nama  FROM sales order by nama";
          $rs = mysql_query($query);
          while ($r = mysql_fetch_object($rs)) {?>

          <option value="<?php echo $r->nama; ?>" <?php if($r->nama==$_GET[sales]){ echo "selected";}else{echo "";} ?> onclick="sales()">&nbsp; <?php echo $r->nama; ?>&nbsp;</option>
            
        <?php } ?>
      </select>
    </td>
    <td width="60%" rowspan="2"  align="right"  valign="top">
    
    <table width="47%"  id="tbl_header_jual" cellspacing="0" cellpadding="0"> 
      <tr>
        <td  >TOTAL : Rp <span id="totalretur">100.0000</span></td>
      </tr>
      </table></td>
     
  </tr>
   
 
</table>

</div> 
<div class="form-style-2" class = "col">

    <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr>
        <td valign="top" width="60%">
         <div class="form-style-2-heading">Data Retur Distribusi</div>
         <form action="" name="retur_distribusi" method="post"> 
         <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
         <input type="hidden" name="noretur_h" value="<?php echo $noretur;?>" />
         <input type="hidden" name="sales_h" value="<?php echo $sales;?>" />
         
         <table id="tabel">
          <tr>
            <th>Kode</th>
            <th>Nama</th>
            <th>Qty</th>
            <th>Stok</th>
            <th>Harga Jual</th>
            <th>Sub Total</th>
            <th width="2%">&nbsp;</th>
          </tr>
          <?php   
     
     
    $query = "select produk.nama, produk.produk_id, produk.jml_stok, tmp_retur_distri.noretur, tmp_retur_distri.harga_jual, tmp_retur_distri.id, tmp_retur_distri.jumlah from produk inner join tmp_retur_distri on produk.produk_id = tmp_retur_distri.produk_id order by tmp_retur_distri.tgl_add desc"; 
     
    $rs = mysql_query($query); 
        $k=1;
        while ($r = mysql_fetch_object($rs)) { 
            $subtotal=$r->harga_jual*$r->jumlah;
        
            echo "<tr valign='top'> 
            <td>$r->produk_id</td>
            <td style='font-size:10px;'>$r->nama</td>  
            <td>$r->jumlah</td>  
            <td>$r->jml_stok</td> 
            <td>$r->harga_jual</td>
            <td>$subtotal</td>
            <td class='options-width'  align='center'>  <a href='?h=$_GET[h]&id=$r->id&act=haptmpdistri'> <input  class='hapus' type='button' value='X' name='Batal'/></a> </td>
            </tr>  "; 
            $k++;
            $total_retur=$total_retur+$subtotal;
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
                <th colspan="2"><input type="submit" value="Simpan" name="Simpan_Retur_Distri"/>
                      <input type="button" value="Batal" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>&amp;act=deltmp'" />
                      <input type="hidden" name="total_retur" value="<?php echo $total_retur;?>" /></th>
                      <input type="hidden" name="sub_total" value="<?php echo $subtotal;?>" /></th>
                </tr>
            </table>
            
            
            </th>
            </tr>
          
         </table>
        
        </form>
        </td>
        <td  style="padding-left:20px;" valign="top">
         <form action="" name="retur_distri" method="get"> 
         <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
        <div class="form-style-2-heading">Data Barang</div>
       
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
    
    if (isset($_GET[sales])){

    $where="";
      if ($provider_cari!=""){ $where.=" and  provider='$provider_cari'"; }
      if ($kode_cari!=""){ $where.=" and  transaksi_distribusi.kode_barang like '%$kode_cari%'"; }
      if ($nama_cari!=""){ $where.=" and  transaksi_distribusi.nama_barang like '%$nama_cari%'"; }

      $query = "SELECT transaksi_distribusi.kode_barang, transaksi_distribusi.nama_barang, transaksi_distribusi.qty, transaksi_distribusi.nama_sales, produk.jml_stok, produk.harga_beli, produk.harga_jual
      FROM (
      transaksi_distribusi
      INNER JOIN produk ON transaksi_distribusi.kode_barang = produk.produk_id
      )
      WHERE transaksi_distribusi.nama_sales = '$_GET[sales]' $where order by produk.tgl_update desc limit 14";
    }else{

      $where="";
      if ($provider_cari!=""){ $where.=" and  provider='$provider_cari'"; }
      if ($kode_cari!=""){ $where.=" and  produk_id like '%$kode_cari%'"; }
      if ($nama_cari!=""){ $where.=" and  nama like '%$nama_cari%'"; }
      
      $query = "SELECT * FROM   produk  where id>0 $where order by id desc limit 14 "; 
    }

    // if(isset($sales)){ 

    // }else{
    //   if ($provider_cari!=""){ $where.=" and  provider='$provider_cari'"; }
    //   if ($kode_cari!=""){ $where.=" and  produk_id like '%$kode_cari%'"; }
    //   if ($nama_cari!=""){ $where.=" and  nama like '%$nama_cari%'"; }
    
    //   $query = "SELECT * FROM   produk  where id>0 $where order by id desc limit 14 ";
    // }
     
    $rs = mysql_query($query); 
        $i=1;
        while ($r = mysql_fetch_object($rs)) { 
          if(isset($_GET[sales])){
            $pid = $r->kode_barang;
            $nama = $r->nama_barang;
            $stok = $r->qty;
          }else{
            $pid = $r->produk_id;
            $nama = $r->nama;
            $stok = $r->jml_stok;
            
          }
        
            echo "<tr valign='top'> 
            <td>$pid</td>
            <td style='font-size:10px;'>$nama</td>  
            <td> <input size='5' type='text' class='input-fieldB' name='qty_tmp_$i' id='qty_tmp_$i' value='1'  style='text-align:center'></td>  
            <td align='right'>$stok <input type='hidden' class='input-fieldB' name='sisa_stok_retur_$i' id='sisa_stok_retur_$i' value='$stok' style='text-align:center'></td> 
            <td> <input size='4' type='text' class='input-fieldB' name='hb_tmp_jual_$i' id='hb_$i' value='$r->harga_beli'  style='text-align:center'></td> 
            <td> <input size='4' type='text' class='input-fieldB' name='hj_tmp_jual_$i' id='hj_$i' value='$r->harga_jual'  style='text-align:center'></td> 
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
		
	</div>
</div>

<script>
document.getElementById("totalretur").innerText="<?php echo number_format($total_retur, 0, ",", ".");?>";
</script>
