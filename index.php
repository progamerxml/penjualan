

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <title>Dashboard Admin</title>
    <link rel="stylesheet" href="css.css">
    <link rel="stylesheet" href="menu.css">
    <link rel="stylesheet" href="tabel.css">
    <link rel="stylesheet" href="form.css">
</head>
<body>
<?php 
	include  "func/conn.inc.php";
	include  "func/function.php";
	global $res;
?>
<div class="navbar">
<h3 class="admin">Management Stok Fisik XML</h3></div>
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
        <li><a href="#">Retur Penjualan</a></li>  
        <li>Laporan</li>
        <li><a href="#">Data Stok</a></li>
        <li><a href="#">Retur Beli</a></li>
        <li><a href="#">Retur Jual</a></li>
        <li><a href="#">Mutasi Kas</a></li>
        <li><a href="#">Mutasi Suplier</a></li>
        <li>Master Data</li>
        <li><a href="#">Tipe</a></li>
        <li><a href="#">Kategori</a></li>
        <li><a href="#">Produk</a></li>
        <li><a href="#">Travelling</a></li>
        <li>Master Data</li>
        <li><a href="#">Tipe</a></li>
        <li><a href="#">Kategori</a></li>
        <li><a href="#">Produk</a></li>
        <li><a href="#">Travelling</a></li>
	</ul> 
</div>  
<div class="wrapper"  >  
    <table width="90%" border="0">
        <tr>
            <td>  
				<?php  
              	if ($_GET['h'] != NULL){ 
                      include "".$_GET['h'].".php"; 
                    }else{	 
                    include "dash.php"; 
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