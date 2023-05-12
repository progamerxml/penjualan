<?php 
session_start();

 include  "func/conn.inc.php";
 include  "func/function.php";
 global $res;
 
error_reporting(0);
 
 
if (isset($_SESSION['user'])) {
    header("Location: index.php");
}
 
if (isset($_POST['submit'])) {
    $nama = $_POST['nama'];
    $username = $_POST['email'];
    $password = md5($_POST['password']);
    $cpassword = md5($_POST['cpassword']);
    $jabatan = $_POST['jabatan'];
    $foto = $_POST['foto'];
    if ($password == $cpassword) {
        echo "password sama";
        $sql = "SELECT * FROM pengguna WHERE username='$username'";
        $result = mysql_query($sql);
        if (!mysql_num_rows($result) > 0) {
            $sql = "INSERT INTO pengguna(
                id,
                nama,
                username,
                sandi,
                jabatan,
                foto,
                tanggal_regis
                )
                VALUES (
                NULL , '$nama', '$username', '$password', '$jabatan', NULL ,
                CURRENT_TIMESTAMP
                );";
            $result = mysql_query($sql);
            if ($result) {
                echo "<script>alert('Selamat, registrasi berhasil!')</script>";
                $username = "";
                $email = "";
                $_POST['password'] = "";
                $_POST['cpassword'] = "";
            } else {
                echo "<script>alert('Woops! Terjadi kesalahan.')</script>";
            }
        } else {
            echo "<script>alert('Woops! Email Sudah Terdaftar.')</script>";
        }
         
    } else {
        echo "<script>alert('Password Tidak Sesuai')</script>";
    }
}
 
?>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 

    <link rel="stylesheet" type="text/css" href="style.css">
 
    <title>Pendaftaran | Management Stok Fisik XML</title>
</head>
<body>
    <div class="container">
        <form action="" method="POST" class="login-email">
            <p class="login-text" style="font-size: 2rem; font-weight: 800;">Pendaftaran</p>
            <div class="input-group">
                <input type="text" placeholder="Nama" name="nama" value="<?php echo $nama; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <input type="email" placeholder="Email" name="email" value="<?php echo $email; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <input type="password" placeholder="Password" name="password" value="<?php echo $_POST['password']; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <input type="password" placeholder="Confirm Password" name="cpassword" value="<?php echo $_POST['cpassword']; ?>" required>
            </div>
            <br>
            <div class="input-group">
                <input type="text" placeholder="Jabatan" name="jabatan" value="<?php echo $_POST['jabatan']; ?>" required>
            </div>
            <br>
            <div class="input-group d-flex">
                <label class="me-5" for="foto">Foto diri</label>
                <input class="me-3" type="file" name="foto" id="foto" value="<?php echo $_POST['foto']; ?>">
            </div>
            <br>
            <div class="input-group">
                <button name="submit" class="btn btn-outline-success">Register</button>
            </div>
            <br>
            <p class="login-register-text">Anda sudah punya akun? <a href="login.php" class="text-decoration-none fw-bolder text-info">Login </a></p>
        </form>
    </div>
</body>
</html>