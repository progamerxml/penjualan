<?php
session_start();
if(isset($_SESSION['user'])){
    header("Location:index.php");
}

include  "func/conn.inc.php";
include  "func/function.php";
global $res;
 
error_reporting(0);
 
 //tangkap input username dan password dan enkripsi password
if (isset($_POST['submit'])) {
    $username = htmlspecialchars($_POST['username']);
    $password = md5(htmlspecialchars($_POST['password']));

    //cek apakah username sudah ada di dalam database user
    $sqluser = "select username from pengguna where username = '$username'";
    $resultuser = mysql_query($sqluser);
    if (mysql_num_rows($resultuser) > 0 ) {


        //jika ada cek password apakah sama dengan yang ada di database
        $sqlsandi = "select sandi from pengguna where sandi = '$password'";
        $resultsandi = mysql_query($sqlsandi);
        if (mysql_num_rows($resultsandi)) {


            $_SESSION['user'] = ($_POST['username']);
            header("Location:index.php");


        }else{
            //jika password salah tampilkan pesan kesalahan
            echo "<script>alert('Password yang anda masukan salah, periksa kembali password anda.')</script>";
        }
    }else{
        //jika username belum ada tampilkan pesan kesalahan
        echo "<script>alert('Username yang anda masukan belum tersedia, silahkan lakukan pendaftaran dahulu.')</script>";
        header("Location: daftar.php");
    }
}


 
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" type="text/css" href="css.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
 
    <title>Login | Management Stok Fisik XML</title>
</head>
<body>
    <div class="alert alert-warning" role="alert">
        <?php echo $_SESSION['error']?>
    </div>
 
    <div class="container">
        <form action="" method="POST" class="login-email">
            <p class="login-text" style="font-size: 2rem; font-weight: 800;">Login</p>
            <div class="input-group">
                <input type="text" placeholder="username" name="username" value="<?php echo $username; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <input type="password" placeholder="Password" name="password" value="<?php echo $_POST['password']; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <button name="submit" class="btn btn-warning text-white fw-bolder">Login</button>
            </div>
            <p class="login-register-text">Anda belum punya akun ? <a href="daftar.php" class="text-decoration-none fw-bolder text-warning">Daftar</a></p>
        </form>
    </div>
</body>
</html>