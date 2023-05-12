<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 10; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;

?>

<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div>
<?php } ?>

<!-- <?php 
	$keyword = $_GET[keyword];

	$where="";
	if ($keyword!=""){ $where.=" and nofaktur like '%$keyword%' or jual_rinci.produk_id like '%$keyword%'"; }

	$q = "select count(*) as jml from jual_rinci where 1  $where";  
	$rsjml = mysql_query($q);
	$rjml = mysql_fetch_object($rsjml);
	$rCount = $rjml->jml;

	$query = "SELECT jual_rinci.nofaktur, jual_rinci.sales, jual_rinci.produk_id, jual_rinci.harga_beli, jual_rinci.harga_jual, jual_rinci.qty, jual_rinci.sisa_stok, jual_rinci.tgl_add, produk.nama, input_jual.admin, input_jual.waktu, input_jual.keterangan FROM jual_rinci INNER JOIN produk ON jual_rinci.produk_id = produk.produk_id  WHERE jual_rinci.id >0 $where desc limit $from, $jml"; 
?> -->

<div class="form-style-2">
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	<tr>
    	<td  style="padding-left:20px;" valign="top">
     	<form action="" name="pemjualan" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    	<div class="form-style-2-heading">Laporan Penjualan</div>

		<!-- grid untuk info jumlah -->

	<div class="row pb-2">
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( qty ) as jml FROM jual_rinci");
						$jumlah = mysql_fetch_object($query_qty);
						echo $jumlah->jml;
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total penjualan
				</div>
			</div>
		</div>
		
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( total ) as uang FROM jual");
						$jumlah = mysql_fetch_object($query_qty);
						echo "Rp. ".number_format($jumlah->uang,2,",",".");
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total uang penjualan
				</div>
			</div>
		</div>
	</div>

   
    <div class="row mb-3">
		<div class="col-sm-12">
			<div class="d-flex flex-row bg-info">
				<input type="text" name="keyword" placeholder="masukan kode / faktur produk" class="border border-warning py-1 px-2 flex-fill" value="<?php echo $_GET[keyword]; ?>" id="keyword_cari">

				<button type="submit"  id="Cari" value="Cari" name="Cari" class="bg-warning border-0 py-1 px-5"><strong>Cari</strong></button>
			</div>
		</div>
	</div>

<table id="tabel" style="margin-top:3px;">
	<tr>
    	<th class="text-center">Kode Produk</th>
   		<th class="text-center">No. Faktur</th> 
    	<th class="text-center">Jumlah</th>
    	<th class="text-center" width="12%">Harga jual</th> 
    	<th class="text-center" width="8%">Total</th> 
		<th class="text-center" width="8%">Admin</th> 
    	<th class="text-center" width="20%">Keterangan</th>
  	</tr>
	<?php

		$keyword = $_GET[keyword];

		$where="";
		if ($keyword!=""){ $where.=" and nofaktur like '%$keyword%' or produk_id like '%$keyword%'"; }

		$q = "select count(*) as jml from jual_rinci where 1  $where";  
		$rsjml = mysql_query($q);
		$rjml = mysql_fetch_object($rsjml);
		$rCount = $rjml->jml;

		$query = "SELECT * FROM jual_rinci $where ORDER BY tgl_add desc limit $from, $jml";

		$rs = mysql_query($query); 
		$i=1;
		while ($r = mysql_fetch_object($rs)) {  
		$pid=$r->id;
        $ttl = $r->qty*$r->harga_jual;
        $ttl = number_format($ttl,2,",",".");
        $hju = number_format($r->harga_jual,2,",",".");
		echo 
		"<tr valign='top'> 
			<td>$r->produk_id</td>
			<td>$r->nofaktur</td>
			<td class='text-center'>$r->qty</td> 
			<td>$hju</td>
			<td>
                $ttl
            </td>
			<td>
                $r->admin
            </td>
			<td>
                $r->keterangan
            </td>
		</tr>  ";
		$i++;
		}
	

	?>
 
</table>
</form> 
</td>
</tr>
   
</table> 
<br>
<?php
	TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?>
</div> 
<script>
document.getElementById("totaljual").innerText="<?php echo number_format($total_beli, 0, ",", ".");?>";
</script>
