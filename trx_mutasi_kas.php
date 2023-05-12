<!-- <script>
    function cek_input(a){
        n_pil = document.getElementById("value_ka"+a).value;


        window.location="?h=trx_mutasi_kas&value_ka"+a+"="+n_pil+"&n="+a;

    }
</script> -->
<?php

    $n = $_GET['n'];
    $h= $_GET['h']; 
    $keyword = $_GET['keyword']; 


    $jml = ($_GET['jml']) ? $_GET['jml'] : 5; 
    $pg = ($_GET['pg']) ? $_GET['pg'] : 1; 
    $from = $pg * $jml - $jml; 
    $from = $pg * $jml - $jml;


    $nilai_ka = $_GET["value_ka$n"];
    $where = "";
    if ($keyword!=""){$where = "WHERE akun_asal like '%$keyword%' or akun_tujuan like '%$keyword%' or waktu like '%$keyword%'";}
    $query_tampil = "SELECT * FROM transaksi_mukas $where ORDER BY waktu DESC LIMIT $from, $jml";
    $tanggal_kini = date("Y-m-d H");

   
    $kas_asal = $_POST['akun_asal'];
    $kas_tujuan = $_POST['akun_tujuan'];
    $nominal = $_POST['nominal'];
    $admin = $_SESSION['admin'];
    $ket = date("l").", Tanggal ".date("d-F-Y").", Jam ".date("G:i:s");

    $tbl = "simpan";

    $query_akunkas = "select nama,id,saldo from akun_kas where nama = '$kas_asal'";
    $d_akunkas = mysql_query($query_akunkas);
    $n_akunkas=mysql_fetch_object($d_akunkas);


   

    if (isset($_POST[tombol])){
        $tombol = $_POST[tombol];
        if($tombol=="simpan"){
            
            if ($kas_asal or $kas_tujuan != NULL){
        
                if($kas_asal == $kas_tujuan ){
                    echo "<script>alert('akun asal dan tujuan sama !')</script>";
                }else{
                    $where = "WHERE akun_asal = '$kas_asal' AND akun_tujuan = '$kas_tujuan' AND waktu LIKE '%$tanggal_kini%' AND admin = '$admin'";
                    $currbalance = $n_akunkas->saldo - $nominal;
                    $h_asilQ = mysql_query($query_tampil);
                    $n_ilaiQ = mysql_fetch_object($h_asilQ);
                    if ($kas_asal == $n_ilaiQ->akun_asal and $kas_tujuan == $n_ilaiQ->akun_tujuan and $nominal == $n_ilaiQ->nominal and $admin == $n_ilaiQ->admin){
                        echo "<script>alert('anda memasukan nilai duplikat.')</script>";
                    }else{
                        $insert_nominal = mysql_query("INSERT INTO transaksi_mukas value (NULL,'$kas_asal','$kas_tujuan','$nominal',CURRENT_TIMESTAMP,'$admin','$ket')");
                        $berhasil_input = 'ok';

                        mysql_query ("update akun_kas set saldo=saldo-$nominal where nama='$kas_asal'");

                        mysql_query ("update akun_kas set saldo=saldo+$nominal where nama='$kas_tujuan'");

                        mysql_query ("insert into mutasi_kas (kas_id, opr, ket, kredit, lastbalance, currbalance, admin)  values ('$kas_asal','User','$ket','$nominal','$n_akunkas->saldo','$currbalance', '$admin')");
                    }
                }
            }else{
                $kosong = 1;
            }
        }
    }
    


    if(isset($_GET[akt])){
        $aksi = $_GET[akt];
        if ($aksi=='edit'){ 
            $edit = mysql_query("Select * from transaksi_mukas where id = '$_GET[id]'"); 
            $n_edit = mysql_fetch_object($edit); 
            $tbl= "ubah";
        }else{
            if ($aksi=='hapus'){ 
                mysql_query("DELETE FROM transaksi_mukas WHERE id = '$_GET[id]'"); 
            }
        }
    }
    
    if (isset($_POST[tombol])){
        $tombol = $_POST[tombol];
        if($tombol=="ubah"){
        
            $querytm= mysql_query("SELECT * FROM transaksi_mukas WHERE id = '$_GET[id]'");
            $n_qtm = mysql_fetch_object($querytm);
            
            $query = mysql_query("select * from `msfx`.`mutasi_kas` where kas_id = '$kas_asal' and tanggal = ''");
            $nq= mysql_fetch_object( $query );
            if ($nominal > $n_qtm->nominal){
                $selisih = $nominal - $n_qtm->nominal   ;
                mysql_query ("update akun_kas set saldo=saldo-$selisih where nama='$kas_asal'");
    
                mysql_query ("update akun_kas set saldo=saldo+$selisih where nama='$kas_tujuan'");
            }else{
                $selisih = $n_qtm->nominal - $nominal;

                mysql_query ("update akun_kas set saldo=saldo+$selisih where nama='$kas_asal'");
    
                mysql_query ("update akun_kas set saldo=saldo-$selisih where nama='$kas_tujuan'");
            }

            $currbalance = $n_akunkas->saldo - $nominal;
            mysql_query("UPDATE `msfx`.`transaksi_mukas` SET `akun_asal` = '$kas_asal', `akun_tujuan` = '$kas_tujuan', `nominal` = '$nominal', `waktu` = NULL WHERE id = '$_GET[id]'");

            mysql_query("update mutasi_kas set kredit = '$nominal', lastbalance = '$n_akunkas->saldo', currbalance = '$currbalance' WHERE kas_id = '$kas_asal'");


        }
    }
?>

<div class="row mx-auto">
    <div class="col-12 p-3 mb-2 mx-auto">
        <form action="" method="post">
        <div class="row shadow bg-warning rounded">
            <h4 class="px-4 mt-3"><strong>Input Mutasi Saldo</strong></h4>
            <div class="col-lg-3 p-3">
                <input type="hidden" name="h" value="trx_mutasi_kas" />
                <div class="p-1">
                    <!-- <div class="p-2">
                        Informasi saldo saat ini: 
                    </div>
                    <div class="p-2">
                        <?php if (isset ($nilai_ka)){$query = mysql_query("SELECT * FROM akun_kas WHERE nama = '$nilai_ka'"); $saldo = mysql_fetch_object($query); $Saldo = $saldo->saldo;}else{$Saldo="0";}?>
                        <h4>Rp. <strong><?php echo number_format("$Saldo",2,",","."); ?></strong></h4>
                    </div> -->
                    <select name="akun_asal" id="akun_asal" class="form-select form-select-sm" required>
                        <option value="">Pilih Akun Asal</option>
                        <?php $sel_2=""; $query = "SELECT  nama  FROM akun_kas order by nama";$rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { if($n_edit->akun_asal==$r->nama){$sel_2="selected";}else{$sel_2="";}  echo "<option value='$r->nama' $sel_2>&nbsp; $r->nama &nbsp;</option>"; } ?>
                    </select>
                        <?php if (isset($kosong)){ echo "<p style = 'font-size:0.7rem' class='text-danger fw-bold'>* wajib diisi !</p>";} ?>
                </div>
            </div>        
            <div class="col-lg-3 p-3">
                <div class="p-2">


                    <!-- <div class="p-2">
                        Informasi saldo saat ini: 
                    </div>
                    <div class="p-2">
                        <?php if (isset ($nilai)){ $query = mysql_query("SELECT * FROM akun_kas WHERE nama = '$nilai'"); $saldo = mysql_fetch_object($query); $Saldo = $saldo->saldo;}else{$Saldo="0";}?>
                        <h4>Rp. <strong><?php echo number_format("$Saldo",2,",","."); ?></strong></h4>
                    </div> -->


                    <select name="akun_tujuan" id="akun_tujuan" class="form-select form-select-sm" required>
                        <option value="">Pilih Akun Asal</option>
                        <?php $sel_2=""; $query = "SELECT  nama  FROM akun_kas order by nama";$rs = mysql_query($query);  while ($r = mysql_fetch_object($rs)) { if($n_edit->akun_tujuan==$r->nama){$sel_2="selected";}else{$sel_2="";}  echo "<option value='$r->nama' $sel_2>&nbsp; $r->nama &nbsp;</option>"; } ?>
                    </select>
                    <?php if (isset($kosong)){ echo "<p style = 'font-size:0.7rem' class='text-danger fw-bold'>* wajib diisi !</p>";} ?>
                </div>
            </div>        
            <div class="col-lg-3 p-3">
                <!-- <div class="px-2 border border-warning">
                    <h4><strong>Nominal :</strong></h4>
                </div> -->
                <div class="d-flex flex-column justify-content-end">
                    <div class="p-2 border border-warning mt-1">
                        <input type="text" class="form-control form-control-sm" placeholder="Masukan nominal mutasi" name="nominal" value="<?php echo $n_edit->nominal; ?>" required>
                        <?php if (isset($kosong)){ echo "<p style = 'font-size:0.7rem' class='text-danger fw-bold'>* wajib diisi !</p>";} ?>
                    </div>
                </div>
            </div>        
            <div class="col-lg-3 p-3">
                <!-- <div class="p-2">
                    Estimasi total :
                </div>
                <div class="p-2">
                    <h3>Rp. <strong>45.000.000,-</strong> </h3>
                </div> -->
                <div class="p-2">
                    <input type="submit" name="tombol" value="<?php echo $tbl; ?>" class="btn btn-outline-dark btn-sm px-2 fw-bolder">
                    <input type="button" value="Batal" class="btn btn-outline-dark btn-sm px-2 fw-bolder" name="Batal" onclick="window.location='?h=<?php echo $_GET[h];?>'" />
            </div>        
        </div>
        </form>
    </div>
    <div class="col-12 p-3">
        <div class="row shadow bg-light rounded p-3">
            <h3 class="mt-2 mb-3 col-lg-6">Transaksi mutasi kas terbaru</h3>
            <div class="col-lg-6 my-auto">
                <form action="" method="get">
                    <div class="d-flex flex-row bg-info">
                        <input type="hidden" name="h" value="<?php echo $_GET[h];?>" />
                        <input type="text" name="keyword" placeholder="masukan kode / nama produk" class="border border-warning py-1 px-2 flex-fill" value="<?php echo $_POST[keyword]; ?>" id="keyword_cari">

                        <button type="submit"  id="Cari" value="<?php echo $_POST[keyword]; ?>" class="bg-warning border-0 py-1 px-5"><strong>Cari</strong></button>
                    </div>
                </form>
            </div>
            <table class="table table-borderless table-hover table-responsive-md">
                <thead class="border border-warning table-warning mb-2">
                    <tr>
                        <th width="5%" class="ps-3 text-center">No</th>
                        <th class="text-center" width="10%">Akun Asal</th>
                        <th class="text-center" width="10%">Akun Tujuan</th>
                        <th class="text-center" width="15%">Nominal</th>
                        <th class="text-center" width="15%">Tanggal</th>
                        <th class="text-center" width="15%">&nbsp;</th>
                        <!-- <th width="10%">Admin</th>
                        <th width="35%">Keterangan</th> -->
                    </tr>
                </thead>
                
                <tbody class="">
                    <?php 

                    $q = "select count(*) as jml from transaksi_mukas $where";  
                    $rsjml = mysql_query($q);
                    $rjml = mysql_fetch_object($rsjml);
                    $rCount = $rjml->jml;


                    $hasil_query_tampil = mysql_query($query_tampil);
                    $i= 1;
                    while ($nilai_qt = mysql_fetch_object($hasil_query_tampil)) { ?>
                    
                        <tr>
                            <td class="text-center ps-3 py-3"><?php echo $i; ?></td>
                            <td class="text-center py-3"><?php echo $nilai_qt->akun_asal; ?></td>
                            <td class="text-center py-3"><?php echo $nilai_qt->akun_tujuan; ?></td>
                            <td class="text-center py-3"><?php echo number_format($nilai_qt->nominal,2,",","."); ?></td>
                            <td class="text-center py-3"><?php echo $nilai_qt->waktu; ?></td>
                            <td class="text-center py-3">
                                <table class="">
                                    <tr>
                                        <td class="py-1 px-3">
                                            <a href="<?php echo '?h='.$_GET[h].'&id='.$nilai_qt->id.'&akt=edit';?>">
                                                <button class="btn btn-sm btn-outline-warning fw-bold">edit</button>
                                            </a>
                                        </td>
                                        <td class="py-1 px-3">
                                            <a href="<?php echo '?h='.$_GET[h].'&id='.$nilai_qt->id.'&akt=hapus';?>">                                        
                                                <button type="submit" class="btn btn-outline-danger fw-bold btn-sm">hapus</button>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <!-- <td class="py-3"><?php echo $nilai_qt->admin; ?></td>
                            <td class="py-3"><?php echo $nilai_qt->keterangan; ?></td> -->
                        </tr>

                    <?php $i++;}?>

                </tbody>
            </table>
            <div class="col-12">
            <br />
                <?php
                TabelFooter($_SERVER['PHP_SELF'], $rCount, $pg, $jml, "h=".$_GET[h]."&field=$field&keyword=$keyword&tglakir=$tglakir&tglawal=$tglawal&jml=$jml");
                ?>
            <br />
            </div>
        </div>
    </div>
</div>