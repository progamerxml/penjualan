<div class="row mx-auto">
    <div class="col-12 p-3">
        <div class="row shadow bg-light rounded p-3">
            <h3 class="mt-2 mb-3 col-6">Transaksi mutasi kas terbaru</h3>
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
                        $keyword=$_GET[keyword];

                        $where="";
                        if ($keyword!=""){ $where.=" and  waktu like '%$keyword%' or kas_asal like '%$keyword%'"; }


                        $q = "select count(*) as jml from transaksi_mukas where 1  $where";  
                        $rsjml = mysql_query($q);
                        $rjml = mysql_fetch_object($rsjml);
                        $rCount = $rjml->jml;
                                            
                                            
                        $query = "SELECT * FROM   transaksi_mukas  where id>0 $where order by id desc limit  $from, $jml ";
                        
                        $rs = mysql_query($query); 

                        while($r=mysql_fetch_object($rs)) {?>
                    
                        <tr>
                            <td class="text-center ps-3 py-3"><?php echo $i; ?></td>
                            <td class="text-center py-3"><?php echo $r->akun_asal; ?></td>
                            <td class="text-center py-3"><?php echo $r->akun_tujuan; ?></td>
                            <td class="text-center py-3"><?php echo number_format($r->nominal,2,",","."); ?></td>
                            <td class="text-center py-3"><?php echo $r->waktu; ?></td>
                            <td class="text-center py-3">
                                <table class="">
                                    <tr>
                                        <td class="py-1 px-3">
                                            <a href="<?php echo '?h='.$_GET[h].'&id='.$r->id.'&akt=edit';?>">
                                                <button class="btn btn-sm btn-outline-warning fw-bold">edit</button>
                                            </a>
                                        </td>
                                        <td class="py-1 px-3">
                                            <a href="<?php echo '?h='.$_GET[h].'&id='.$r->id.'&akt=hapus';?>">                                        
                                                <button type="submit" class="btn btn-outline-danger fw-bold btn-sm">hapus</button>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <!-- <td class="py-3"><?php echo $r->admin; ?></td>
                            <td class="py-3"><?php echo $r->keterangan; ?></td> -->
                        </tr>

                    <?php $i++;}?>

                </tbody>
            </table>
            <div class="col-12">
                <button class="btn btn-sm btn-warning col-sm-1 fw-bolder float-end">
                    <a href="laporan_trxmk.php" class=" text-dark text-decoration-none">
                        lihat detail
                    </a>
                </button>
            </div>
        </div>
    </div>
</div>