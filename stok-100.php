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


<!-- grid untuk info jumlah -->

<div class="row pb-2">
		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-danger px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
          <strong>
              <?php 
                $qkos = "SELECT * FROM produk WHERE jml_stok<=0";
                $rkos = mysql_query($qkos);
                $jmlkos = mysql_num_rows($rkos);
                echo $jmlkos;
              ?> 
              barang
            </strong>
				</div>
				<div style="font-size: 1em;" class="py-1 col-sm fw-bold text-white">
          stok habis
				</div>
				<div class="col-sm p-1 text-sm-end"> 
          <a href="<?php echo'?h=stok0'.'&skos=skos'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
				</div>
			</div>
		</div>

		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
					<strong>
            <?php 
                $qdpul = "SELECT * FROM produk WHERE jml_stok<=10 AND jml_stok>0";
                $rdpul = mysql_query($qdpul);
                $jmldpul = mysql_num_rows($rdpul);
                echo $jmldpul;
              ?>
              barang
          </strong>
			  </div>
				<div class="py-1 col-sm fw-bold text-white">
          stok dibawah 10.
				</div>
				<div class="col-sm p-1 text-sm-end">
          <a href="<?php echo'?h=stok-10'.'&sd_b10=sdb10'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
				</div>
			</div>
		</div>

		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
          <strong>
            <?php 
              $qdtus = "SELECT * FROM produk WHERE jml_stok<=100 AND jml_stok> 10";
              $rdtus = mysql_query($qdtus);
              $jmldtus = mysql_num_rows($rdtus);
              echo $jmldtus;
            ?>
            barang
          </strong>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
          stok dibawah 100 dan lebih dari 10.
				</div>
				<div class="col-sm p-1 text-sm-end">
          <a href="<?php echo'?h=stok-100'.'&sd_tus=sdtus'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
				</div>
			</div>
		</div>

		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
          <strong>
            <?php 
              $qdbu = "SELECT * FROM produk WHERE jml_stok<=1000 AND jml_stok > 100";
              $rdbu = mysql_query($qdbu);
              $jmldbu = mysql_num_rows($rdbu);
              echo $jmldbu;
            ?>
            barang
          </strong>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
          stok dibawah 1000 dan lebih dari 100.
				</div>
				<div class="col-sm p-1 text-sm-end">
          <a href="<?php echo'?h=stok-1000'.'&sd_tus=sdtus'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
				</div>
			</div>
		</div>

		<div class="col-sm pb-3">
			<div class="d-flex flex-column py-2 bg-warning px-3 rounded">
				<div class="col-sm text-white fw-bolder fs-1">
          <strong>
            <?php 
              $qdpbu = "SELECT * FROM produk WHERE jml_stok>1000";
              $rdpbu = mysql_query($qdpbu);
              $jmldpbu = mysql_num_rows($rdpbu);
              echo $jmldpbu;
            ?>
            barang
          </strong>
				</div>
				<div class="py-1 col-sm fw-bold text-white">
          stok diatas 1000
				</div>
				<div class="col-sm p-1 text-sm-end">
          <a href="<?php echo'?h=stoklbh1000'.'&sd_pbu=sdpbu'; ?>" class=" border rounded px-1 text-decoration-none text-white float-end">lihat data</a>
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

<table id="tabel">
  <tr>
    <th>Kode</th>
    <th>Nama</th> 
    <th>Provider</th>  
    <th>Stok</th>
    <th>Harga Jual</th>
    <th>&nbsp;</th>
  </tr>
<?php   
$keyword = $_GET[keyword];

$where="";
if ($keyword!=""){ $where.=" and  nama like '%$keyword%' or produk_id like '%$keyword%'"; }


$q = "select count(*) as jml from produk where jml_stok<=100 AND jml_stok> 10";
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;


$query = "SELECT * FROM produk where jml_stok<=100 AND jml_stok> 10 $where limit  $from, $jml "; 

$rs = mysql_query($query);

while ($r = mysql_fetch_object($rs)) { 
	
		echo "<tr valign='top'> 
		<td>$r->produk_id</td>
		<td>$r->nama</td>  
		<td>$r->provider</td>  
		<td>$r->jml_stok</td> 
		<td>$r->harga_jual</td> 
		<td class='options-width'> <a href='?h=$_GET[h]&id=$r->id&act=happrod'><button class='button hapus'>Hapus</button></a> </td>
		</tr>  "; 
	}

?>
 
</table> 
   <br />
<?php
 TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
?><br />
 </div>
  