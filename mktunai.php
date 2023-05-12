<script> 
function CEKINPUTRETUR(i,j){ 

	sisa_stok_retur=document.getElementById("sisa_stok_retur_"+i).value;
	qty_tmp_retur=document.getElementById("qty_tmp_retur_"+i).value;
	hbeli_tmp_retur=document.getElementById("hbeli_tmp_retur_"+i).value;
 
	noretur=document.getElementById("noretur").value;
  
	nama_cari=document.getElementById("nama_cari").value;  
	kode_cari=document.getElementById("kode_cari").value;
	Cari=document.getElementById("Cari").value; 
	id_beli=j;

	if (sisa_stok_retur-qty_tmp_retur<0) {
		alert ("Sisa Stok Tidak Mencukupi untuk retur"); 	
		return false;
	}else{ 
		 window.location="?h=retur_beli&noretur="+noretur+"&sisa_stok_retur="+sisa_stok_retur+"&kode_cari="+kode_cari+"&nama_cari="+nama_cari+"&Cari="+Cari+"&qty_tmp_retur="+qty_tmp_retur+"&hjual_tmp_retur="+hjual_tmp_retur+"&id_jual="+id_jual+"&addtmpretur=OK"; 
		return false;	
	} 
	 
}
</script>

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

	<div class="form-style-2-heading">Laporan Mutasi Kas</div>

		<!-- grid untuk info jumlah -->

		<div class="row pb-2">
			<div class="col-sm pb-3">
				<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
					<div class="col-sm text-white fw-bolder fs-1">
	        			<strong>
							<?php 
								$qkos = "SELECT * FROM mutasi_kas WHERE kas_id='BCA'";
								$rkos = mysql_query($qkos);
								$jmlkos = mysql_num_rows($rkos);
								echo $jmlkos;
							?> 
            			</strong>
					</div>
					<div style="font-size: 1em;" class="py-1 col-sm text-white">
						mutasi kas ID BCA
					</div>
					<div class="col-sm p-1 text-sm-end"> 
						<a href="<?php echo'?h=mkbca'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">
							lihat data
						</a>
					</div>
				</div>
			</div>

	<div class="col-sm pb-3">
		<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
			<div class="col-sm text-white fw-bolder fs-1">
				<strong>
					<?php 
						$qdpul = "SELECT * FROM mutasi_kas WHERE kas_id='TUNAI'";
						$rdpul = mysql_query($qdpul);
						$jmldpul = mysql_num_rows($rdpul);
						echo $jmldpul;
					?>
          		</strong>
			</div>
			<div class="py-1 col-sm text-white">
				mutasi kas ID TUNAI
			</div>
			<div class="col-sm p-1 text-sm-end">
          		<a href="<?php echo'?h=mktunai'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
			</div>
		</div>
	</div>

	
</div>

<div class="form-style-2-heading">Pencarian</div>
<table>
  <tr>
      <form action="" method="get">
      <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
      <input type="hidden" name="id" value="<?php echo $_GET[id];?>" />
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
</div> 
<table id="tabel">
  <tr>
    <th>ID</th>
    <th>Kas ID</th> 
    <th>Debet</th>  
    <th>Kredit</th>
    <th>Lastbalance</th>
    <th>Currbalance</th>
    <th>Tanggal</th>
    <th>Keterangan</th>
  </tr>
<?php   
$keyword = $_GET[keyword];

$where="";
if ($keyword!=""){ $where.=" and  kas_id like '%$keyword%' or ket like '%$keyword%' or tanggal like '%$keyword%'"; }


$q = "select count(*) as jml from mutasi_kas where 1  $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;
					
					
$query = "SELECT * FROM   mutasi_kas  where kas_id = 'TUNAI' $where order by id desc limit  $from, $jml "; 
 
$rs = mysql_query($query); 

	while ($r = mysql_fetch_object($rs)) { 
	
		echo "<tr valign='top'> 
		<td>$r->id</td>
		<td>$r->kas_id</td>  
		<td>$r->debet</td>  
		<td>$r->kredit</td> 
		<td>$r->lastbalance</td> 
		<td>$r->currbalance</td> 
		<td>$r->tanggal</td> 
		<td>$r->ket</td> 
		</tr>  "; 
	}

?>
 
</table> 
<br/>
<?php
	TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?>
<br/>
</div>
  