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
if ($keyword!=""){ $where.=" and  retur_beli_rinci.nofaktur like '%$keyword%' or retur_beli_rinci.produk_id like '%$keyword%'"; }

$q = "select count(*) as jml from retur_beli_rinci where 1  $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;

$query = "SELECT retur_beli_rinci.produk_id, retur_beli_rinci.noretur, retur_beli_rinci.harga_beli, retur_beli_rinci.nofaktur, retur_beli_rinci.suplier, retur_beli_rinci.qty, retur_beli_rinci.total_beli, retur_beli_rinci.tgl_add, input_rbeli.admin, input_rbeli.waktu, input_rbeli.keterangan FROM retur_beli_rinci INNER JOIN input_rbeli on retur_beli_rinci.produk_id = input_rbeli.produk_id where retur_beli_rinci.id>0 $where order by retur_beli_rinci.tgl_add asc limit $from,$jml";

?>

 
<div class="form-style-2">

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
  <tr>

    <td  style="padding-left:20px;" valign="top">
     <form action="" name="pembelian" method="get"> <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
    <div class="form-style-2-heading">Laporan Retur Pembelian</div>

	<!-- grid untuk info jumlah -->

	<div class="row pb-2">
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_qty = mysql_query("SELECT SUM( qty ) as qty FROM retur_beli_rinci");
						$jml_qty = mysql_fetch_object($query_qty);
						echo $jml_qty->qty;
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total retur pembelian
				</div>
				<div class="col-sm p-1 text-sm-end"> 
				</div>
			</div>
		</div>
	
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<?php
						$query_uang = mysql_query("SELECT SUM( total_beli ) as uang FROM retur_beli_rinci");
						$jml_uang = mysql_fetch_object($query_uang);
						echo "Rp. ".number_format($jml_uang->uang,2,",",".");
					?>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
					total uang retur pembelian
				</div>
				<div class="col-sm p-1 text-sm-end"> 
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
		<th>Suplier</th> 
		<th>Qty</th>
		<th width="10%">Harga Beli</th> 
		<th width="10%">Jumlah Total</th> 
		<th width="10%">Admin</th> 
		<th width="20%">Keterangan</th> 
  	</tr>
<?php   
 
$rs = mysql_query($query); 
	$i=1;
	while ($r = mysql_fetch_object($rs)) {  
	$pid=$r->id;
	$harga = $r->harga; $qty = $r->qty; $total = $harga*$qty;
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td>$r->noretur</td>
		<td>$r->nofaktur</td>
		<td>$r->suplier</td> 
		<td>$r->qty</td> 
		<td>$r->harga_beli</td> 
		<td>$r->total_beli</td> 
		<td>$r->admin</td> 
		<td>$r->keterangan</td> 
		</tr>  ";
		$i++;
	}
	

?>
 
</table></form> </td>
  </tr>
   
</table> 
<?php
	TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?>
</div> 
<script>
document.getElementById("totalbeli").innerText="<?php echo number_format($total_beli, 0, ",", ".");?>";
</script>
