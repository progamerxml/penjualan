<?php

$jml = 9;
$pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
$from = $pg * $jml - $jml; 
$from = $pg * $jml - $jml;

$where ="";
if(isset($_GET[keyword])){
    $keyword = $_GET[keyword];
    $where = " and nama like '%$keyword%' or produk_id like '%$keyword%'";
}

$q = "select count(*) as jml from produk where 1  $where";  
$rsjml = mysql_query($q);
$rjml = mysql_fetch_object($rsjml);
$rCount = $rjml->jml;

$sqltp ="SELECT * FROM produk WHERE id >0 $where ORDER BY tgl_update DESC LIMIT $from , $jml";
$qtp = mysql_query("$sqltp");
$admin = $_SESSION['admin'];


// update stok
if (isset($_POST[submit])){
    $ntp = mysql_fetch_object($qtp);


    $prod_id = $_POST["produk_id"];
    $nama_produk = $_POST["nama"]; 
    $sql_data = mysql_query("select jml_stok from produk where produk_id = '$prod_id'");
    $hsl_data = mysql_fetch_object($sql_data);


    $Prod_id=str_replace(" ","",$prod_id);
    $us= $_POST['u_stok'.$Prod_id];
    $t_us = date("Y-m-d H:i:s");
    $ket_us = $_POST['w_update'.$Prod_id];
    $tambah = $us-$hsl_data->jml_stok;

    if(mysql_query("INSERT INTO penyesuaian_stok values (NULL, '$prod_id', '$ntp->nama','$hsl_data->jml_stok', '$us', '$tambah', '$admin', '$t_us', '$ket_us')")){
        $sql_us = "update produk set jml_stok=$us, tgl_update=NULL,keterangan = '$ket_us' where produk_id = '$prod_id'";
        if(mysql_query($sql_us)){
            echo "<script>
                alert('stok berhasil dirubah');
                window.location='?h=update_stok';
            </script>";
        }else{
            echo "<script>
                alert('stok gagal dirubah');
            </script>";
        }
    }

    $sql_count = mysql_query(" SELECT count( * ) AS jml FROM penyesuaian_stok WHERE produk_id = '$prod_id' ");
    $h_sc = mysql_fetch_object($sql_count);
    $cek_data = mysql_query("SELECT * FROM jumlah_riwayatps where produk_id = '$prod_id' ");
    if (mysql_num_rows($cek_data) > 0) {
        mysql_query("update jumlah_riwayatps set jumlah = '$h_sc->jml' where produk_id = '$prod_id' ");
    }else{
        mysql_query("insert into jumlah_riwayatps values (NULL, '$prod_id','$nama_produk','$h_sc->jml','$ket_jumlah')");
    }
}

?>



<div class="row border rounded shadow mx-3 my-2 p-2 bg-light">
    <div class="col-md-6 p-1 mb-2">
        <h4 class="mx-3 mb-4 mt-2 fw-bold text-warning">
            Input Penyesuaian Stok
        </h4>
    </div>
    <div class="col-md-6 p-3 mb-2">
        <form action="" method="get">
        <div class="d-flex flex-row bg-info">
            <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
            <input type="text" name="keyword" placeholder="masukan kode / nama produk" class="border border-warning py-1 px-2 flex-fill" value="<?php echo $_POST[keyword]; ?>" id="keyword_cari">

            <button type="submit"  id="Cari" value="<?php echo $_POST[keyword]; ?>" class="bg-warning border-0 py-1 px-5"><strong>Cari</strong></button>
        </div>
        </form>
    </div>
    <div class="col-12">
        <div class="row">
            <div class="col-12 mb-2">
                <div class="">
                    <table class="table table-borderless table-md-responsive table-light">
                        <thead class="table-warning border-bottom">
                            <tr>
                                <th width="5%" class="text-center">No</th>
                                <th width="10%" class="text-center">ID Produk</th>
                                <th width="25%" class="text-center">Nama Produk</th>
                                <th width="15%" class="text-center">Stok Terkini</th>
                                <th width="15%" class="text-center">Update Stok</th>
                                <th width="5%" class="text-center"></th>
                                <th width="25%" class="text-center">Keterangan</th>
                            </tr>
                        </thead>
                        <tbody class="bg-warning">
                            <?php
                            $n=1;
                            $ket = "terakhir diubah pada : ".date("d-m-Y H:i:s").", oleh : ".$_SESSION["admin"].".";
                            while ($htp = mysql_fetch_object($qtp)){ ?>
                            <?php $prod_id = str_replace(" ","",$htp->produk_id); ?>
                            <form action="" method="post">
                                <input type="hidden" name="h" value="<?php echo $_POST[h]; ?>" />
                                <input type="hidden" name="produk_id" value="<?php echo $htp->produk_id; ?>" />
                                <input type="hidden" name="nama" value="<?php echo $htp->nama; ?>" />
                            <tr>
                                <td class="py-2 text-center fs-6"><?php echo $n; ?></td>
                                <td class="py-2 text-center fs-6" ><?php echo $htp->produk_id; ?></td>
                                <td class="py-2 text-center fs-6" ><?php echo $htp->nama; ?></td>
                                <td class="py-2 text-center fw-bold" ><?php echo $htp->jml_stok; ?></td>
                                <td class="py-2 text-center" >
                                    <input type="text" class="text-center fw-bold" size="5" name="<?php echo'u_stok'.$prod_id; ?>" value="0" id="">
                                    <input type="hidden" name="<?php echo'w_update'.$prod_id; ?>" value="<?php echo $ket; ?>">
                                </td>
                                <td class="py-2 text-center mx-auto" >
                                    <button type="submit" name="submit" class="btn btn-sm fw-bolder btn-outline-warning">
                                        update 
                                    </button>
                                </td>
                                <td class="py-2 text-center px-5" ><?php echo $htp->keterangan; ?></td>
                            </tr>
                            </form>
                            <?php $n++;}?>
                        </tbody>
                    </table>
                </div>
                    <?php
                        TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
                    ?>
                <br>
            </div>
        </div>
    </div>
</div>
