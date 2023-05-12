<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 5; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;


if ($_GET[act]=="input"){

    $id = $_GET[id];
    $namafield = "qty_distri_$id";
    $qtyDistri = $_GET[$namafield];

    $query1 = " SELECT * FROM `produk` WHERE `id` =$id LIMIT 0 , 30 "; 
    $rs1 = mysql_query($query1); 
	  $r1 = mysql_fetch_object($rs1);

    $produk_id=($r1->produk_id);
    $provider=($r1->provider);
    $nama=($r1->nama);
    $jml_stok=($r1->jml_stok);
    $harga_jual=($r1->harga_jual);

    if($jml_stok<=0){
      $res = "Maaf stok sedang kosong.";
    }
    if($jml_stok<$qtyDistri){

      $res = "Maaf stok tidak mencukupi.";

    }else{

      $cis = mysql_query("SELECT * FROM `stok_distribusi` WHERE `produk_id` = '$produk_id'"); 
      
      $cob = mysql_affected_rows(); 
      if($cob>0){
        $ncis = mysql_fetch_object($cis); $stok_dawal = $ncis->jml_stok; $stok_dUpdate = $stok_dawal + $qtyDistri;
        $qusd = "UPDATE `msfx`.`stok_distribusi` SET `jml_stok` = '$stok_dUpdate' WHERE `stok_distribusi`.`produk_id` ='$produk_id'";
      }else{
        $qusd = "INSERT INTO `msfx`.`stok_distribusi` (`produk_id` ,`provider` ,`nama` ,`harga_jual` ,`jml_stok` ) VALUES ('$produk_id','$provider','$nama','$harga_jual','$qtyDistri')";
      }
      
      if(mysql_query($qusd)) {
        $stokUpdate = $jml_stok - $qtyDistri;
        $querykurangistok = "UPDATE `msfx`.`produk` SET `jml_stok` = '$stokUpdate' WHERE `produk`.`id` ='$id'";
        if (mysql_query($querykurangistok)) {
          $res="Berhasil Menambahkan barang ke stok Distribusi";
        }
      }else{
        $res="Gagal Menambahkan barang ke stok Distribusi".mysql_error();
      }
    }

}
if (isset($_POST['qty_distri'])){
  $nama_sales = $_POST['sales'];
  $kode_sales = $_POST['kode_sales'];
  $nama_barang_distri = $_POST['nama_barang'];
  $kode_barang_distri = $_POST['kode_barang'];
  $kuota_barang_distri = $_POST['qty_distri'];
  $faktur_distri = $_POST['faktur_distri'];
  $jml_stok_distri = $_POST['jml_stok_distri'];
  
  if($jml_stok_distri<$kuota_barang_distri) {
    $res = "Kuota barang tidak mencukupi.";
  }else{
    $qi_td = "INSERT INTO transaksi_distribusi (nama_sales, nama_barang, kode_barang, qty, keterangan) VALUES ('$nama_sales', '$nama_barang_distri', '$kode_barang_distri', '$kuota_barang_distri','$faktur_distri')";
    if(mysql_query($qi_td)) {
  
      $res="Distribusi Barang Berhasil";
    }else{
      $res = "Distribusi Barang Gagal, ".mysql_error();
    }
  }
}

  ?>



<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  

<div class="form-style-2-heading">Input Stok Distribusi</div>

<form action="" method="get">  
<table style="font-size: 13px;" border="0" cellspacing="0" cellpadding="0" class="mb-2">
<input type="hidden" name="h" value="<?php echo $_GET[h];?>"/>
  <tr>
    <td class="py-1 pe-3">
      <input type="text" name="kode_cari" id="kode_cari" placeholder="masukan kode barang" size = "20" class="input-fieldB px-1" value="<?php echo $_GET[kode_cari];?>">
    </td>
    <td class="py-1 pe-3">
      <select name="provider_cari" id="provider_cari" class="select-field">
        <option value="">Pilih Provider</option>
        <?php $query = "SELECT  nama  FROM provider order by nama      ";   $rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { $sel_1=""; if($_GET[provider_cari]==$r->nama){$sel_1="selected";}else{$sel_1="";}   echo "<option value='$r->nama' $sel_1>&nbsp; $r->nama &nbsp;</option>"; } ?>
      </select>
    </td>
    <td class="py-1 pe-3">
      <input size="40" type="text" class="input-fieldB px-1" name="nama_cari" placeholder="masukan nama barang" value="<?php echo $_GET[nama_cari];?>" />
    </td>
    <td class="py-1 pe-3">
      <button type="submit"  value="Cari" name="Cari" class="button cari">Cari</button>
    </td>
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
    <th style="text-align: center;">Qty Distribusi</th>
    <th width="10%">&nbsp;</th>
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
					
					
$query = "SELECT * FROM   produk  where id>0 $where order by jml_stok desc limit  $from, $jml "; 
 
$rs = mysql_query($query);
	while ($r = mysql_fetch_object($rs)) {
    echo "<tr valign='top'>
    <form action=''method='get'>
            <td>
                $r->produk_id
            </td>
            <td>
                $r->nama
            </td>  
            <td>
                $r->provider
            </td>  
            <td>
                $r->jml_stok
            </td> 
            <td class='options-width'>
                <input type='hidden' name='h' value='$_GET[h]'>
                <input type='hidden' name='act' value='input'>
                <input type='hidden' name='id' value='$r->id'>
                <input type='number' name='qty_distri_$r->id' id='qty_distri' size='8'>
                </td> 
                <td class='options-width'> 
                <a href='?h=$_GET[h]&id=$r->id&act=input'>
                <button class='button edit'>
                Input
                </button>
                </a>
            </td>
    </form>
		</tr>";
	}
?>
</table> 
<br />
<?php
 TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?><br />
 </div>

<hr>

<div class="form-style-2" class = "col">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" > 
      <tr>
        <td valign="top" width="80%">
          <div class="form-style-2-heading">Input Distribusi Sales</div>

          <table class="mb-3">
            <tr>
              <td class="pe-3 py-1">
              <form action="" method="post">
              <?php
                  $keyword = $_POST['barang_distri'];
                  $query_barang = "SELECT * FROM stok_distribusi WHERE nama like '%$keyword%' || produk_id like '%$keyword%' ";
                  $hsl = mysql_query($query_barang);
                  $data_hsl = mysql_fetch_object($hsl);
                  $value_barang = $data_hsl->nama;
                  $id_barang = $data_hsl->produk_id;
              ?>
                <input type="text" name="barang_distri" id="barang_distri" placeholder="masukan nama/kode barang" size = "30" class="input-fieldB px-1" value="<?php if(!isset($keyword)){ $value_barang = ""; }else{echo $value_barang;}?>" required>
              </td>
              <td class="px-3 py-1">
                <button type="submit" class="button cariB">cek barang</button>
              </td>
              </form>

              <form action="" method="post">
              <td class="px-3 py-1">
                <select name="sales" class="select-field" id="sales" required>
                  <option value="">Pilih Sales</option>
                  <?php $query = "SELECT  *  FROM sales order by id";   $rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { echo "<option value='$r->nama' >&nbsp; $r->nama &nbsp;</option>"; } ?>
                </select>
              </td>

              <input type="hidden" name="jml_stok_distri" value="<?php echo $data_hsl->jml_stok; ?>">
              <input type="hidden" name="kode_barang" value="<?php echo $data_hsl->produk_id; ?>">
              <input type="hidden" name="nama_barang" value="<?php echo $data_hsl->nama; ?>">
              <?php
                $qnf = "SELECT nofaktur FROM beli_rinci WHERE produk_id LIKE '$id_barang'";
                $hsl_qnf = mysql_query($qnf);
                $nilai_qnf = mysql_fetch_object($hsl_qnf);
              ?>
              <input type="hidden" name="faktur_distri" id="faktur_distri" value="<?php echo 'faktur : '.$nilai_qnf->nofaktur; ?>" />

              <td class="px-3 py-1">
                <input type="number" name="qty_distri" id="qty_distri" placeholder="masukan stok" class="input-fieldB mx-1" required>
              </td>
              <td class="px-3 py-1">
                <button type="submit" class="button cariB">tambah</button>
              </td>
              </form>
            </tr>
          </table>

          <div class="form-style-2-heading">Data Distribusi Sales</div>
        <div height= 500 scrolling="true">
          <form action="" name="penjualan" method="post"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
          <input type="hidden" name="nofakjual_h" value="<?php echo $nofakjual;?>" />
          <input type="hidden" name="sales_h" value="<?php echo $sales;?>" />
          <table id="tabel" style="margin-bottom: 50px;">
           <tr>
             <th>Nama Sales</th>
             <th>Barang</th>
             <th>Jumlah</th>
             <th>Tanggal Distribusi</th>
             <th>Harga Jual</th>
             <th>Sub Total</th>
           </tr>
           <?php
 
           $query = "SELECT transaksi_distribusi.tanggal, transaksi_distribusi.nama_barang, transaksi_distribusi.kode_barang, transaksi_distribusi.nama_sales, transaksi_distribusi.qty, transaksi_distribusi.keterangan, stok_distribusi.harga_jual FROM stok_distribusi INNER JOIN transaksi_distribusi ON transaksi_distribusi.kode_barang = stok_distribusi.produk_id ORDER by transaksi_distribusi.nama_sales desc";
           $rs = mysql_query($query);
           $k=1;
           while ($r = mysql_fetch_object($rs)) { 
             $subtotal=$r->harga_jual*$r->qty;
             
         
           echo "<tr valign='top'> 
             <td>$r->nama_sales</td>
             <td style='font-size:10px;'>$r->nama_barang</td>  
             <td>$r->qty</td>  
             <td>$r->tanggal</td> 
             <td>$r->harga_jual</td>
             <td>$subtotal</td>
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
           </tr>
          </table>
         </form>
        </div>
      </td>

        <td style="padding-left:20px;" valign="top">
         <form action="" name="penjualan" method="get"> 
          <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
        <div class="form-style-2-heading">Informasi Stok Distribusi Barang</div>
       
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mb-2">
          <tr>
            <td width="100%" valign="middle" >
              <input style="width:100%" type="text" class="input-fieldB" name="keyword_cari" id="keyword_cari" placeholder="inputkan kode/nama produk" value="<?php echo $_GET[nama_cari];?>" />
            </td>
            <td width="100%" valign="middle" >
              <button type="submit"  id="Cari" value="Cari" name="Cari" class='button cariB'>Cari</button>
            </td>
          </tr>
        </table>
        <table id="tabel" style="margin-top:3px;">
          <tr>
            <th>Kode</th>
            <th>Nama</th>  
            <th>Stok</th>
          </tr>
          <?php   
          $keyword_cari=$_GET[keyword_cari];
          
          $where="";
          if ($keyword_cari!=""){ $where.="AND nama LIKE '%$keyword_cari%' || produk_id LIKE '%$keyword_cari%'"; }
          
          $queryisd = "SELECT * FROM   stok_distribusi  where id>0 $where order by tgl_update desc "; 
          
          $rsisd = mysql_query($queryisd);
          $i=1;
          while ($risd = mysql_fetch_object($rsisd)) { 
          $pidisd=$risd->produk_id;
        
            echo "<tr valign='top'> 
            <td>$pidisd</td>
            <td style='font-size:12px;'>$risd->nama</td>  
            <td align='right'>$risd->jml_stok</td> 
            </tr>  ";
            $i++;
        }

    
    ?>
     
    </table></form> </td>
      </tr>
       
    </table> 
    </div> 