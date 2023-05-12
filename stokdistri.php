
<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 15; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">

<div class="form-style-2-heading">Data Stok Barang <?php echo $_GET[sales]; ?></div>
<table>
  <tr>
      <form action="" method="get">
      <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
      <input type="hidden" name="sales" value="<?php echo $_GET[sales];?>" />
      <div class="row mb-3">
        <div class="col-sm-12 rounded">
          <div class="d-flex flex-row bg-info">
            <input type="text" name="keyword" placeholder="masukan kode / nama produk" class="border border-warning py-1 px-2 flex-fill" value="<?php echo $_GET[keyword]; ?>" id="keyword_cari">

            <button type="submit"  id="Cari" value="Cari" name="Cari" class="bg-warning border-0 py-1 px-5"><strong>Cari</strong></button>
          </div>
        </div>
      </div>
      </form>
  </tr>
</table>

<table id="tabel">
  <tr>
    <th>Kode Distribusi</th>
    <th>Kode Barang</th>
    <th>Nama Barang</th> 
    <th>Stok</th>
    <th>Sales</th>  
    <th>Waktu</th>
    <th>Keterangan</th>
  </tr>
<?php   
$keyword = $_GET[keyword];

$where="";
if ($keyword!=""){ $where.=" and  nama_barang like '%$keyword%' or kode_barang like '%$keyword%'"; }


$q = "select count(*) as jml from transaksi_distribusi where nama_sales = '$_GET[sales]' limit $from, $jml";


$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;

$query = "SELECT * FROM   transaksi_distribusi  where nama_sales ='$_GET[sales]'$where limit $from, $jml";

$rs = mysql_query($query);

while ($r = mysql_fetch_object($rs)) { ?>
	
    <tr valign='top'> 
		<td><?php echo $r->kode_transaksi; ?></td>
		<td><?php echo $r->kode_barang; ?></td>  
		<td><?php echo $r->nama_barang; ?></td>  
		<td><?php echo $r->qty; ?></td> 
		<td><?php echo $r->nama_sales; ?></td> 
		<td><?php echo $r->tanggal; ?></td> 
		<td><?php echo $r->keterangan; ?></td> 
	</tr>   
	<?php } ?>
 
</table> 
   <br />
<?php
 TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?><br />
 </div>
  