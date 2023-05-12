<script type="text/javascript">
  document.getElementById("info_barang").submit();
</script>

<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 15; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;

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


?>


<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div><?php } ?>  
<div class="form-style-2">

<div class="form-style-2-heading">Laporan Data Stok</div>


<!-- grid untuk info jumlah -->
  <div class="row pb-2">
<?php 
$querysales = mysql_query("select * from sales");
$s = 1;
while($nilai_s = mysql_fetch_object($querysales)){ ?>
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
          <strong>
              <?php 
                $qkos = "SELECT SUM(qty) as jml FROM transaksi_distribusi WHERE nama_sales='$nilai_s->nama'";
                $rkos = mysql_query($qkos);
                $jmlkos = mysql_fetch_object($rkos);
                $jmlkos->jml = $jmlkos->jml? $jmlkos->jml : "0";
                echo $jmlkos->jml;
              ?> 
              barang
          </strong>
				</div>
				<div style="font-size: 1em;" class="py-1 col-sm fw-bold text-white">
          <?php echo "total stok ".$nilai_s->nama; ?>
				</div>
				<div class="col-sm p-1 text-sm-end"> 
          <a href="<?php echo'?h=stokdistri&sales='.$nilai_s->nama; ?>" class=" border rounded-pill px-1 text-decoration-none text-warning fw-bolder bg-white float-end">lihat data</a>
				</div>
			</div>
		</div>
<?php $s++;} ?>

	</div>


<div class="form-style-2-heading">Distribusi Barang Terkini</div>
<table>
  <tr>
      <form action="" method="get">
      <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
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
    <th>Sales</th>  
    <th>Stok</th>
    <th>Waktu</th>
    <th>Keterangan</th>
  </tr>
<?php   
$keyword = $_GET[keyword];

$where="";
if ($keyword!=""){ $where.=" and  nama_barang like '%$keyword%' or kode_barang like '%$keyword%'"; }


$q = "select count(*) as jml from transaksi_distribusi where id>0 $where";
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;


$query = "SELECT * FROM   transaksi_distribusi  where id>0 $where order by tanggal desc limit  $from, $jml ";

$rs = mysql_query($query);

while ($r = mysql_fetch_object($rs)) { ?>
	
	<tr valign='top'> 
		<td><?php echo $r->kode_transaksi; ?></td>
		<td><?php echo $r->kode_barang; ?></td>  
		<td><?php echo $r->nama_barang; ?></td>  
		<td><?php echo $r->nama_sales; ?></td> 
		<td><?php echo $r->qty; ?></td> 
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
  