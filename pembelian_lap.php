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

<?php 
	$keyword = $_GET[keyword];

	$where="";
	if ($keyword!=""){ $where.=" and nofaktur like '%$keyword%' or beli_rinci.produk_id like '%$keyword%'"; }

	$q = "select count(*) as jml from beli_rinci where 1  $where";  
	$rsjml = mysql_query($q);
	$rjml = mysql_fetch_object($rsjml);
	$rCount = $rjml->jml;

	$query = "SELECT beli_rinci.nofaktur, beli_rinci.suplier, beli_rinci.produk_id, beli_rinci.harga_jual, beli_rinci.harga_beli, beli_rinci.qty, beli_rinci.sisa_stok, beli_rinci.tgl_add, produk.nama, input_beli.admin, input_beli.waktu, input_beli.keterangan FROM ((beli_rinci INNER JOIN produk ON beli_rinci.produk_id = produk.produk_id) INNER JOIN input_beli on beli_rinci.produk_id = input_beli.produk_id) WHERE beli_rinci.id >0 $where order by beli_rinci.tgl_add desc limit $from, $jml"; 
?>

<div class="form-style-2">

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	<tr>
    	<td  style="padding-left:20px;" valign="top">
     	<form action="" name="pemjualan" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    	<div class="form-style-2-heading">Laporan Pembelian</div>

		<!-- grid untuk info jumlah -->

	<div class="row pb-2">
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( qty ) as jml FROM beli_rinci");
						$jumlah = mysql_fetch_object($query_qty);
						echo $jumlah->jml;
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total pembelian
				</div>
			</div>
		</div>
		
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM(total) as uang FROM beli");
						$jumlah = mysql_fetch_object($query_qty);
						echo "Rp. ".number_format($jumlah->uang,2,",",".");
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total uang Pembelian
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
    	<th class="text-center">Nama Produk</th>
    	<th class="text-center">Kode Produk</th>
   		<th class="text-center">No. Faktur</th> 
    	<th class="text-center">Jumlah</th>
    	<th class="text-center" width="8%">Harga beli</th> 
    	<th class="text-center" width="8%">Total</th> 
    	<th class="text-center" width="8%">Admin</th> 
    	<th class="text-center" width="20%">Keterangan</th> 
  	</tr>
	<?php
		$rs = mysql_query($query); 
		$i=1;
		while ($r = mysql_fetch_object($rs)) {
		$pid=$r->id;
        $hju = number_format($r->harga_beli,2,",",".");
        $ttl = $r->qty*$r->harga_beli;
        $ttl = number_format($ttl,2,",",".");
		$admin = str_replace("Pembelian, admin = ","",$r->admin);?>
		
		<tr valign='top'> 
			<td><?php echo $r->nama; ?></td>
			<td><?php echo $r->produk_id; ?></td>
			<td><?php echo $r->nofaktur; ?></td>
			<td class='text-end'><?php echo $r->qty; ?></td> 
			<td class='text-end'><?php echo $hju; ?></td>
			<td class='text-end'>
                <?php echo $ttl; ?>
            </td>
			<td class='text-center'>
                <?php echo str_replace("Pembelian, admin = ","",$r->admin); ?>
            </td>
			<td class='text-start'>
                <?php echo $r->keterangan; ?>
            </td>
		</tr>  
		<?php $i++; }?>
	

 
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
