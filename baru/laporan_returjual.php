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
	if ($keyword!=""){ $where.=" and  nofaktur like '%$keyword%' or produk_id like '%$keyword%'"; }

	$query = "SELECT * FROM retur_jual_rinci  where id>0 $where order by qty asc limit 14 "; 
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
					total retur pembelian
				</div>
			</div>
		</div>
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					50
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total tipe produk di retur
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
    	<th width="15%">Harga jual</th> 
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
