<?php
$jml = 9;
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;


$where ="";
if(isset($_GET[keyword])){
    $keyword = $_GET[keyword];
    $where = " and  nama like '%$keyword%' or produk_id like '%$keyword%'";
}

$q = "select count(*) as jml from jumlah_riwayatps where 1  $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;


$sql_td = "select * from jumlah_riwayatps where id>0 $where order by jumlah desc limit $from, $jml";


?>

<div class="row bg-light mx-3 my-3 border-2 shadow rounded">
    <div class="col-md-6 row p-3">
        <h3 class="text-warning fw-bold">
            Laporan Riwayat Penyesuaian Stok
        </h3>
    </div>
    <div class="col-md-6 py-3 mb-2">
        <form action="" method="get">
        <div class="d-flex flex-row bg-info">
            <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
            <input type="text" name="keyword" placeholder="masukan kode / nama produk" class="border border-warning py-1 px-2 flex-fill" value="<?php echo $_POST[keyword]; ?>" id="keyword_cari">

            <button type="submit"  id="Cari" value="<?php echo $_POST[keyword]; ?>" class="bg-warning border-0 py-1 px-5"><strong>Cari</strong></button>
        </div>
        </form>
    </div>
    <div class="col-md-12">
    <div class="">
            <table class="table table-borderless table-hover table-light table-md-responsive">
                <thead class="table-warning border-bottom">
                    <tr>
                        <th width="5%" class="text-center py-2">No</th>
                        <th width="10%" class="text-center py-2">ID Produk</th>
                        <th width="25%" class="text-center py-2">Nama Produk</th>
                        <th width="15%" class="text-center py-2">Riwayat Perubahan Stok</th>
                        <th width="15%" class="text-center py-2">Detail</th>
                    </tr>
                </thead>
                <tbody class="">
                    <?php 
                    $n = 1; $hq_td = mysql_query($sql_td);
                    while ($nq_td = mysql_fetch_object($hq_td)) { ?>
                    <tr>
                        <td class="py-3 text-center fs-6"><?php echo $n; ?></td>
                        <td class="py-3 text-center fs-6" ><?php echo $nq_td->produk_id; ?></td>    
                        <td class="py-3 text-center fs-6" ><?php echo $nq_td->nama; ?></td>
                        <td class="py-3 text-center fw-bold" ><?php echo $nq_td->jumlah." kali"; ?></td>
                        <td class="py-3 text-center text-decoration-none"><a href="<?php echo '?h=detail_us'.'&produk_id='.$nq_td->produk_id; ?>" class="text-decoration-none fw-bold text-primary">detail</a></td>
                    </tr>
                    <?php $n++; }?>
                </tbody>
            </table>
        </div>
            <?php
                TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
            ?>
        <br>
    </div>
</div>