<?php 
$sql="";
$btn="Simpan";

$jml = ($_GET['jml']) ? $_GET['jml'] : 15; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;

?>

<?php  if ($res=="") { $res=$_GET[res];}  if ($res!=""){ ?> <div class="alert"><span class="closebtn" onclick='this.parentElement.style.display="none";'>&times;</span><?php echo $res; ?> &nbsp;   </div>
<?php } ?>

<?php 
	$keyword = $_GET[keyword];

	$where="";
	if ($keyword!=""){ $where.=" and  retur_jual_rinci.noretur like '%$keyword%' or retur_jual_rinci.produk_id like '%$keyword%'"; }

	$q = "select count(*) as jml from retur_jual_rinci where 1  $where";  
	$rsjml = mysql_query($q);
	$rjml = mysql_fetch_object($rsjml);
	$rCount = $rjml->jml;

	$query = "SELECT retur_jual_rinci.produk_id, retur_jual_rinci.noretur, retur_jual_rinci.nofaktur, retur_jual_rinci.sales, retur_jual_rinci.qty, retur_jual_rinci.total_jual, retur_jual_rinci.tgl_add, input_rjual.admin, input_rjual.waktu, input_rjual.keterangan
	FROM retur_jual_rinci INNER JOIN input_rjual ON retur_jual_rinci.produk_id = input_rjual.produk_id
	WHERE retur_jual_rinci.id>0 $where order by retur_jual_rinci.tgl_add desc limit $from, $jml"; 
?>

<div class="form-style-2">

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	<tr>
    	<td  style="padding-left:20px;" valign="top">
     	<form action="" name="pemjualan" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    	<div class="form-style-2-heading">Laporan Retur Penjualan</div>

		<!-- grid untuk info jumlah -->

	<div class="row pb-2">
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( qty ) as jml FROM retur_jual_rinci");
						$jumlah = mysql_fetch_object($query_qty);
						echo $jumlah->jml;
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total retur penjualan
				</div>
			</div>
		</div>
		
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( total_jual ) as uang FROM retur_jual_rinci");
						$jumlah = mysql_fetch_object($query_qty);
						echo "Rp. ".number_format($jumlah->uang,2,",",".");
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total uang retur penjualan
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
    	<th>Kode Produk</th>
  		<th>No. Retur </th>
   		<th>No. Faktur</th> 
   		<th>Sales</th> 
    	<th>Qty</th>
    	<th width="10%">Harga jual</th> 
    	<th width="10%">Jumlah Total</th>
		<th width="10%">Admin</th> 
		<th width="20%">Keterangan</th> 
  	</tr>
	<?php
		$rs = mysql_query($query); 
		$i=1;
		while ($r = mysql_fetch_object($rs)) {  
		$pid=$r->id;
		echo 
		"<tr valign='top'> 
			<td>$r->produk_id</td>
			<td>$r->noretur</td>
			<td>$r->nofaktur</td>
			<td>$r->sales</td> 
			<td>$r->qty</td> 
			<td>$r->harga_jual</td>
			<td>$r->total_jual</td>
			<td>$r->admin</td> 
			<td>$r->keterangan</td>
		</tr>  ";
		$i++;
		}
	

	?>
 
</table>
</form> 
</td>
</tr>
   
</table> 
<?php
	TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?>
</div> 
<script>
document.getElementById("totaljual").innerText="<?php echo number_format($total_beli, 0, ",", ".");?>";
</script>
