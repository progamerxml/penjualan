<?php
    session_start();
    if (!isset($_SESSION['user'])){
        header("location:login.php");
    }


?>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <title>Dashboard Admin</title>
    <link rel="stylesheet" href="css.css">
    <link rel="stylesheet" href="menu.css">
    <link rel="stylesheet" href="tabel.css">
    <link rel="stylesheet" href="form.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 

    <style>
        input:focus {
            border: none;
        }
    </style>
</head>
<body> 
<?php 
	include  "func/conn.inc.php";
	include  "func/function.php";
	global $res;
?>

<div class="navbar">
    <h2 class="admin">Management Stok Fisik XML</h2>
    <button type="submit" style="float: right;" class="me-3 bg-danger border-0 p-2 rounded">
        <a href="logout.php" class="text-light fw-bold text-decoration-none">Logout</a>
    </button>
</div>
<div class="sidebar"> 
	<ul>  
        <li class="dash"><a href="#">DASHBOORD</a></li> 
        <li>Master Data</li> 
        <li><a href="?h=kategori">Kategori</a></li> 
        <li><a href="?h=tipe">Tipe</a></li><!-- Voucher/Perdana/Accesoris-Emoney/ecommerce-->        
        <li><a href="?h=provider">Provider / Merek</a></li> <!-- Tsel/ISAT/XL-Gopay-OVO-->
        <li><a href="?h=suplier">Suplier</a></li>
        <li><a href="?h=produk">Produk</a></li>
        <li><a href="?h=akun_kas">Akun Kas</a></li>
        <li>Transaksi</li>
        <li><a href="?h=beli">Pembelian</a></li> 
        <li><a href="?h=jual">Penjualan</a></li> 
        <li><a href="?h=retur_beli">Retur Pembelian</a></li>
        <li><a href="?h=retur_jual">Retur Penjualan</a></li>  
        <li><a href="?h=distribusi">Distribusi</a></li>  
        <li>Laporan</li>
        <li><a href="?h=data_stok">Data Stok</a></li>
        <li><a href="?h=pembelian_lap">Pembelian</a></li>
        <li><a href="?h=penjualan_lap">Penjualan</a></li>
        <li><a href="?h=laporan_returbeli">Retur Beli</a></li>
        <li><a href="?h=laporan_returjual">Retur Jual</a></li>
        <li><a href="?h=mutasi_kas">Mutasi Kas</a></li>
        <li><a href="#">Mutasi Suplier</a></li>
        <!-- <li>Master Data</li>
        <li><a href="#">Tipe</a></li>
        <li><a href="#">Kategori</a></li>
        <li><a href="#">Produk</a></li>
        <li><a href="#">Travelling</a></li>
        <li>Master Data</li>
        <li><a href="#">Tipe</a></li>
        <li><a href="#">Kategori</a></li>
        <li><a href="#">Produk</a></li>
        <li><a href="#">Travelling</a></li> -->
	</ul> 
</div>  
<div class="wrapper"  >  
    <table width="90%" border="0">
        <tr>
            <td>  
				<?php  
              	if ($_GET[h]==""){ 
					include "dash.php"; 
				}else{	 
					include "".$_GET[h].".php"; 
				}
                ?>
            </td>
        </tr>
  </table>    
</div>
  
<div class="footer"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="vertical-align:bottom">
        <tr>
            <td height="40">FOOTER</td>
        </tr>
    </table>
</div>
 

</body>
</html>