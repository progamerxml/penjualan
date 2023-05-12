<?php

$jml = ($_GET['jml']) ? $_GET['jml'] : 8; 
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;

$produk_id = $_GET['produk_id']; 

$where ="";
if(isset($_GET[keyword])){
    $keyword = $_GET[keyword];
    $where = " and  nama like '%$keyword%' or produk_id like '%$keyword%'";
}

$q = "select count(*) as jml from penyesuaian_stok WHERE produk_id = '$_GET[produk_id]' $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;

$sql_td = mysql_query("SELECT * FROM penyesuaian_stok WHERE produk_id = '$produk_id' order by id desc limit  $from, $jml ");


?>

<div class="row bg-light mx-3 mt-3 mb-1 border-2 shadow rounded">
    <div class="col-md-6 row p-3">
        <div class="py-1">
            <h5 class="text-warning fw-bold my-1">
                <?php echo "Riwayat Penyesuaian Stok Produk"; ?>
            </h5>
            <p class= "text-warning fw-bold mt-3">ID Produk : <?php echo $produk_id; ?></p>
        </div>
    </div>

    <div class="col-md-12">
    <div class="">
            <table class="table table-borderless table-light table-md-responsive">
                <thead class="table-warning border-bottom">
                    <tr>
                        <th width="5%" class="text-center py-2">No</th>
                        <th width="10%" class="text-center py-2">ID Produk</th>
                        <th width="25%" class="text-center py-2">Nama Produk</th>
                        <th width="7%" class="text-center py-2">Stok Awal</th>
                        <th width="8%" class="text-center py-2">Stok Akhir</th>
                        <th width="10%" class="text-center py-2">Penambahan</th>
                        <th width="15%" class="text-center py-2">Admin</th>
                        <th width="20%" class="text-center py-2">Waktu</th>
                    </tr>
                </thead>
                <tbody class="">
                    <?php 
                    $n = 1;
                    while ($n_std = mysql_fetch_object($sql_td)) { ?>
                    <tr>
                        <td class="py-4 text-center"><?php echo $n; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->produk_id; ?></td>    
                        <td class="py-4 text-center"><?php echo $n_std->nama; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->stok_awal; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->stok_akhir; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->penambahan; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->admin; ?></td>
                        <td class="py-4 text-center"><?php echo $n_std->waktu; ?></td>
                    </tr>
                    <?php $n++; }?>
                </tbody>
            </table>
            <br />
            <?php
            TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&produk_id=".$_GET['produk_id']."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
            ?>
            <br />
        </div>

    </div>
</div>