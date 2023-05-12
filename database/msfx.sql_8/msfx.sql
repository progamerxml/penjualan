-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 22, 2022 at 05:05 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `msfx`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_kas`
--

CREATE TABLE IF NOT EXISTS `akun_kas` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(20) NOT NULL,
  `keterangan` varchar(60) default NULL,
  `saldo` decimal(10,0) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `akun_kas`
--

INSERT INTO `akun_kas` (`id`, `nama`, `keterangan`, `saldo`) VALUES
(1, 'BCA ', 'BCA 0001111', 706876000),
(2, 'TUNAI', 'Uang tunai', 926307500);

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE IF NOT EXISTS `beli` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(20) NOT NULL,
  `suplier` varchar(60) default NULL,
  `total` varchar(10) default NULL,
  `pembayaran` varchar(11) default NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`nofaktur`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `beli`
--

INSERT INTO `beli` (`id`, `nofaktur`, `suplier`, `total`, `pembayaran`, `tgl_add`) VALUES
(9, 'FBI20220922110025', 'XMLTRONIK', '7500000', 'BCA ', '2022-09-22 10:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `beli_rinci`
--

CREATE TABLE IF NOT EXISTS `beli_rinci` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(20) NOT NULL,
  `suplier` varchar(60) default NULL,
  `produk_id` varchar(60) NOT NULL,
  `harga_beli` varchar(10) default NULL,
  `harga_jual` varchar(10) default NULL,
  `qty` decimal(10,0) default NULL,
  `sisa_stok` decimal(10,0) NOT NULL default '0',
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `jum_tot` varchar(999) NOT NULL,
  PRIMARY KEY  (`nofaktur`,`produk_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `beli_rinci`
--

INSERT INTO `beli_rinci` (`id`, `nofaktur`, `suplier`, `produk_id`, `harga_beli`, `harga_jual`, `qty`, `sisa_stok`, `tgl_add`, `jum_tot`) VALUES
(1, 'FBI20220922110025', 'XMLTRONIK', '081575311765', '10000', '12000', 300, 270, '2022-09-22 10:01:21', ''),
(2, 'FBI20220922110025', 'XMLTRONIK', '081575311859', '10000', '8000', 250, 230, '2022-09-22 10:01:21', ''),
(3, 'FBI20220922110025', 'XMLTRONIK', '081575312628', '10000', '12000', 200, 190, '2022-09-22 10:01:21', '');

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE IF NOT EXISTS `distribusi` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(999) NOT NULL,
  `barang` varchar(9999) NOT NULL,
  `qty` varchar(9999) NOT NULL,
  `sales` varchar(9999) NOT NULL,
  `total` varchar(999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `distribusi`
--


-- --------------------------------------------------------

--
-- Table structure for table `input_beli`
--

CREATE TABLE IF NOT EXISTS `input_beli` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(9999) NOT NULL,
  `qty` varchar(9999) NOT NULL,
  `admin` varchar(9999) NOT NULL,
  `waktu` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `input_beli`
--

INSERT INTO `input_beli` (`id`, `produk_id`, `qty`, `admin`, `waktu`, `keterangan`) VALUES
(1, '081575311765', '300', 'Pembelian, admin = Irfan', '2022-09-22 11:01:21', 'Faktur : FBI20220922110025<br>Waktu : 2022-09-22 11:01:21'),
(2, '081575311859', '250', 'Pembelian, admin = Irfan', '2022-09-22 11:01:21', 'Faktur : FBI20220922110025<br>Waktu : 2022-09-22 11:01:21'),
(3, '081575312628', '200', 'Pembelian, admin = Irfan', '2022-09-22 11:01:21', 'Faktur : FBI20220922110025<br>Waktu : 2022-09-22 11:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `input_jual`
--

CREATE TABLE IF NOT EXISTS `input_jual` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(9999) NOT NULL,
  `admin` varchar(9999) NOT NULL,
  `jumlah` varchar(9999) NOT NULL,
  `waktu` varchar(9999) NOT NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `input_jual`
--

INSERT INTO `input_jual` (`id`, `produk_id`, `admin`, `jumlah`, `waktu`, `keterangan`) VALUES
(1, '898989', 'Irfan', '30', '2022-09-22 14:03:01', 'Faktur : FJL20220922020241<br>jam : 2022-09-22 14:03:01'),
(2, 'ALL OPP XML', 'Irfan', '20', '2022-09-22 14:03:01', 'Faktur : FJL20220922020241<br>jam : 2022-09-22 14:03:01'),
(3, '898989', 'Irfan', '75', '2022-09-22 14:09:31', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(4, 'ALL OPP XML', 'Irfan', '80', '2022-09-22 14:09:31', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(5, 'VIDUH1', 'Irfan', '120', '2022-09-22 14:09:31', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(6, 'ALL OPP XML', 'Irfan', '25', '2022-09-22 14:24:41', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(7, '898989', 'Irfan', '15', '2022-09-22 14:24:41', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(8, 'VIDUH1', 'Irfan', '25', '2022-09-22 14:24:41', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(9, 'ALL OPP XML', 'Irfan', '40', '2022-09-22 14:29:04', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(10, '898989', 'Irfan', '15', '2022-09-22 14:29:04', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(11, 'VIDUH1', 'Irfan', '35', '2022-09-22 14:29:04', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(12, '898989', 'Irfan', '3', '2022-09-22 14:30:34', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(13, 'ALL OPP XML', 'Irfan', '40', '2022-09-22 14:30:34', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(14, 'VIDUH1', 'Irfan', '50', '2022-09-22 14:30:34', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(15, '898989', 'Irfan', '55', '2022-09-22 14:54:17', 'Faktur : FJL20220922025408<br>jam : 2022-09-22 14:54:17'),
(16, '898989', 'Irfan', '10', '2022-09-22 14:55:39', 'Faktur : FJL20220922025533<br>jam : 2022-09-22 14:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `input_rbeli`
--

CREATE TABLE IF NOT EXISTS `input_rbeli` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(9999) NOT NULL,
  `jumlah` varchar(9999) NOT NULL,
  `admin` varchar(9999) NOT NULL,
  `waktu` varchar(9999) NOT NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `input_rbeli`
--

INSERT INTO `input_rbeli` (`id`, `produk_id`, `jumlah`, `admin`, `waktu`, `keterangan`) VALUES
(1, '081575312628', '10', 'Irfan', '2022-09-22 11:38:13', 'Nomor Retur : NRB20220922113739<br>waktu : 2022-09-22 11:38:13'),
(2, '081575311859', '20', 'Irfan', '2022-09-22 11:38:13', 'Nomor Retur : NRB20220922113739<br>waktu : 2022-09-22 11:38:13'),
(3, '081575311765', '30', 'Irfan', '2022-09-22 11:38:13', 'Nomor Retur : NRB20220922113739<br>waktu : 2022-09-22 11:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `input_rdistribusi`
--

CREATE TABLE IF NOT EXISTS `input_rdistribusi` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(999) NOT NULL,
  `jumlah` varchar(999) NOT NULL,
  `sales` varchar(999) NOT NULL,
  `admin` varchar(999) NOT NULL,
  `keterangan` varchar(999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `input_rdistribusi`
--

INSERT INTO `input_rdistribusi` (`id`, `produk_id`, `jumlah`, `sales`, `admin`, `keterangan`) VALUES
(1, '898989', '100', 'Konter', 'Irfan', 'No Distribusi : D2209221122<br>waktu : 2022-09-22 11:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `input_rjual`
--

CREATE TABLE IF NOT EXISTS `input_rjual` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(9999) NOT NULL,
  `jumlah` varchar(9999) NOT NULL,
  `admin` varchar(9999) NOT NULL,
  `waktu` varchar(9999) NOT NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `input_rjual`
--

INSERT INTO `input_rjual` (`id`, `produk_id`, `jumlah`, `admin`, `waktu`, `keterangan`) VALUES
(1, 'ALL OPP XML', '20', 'Irfan', '2022-09-22 09:14:20', 'Nomor Retur : NRJ20220922091237<br>waktu : 2022-09-22 09:14:20'),
(2, 'VIDUH1', '10', 'Irfan', '2022-09-22 09:26:20', 'Nomor Retur : NRJ20220922092546<br>waktu : 2022-09-22 09:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE IF NOT EXISTS `jual` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(999) NOT NULL,
  `sales` varchar(999) default NULL,
  `total` varchar(9999) default NULL,
  `pembayaran` varchar(999) default NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jual`
--

INSERT INTO `jual` (`id`, `nofaktur`, `sales`, `total`, `pembayaran`, `tgl_add`) VALUES
(1, 'FJL20220922020241', 'Konter', '830000', 'TUNAI', '2022-09-22 13:03:01'),
(2, 'FJL20220922020902', 'Sales bonge', '3575000', 'TUNAI', '2022-09-22 13:09:31'),
(3, 'FJL20220922022419', 'Sales bonge', '815000', 'TUNAI', '2022-09-22 13:24:41'),
(4, 'FJL20220922022715', 'Sales bonge', '400000', 'TUNAI', '2022-09-22 13:27:53'),
(5, 'FJL20220922022845', 'Sales bonge', '1065000', 'TUNAI', '2022-09-22 13:29:04'),
(6, 'FJL20220922022906', 'Sales bonge', '963000', 'TUNAI', '2022-09-22 13:30:34'),
(7, 'FJL20220922025533', 'Konter', '210000', 'TUNAI', '2022-09-22 13:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `jual_rinci`
--

CREATE TABLE IF NOT EXISTS `jual_rinci` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(200) NOT NULL,
  `sales` varchar(600) default NULL,
  `produk_id` varchar(600) NOT NULL,
  `harga_beli` varchar(100) default NULL,
  `harga_jual` varchar(100) default NULL,
  `qty` decimal(50,0) default NULL,
  `sisa_stok` decimal(50,0) NOT NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `jum_tot` varchar(999) NOT NULL,
  `admin` varchar(999) NOT NULL,
  `keterangan` varchar(999) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jual_rinci`
--

INSERT INTO `jual_rinci` (`id`, `nofaktur`, `sales`, `produk_id`, `harga_beli`, `harga_jual`, `qty`, `sisa_stok`, `tgl_add`, `jum_tot`, `admin`, `keterangan`) VALUES
(1, 'FJL20220922020241', 'Konter', '898989', '20000', '21000', 30, 30, '2022-09-22 13:03:01', '630000', 'Irfan', 'Faktur : FJL20220922020241<br>jam : 2022-09-22 14:03:01'),
(2, 'FJL20220922020241', 'Konter', 'ALL OPP XML', '9000', '10000', 20, 20, '2022-09-22 13:03:01', '200000', 'Irfan', 'Faktur : FJL20220922020241<br>jam : 2022-09-22 14:03:01'),
(3, 'FJL20220922020902', 'Sales bonge', '898989', '20000', '21000', 75, 75, '2022-09-22 13:09:31', '1575000', 'Irfan', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(4, 'FJL20220922020902', 'Sales bonge', 'ALL OPP XML', '9000', '10000', 80, 80, '2022-09-22 13:09:31', '800000', 'Irfan', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(5, 'FJL20220922020902', 'Sales bonge', 'VIDUH1', '7500', '10000', 120, 120, '2022-09-22 13:09:31', '1200000', 'Irfan', 'Faktur : FJL20220922020902<br>jam : 2022-09-22 14:09:31'),
(6, 'FJL20220922022419', 'Sales bonge', 'ALL OPP XML', '9000', '10000', 25, 25, '2022-09-22 13:24:41', '250000', 'Irfan', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(7, 'FJL20220922022419', 'Sales bonge', '898989', '20000', '21000', 15, 15, '2022-09-22 13:24:41', '315000', 'Irfan', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(8, 'FJL20220922022419', 'Sales bonge', 'VIDUH1', '7500', '10000', 25, 25, '2022-09-22 13:24:41', '250000', 'Irfan', 'Faktur : FJL20220922022419<br>jam : 2022-09-22 14:24:41'),
(9, 'FJL20220922022845', 'Sales bonge', 'ALL OPP XML', '9000', '10000', 40, 40, '2022-09-22 13:29:04', '400000', 'Irfan', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(10, 'FJL20220922022845', 'Sales bonge', '898989', '20000', '21000', 15, 15, '2022-09-22 13:29:04', '315000', 'Irfan', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(11, 'FJL20220922022845', 'Sales bonge', 'VIDUH1', '7500', '10000', 35, 35, '2022-09-22 13:29:04', '350000', 'Irfan', 'Faktur : FJL20220922022845<br>jam : 2022-09-22 14:29:04'),
(12, 'FJL20220922022906', 'Sales bonge', '898989', '20000', '21000', 3, 3, '2022-09-22 13:30:34', '63000', 'Irfan', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(13, 'FJL20220922022906', 'Sales bonge', 'ALL OPP XML', '9000', '10000', 40, 40, '2022-09-22 13:30:34', '400000', 'Irfan', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(14, 'FJL20220922022906', 'Sales bonge', 'VIDUH1', '7500', '10000', 50, 50, '2022-09-22 13:30:34', '500000', 'Irfan', 'Faktur : FJL20220922022906<br>jam : 2022-09-22 14:30:34'),
(15, 'FJL20220922025408', 'Konter', '898989', '20000', '21000', 55, 55, '2022-09-22 13:54:17', '1155000', 'Irfan', 'Faktur : FJL20220922025408<br>jam : 2022-09-22 14:54:17'),
(16, 'FJL20220922025533', 'Konter', '898989', '20000', '21000', 10, 10, '2022-09-22 13:55:39', '210000', 'Irfan', 'Faktur : FJL20220922025533<br>jam : 2022-09-22 14:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `jumlah_riwayatps`
--

CREATE TABLE IF NOT EXISTS `jumlah_riwayatps` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(99) NOT NULL,
  `nama` varchar(99) NOT NULL,
  `jumlah` varchar(99) NOT NULL,
  `keterangan` varchar(99) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jumlah_riwayatps`
--

INSERT INTO `jumlah_riwayatps` (`id`, `produk_id`, `nama`, `jumlah`, `keterangan`) VALUES
(1, 'TELEANJAR', 'ALL Produk Teleanjar', '1', ''),
(2, 'ap200', 'ALL OPERATOR PULSA 200000', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(200) default NULL,
  PRIMARY KEY  (`nama`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`nama`, `keterangan`) VALUES
('ELEKTRONIK', 'kategori voucher elektronik ( Satuan Rupiah / Saldo )'),
('FISIK', 'kategori voucher FISIK ( Satuan Pcs)');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_kas`
--

CREATE TABLE IF NOT EXISTS `mutasi_kas` (
  `id` int(11) unsigned zerofill NOT NULL auto_increment,
  `tanggal` timestamp NULL default CURRENT_TIMESTAMP,
  `kas_id` varchar(40) default NULL,
  `ket` varchar(500) default NULL,
  `debet` double default '0',
  `kredit` double default '0',
  `lastbalance` double default '0',
  `currbalance` double default '0',
  `admin` varchar(9999) NOT NULL,
  `opr` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `su_ket` (`kas_id`,`ket`),
  KEY `tanggal` (`tanggal`),
  KEY `ket` (`ket`),
  KEY `supp_id` (`kas_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mutasi_kas`
--

INSERT INTO `mutasi_kas` (`id`, `tanggal`, `kas_id`, `ket`, `debet`, `kredit`, `lastbalance`, `currbalance`, `admin`, `opr`) VALUES
(00000000001, '2022-09-22 10:41:57', 'BCA ', 'Thursday, Tanggal 22-September-2022, Jam 11:41:57', 0, 40000000, 676876000, 636876000, 'Irfan', 'User'),
(00000000002, '2022-09-22 10:42:25', 'BCA ', 'Thursday, Tanggal 22-September-2022, Jam 11:42:25', 0, 30000000, 636876000, 606876000, 'Irfan', 'User'),
(00000000003, '2022-09-22 11:01:52', 'TUNAI', 'Thursday, Tanggal 22-September-2022, Jam 12:01:52', 0, 100000000, 1000214500, 900214500, 'Irfan', 'User'),
(00000000004, '2022-09-22 11:17:28', 'TUNAI', 'No Faktur : FJL20220922121703  6700000', 0, 6700000, 900214500, 906914500, '', 'User'),
(00000000005, '2022-09-22 11:22:12', 'TUNAI', 'No Faktur : FJL20220922122132  7200000', 0, 7200000, 906914500, 914114500, '', 'User'),
(00000000006, '2022-09-22 11:23:17', 'TUNAI', 'No Faktur : FJL20220922122306  1000000', 0, 1000000, 914114500, 915114500, '', 'User'),
(00000000007, '2022-09-22 12:01:16', 'TUNAI', 'No Faktur : FJL20220922010057  1050000', 0, 1050000, 915114500, 916164500, '', 'User'),
(00000000008, '2022-09-22 12:01:46', 'TUNAI', 'No Faktur : FJL20220922010134  1130000', 0, 1130000, 916164500, 917294500, '', 'User'),
(00000000009, '2022-09-22 13:03:01', 'TUNAI', 'No Faktur : FJL20220922020241  830000', 0, 830000, 917294500, 918124500, '', 'User'),
(00000000010, '2022-09-22 13:09:31', 'TUNAI', 'No Faktur : FJL20220922020902  3575000', 0, 3575000, 918124500, 921699500, '', 'User'),
(00000000011, '2022-09-22 13:24:41', 'TUNAI', 'No Faktur : FJL20220922022419  815000', 0, 815000, 921699500, 922514500, '', 'User'),
(00000000012, '2022-09-22 13:27:53', 'TUNAI', 'No Faktur : FJL20220922022715  400000', 0, 400000, 922514500, 922914500, '', 'User'),
(00000000013, '2022-09-22 13:29:04', 'TUNAI', 'No Faktur : FJL20220922022845  1065000', 0, 1065000, 922914500, 923979500, '', 'User'),
(00000000014, '2022-09-22 13:30:34', 'TUNAI', 'No Faktur : FJL20220922022906  963000', 0, 963000, 923979500, 924942500, '', 'User'),
(00000000015, '2022-09-22 13:54:17', 'TUNAI', 'No Faktur : FJL20220922025408  1155000', 0, 1155000, 924942500, 926097500, '', 'User'),
(00000000016, '2022-09-22 13:55:39', 'TUNAI', 'No Faktur : FJL20220922025533  210000', 0, 210000, 926097500, 926307500, 'Irfan', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(9999) NOT NULL,
  `username` varchar(9999) NOT NULL,
  `sandi` varchar(9999) NOT NULL,
  `jabatan` varchar(9999) NOT NULL,
  `foto` varchar(9999) default NULL,
  `tanggal_regis` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `username`, `sandi`, `jabatan`, `foto`, `tanggal_regis`) VALUES
(6, 'alpha satu', 'alpha01@email.com', '747be66dd9e2919711e950e77e8599d0', 'alpha_s', NULL, '2022-08-12 15:58:30'),
(7, 'xm', 's@gmail', '81dc9bdb52d04dc20036dbd8313ed055', 'test', NULL, '2022-08-16 11:58:58'),
(5, 'nama', 'email@email.com', 'a3b8050669e7084d24065e5f5b301584', 'email perusahaan', NULL, '2022-08-12 15:18:25'),
(8, 'coba', 'coba@email.com', 'a3040f90cc20fa672fe31efcae41d2db', 'marketing', NULL, '2022-08-16 13:23:30'),
(9, 'Irfan', 'irfan@email.com', '24b90bc48a67ac676228385a7c71a119', 'IT', NULL, '2022-08-22 14:06:52'),
(10, 'pendaftaran', 'daftar@email.com', '07aad1df9d8908b63e5e8170b2bcc819', 'Pendaftaran', NULL, '2022-08-24 15:11:03'),
(11, 'xml', 'xmltronik@gmail.com', 'cdd773039f5b1a8f41949a1fccd0768f', 'jabatan', NULL, '2022-09-05 09:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `penyesuaian_stok`
--

CREATE TABLE IF NOT EXISTS `penyesuaian_stok` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(999) NOT NULL,
  `nama` varchar(9999) NOT NULL,
  `stok_awal` varchar(99) NOT NULL,
  `stok_akhir` varchar(99) NOT NULL,
  `penambahan` varchar(99) NOT NULL,
  `admin` varchar(999) NOT NULL,
  `waktu` varchar(99) NOT NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `penyesuaian_stok`
--

INSERT INTO `penyesuaian_stok` (`id`, `produk_id`, `nama`, `stok_awal`, `stok_akhir`, `penambahan`, `admin`, `waktu`, `keterangan`) VALUES
(1, 'TELEANJAR', 'ALL Produk Teleanjar', '45000', '48000', '3000', 'Irfan', '2022-09-22 11:49:20', 'terakhir diubah pada : 22-09-2022 11:49:11, oleh : Irfan.'),
(2, 'ap200', 'ALL Produk Teleanjar', '3300', '5000', '1700', 'Irfan', '2022-09-22 11:49:26', 'terakhir diubah pada : 22-09-2022 11:49:21, oleh : Irfan.');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id` bigint(20) NOT NULL auto_increment,
  `produk_id` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `tipe` varchar(999) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL default '-',
  `harga_jual` varchar(20) NOT NULL default '0.0000',
  `harga_beli` varchar(20) NOT NULL default '0.0000',
  `jml_spesial` bigint(20) NOT NULL default '0',
  `harga_spesial` bigint(20) NOT NULL default '0',
  `diskon_jual` double NOT NULL default '0',
  `jml_stok` bigint(11) NOT NULL default '0',
  `nominal` varchar(4) default NULL,
  `tgl_beli` date NOT NULL default '0000-00-00',
  `tgl_jual` date NOT NULL default '0000-00-00',
  `tgl_update` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `tgl_expire` date NOT NULL default '0000-00-00',
  `kode_box` varchar(3) NOT NULL default '-',
  `status` enum('Ready','Sold') NOT NULL default 'Ready',
  `opr` varchar(20) default NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`,`produk_id`),
  UNIQUE KEY `NewIndex1` (`produk_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89608893473 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `produk_id`, `kategori`, `tipe`, `provider`, `nama`, `harga_jual`, `harga_beli`, `jml_spesial`, `harga_spesial`, `diskon_jual`, `jml_stok`, `nominal`, `tgl_beli`, `tgl_jual`, `tgl_update`, `tgl_expire`, `kode_box`, `status`, `opr`, `keterangan`) VALUES
(734, 'BRO1', 'ELEKTRONIK', '', 'TELKOMSEL', 'BRONET 1GB 1 BULAN ', '18900', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(733, 'pln500', 'ELEKTRONIK', '', 'TELKOMSEL', 'TOKEN PLN 500000', '500500', '501600', 0, 0, 0, 5000, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(732, 'pln200', 'ELEKTRONIK', '', 'PCS', 'TOKEN PLN 200000', '200500', '201600', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(300, 'TELEANJAR', 'ELEKTRONIK', '', 'RUPIAH', 'ALL Produk Teleanjar', '', '', 0, 0, 0, 48000, '', '2016-11-17', '0000-00-00', '2022-09-22 10:49:20', '0000-00-00', '-', 'Ready', 'a', 'terakhir diubah pada : 22-09-2022 11:49:11, oleh : Irfan.'),
(731, 'pln100', 'ELEKTRONIK', '', 'TELKOMSEL', 'TOKEN PLN 100000', '100500', '101600', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(730, 'pln50', 'ELEKTRONIK', '', 'PCS', 'TOKEN PLN 50000', '50500', '51600', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(729, 'pln20', 'ELEKTRONIK', '', 'TELKOMSEL', 'TOKEN PLN 20000', '20500', '21600', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(728, 'ap200', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 200000', '', '201000', 0, 0, 0, 5000, NULL, '0000-00-00', '0000-00-00', '2022-09-22 10:49:26', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 22-09-2022 11:49:21, oleh : Irfan.'),
(727, 'ap100', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 100000', '', '101000', 0, 0, 0, 45900, NULL, '0000-00-00', '0000-00-00', '2022-09-10 10:40:16', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 11:40:08, oleh : Irfan.'),
(726, 'ap60', 'ELEKTRONIK', '', 'TELKOMSEL', 'ALL OPERATOR PULSA 60000', '', '61000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(725, 'ap50', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 50000', '', '51000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(724, 'ap25', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 25000', '', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(723, 'ap20', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 20000', '', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(722, 'ap15', 'ELEKTRONIK', '', 'TELKOMSEL', 'ALL OPERATOR PULSA 15000', '', '17000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(721, 'ap10', 'ELEKTRONIK', '', 'PCS', 'ALL OPERATOR PULSA 10000', '', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(720, 'ap5', 'ELEKTRONIK', '', 'TELKOMSEL', 'ALL OPERATOR PULSA 5000', '', '7000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(735, 'BRO2', 'ELEKTRONIK', '', 'PCS', 'BRONET 2GB 2 BULAN', '26100', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(736, 'BRO3', 'ELEKTRONIK', '', 'PCS', 'BRONET 3GB 2 BULAN', '36100', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(737, 'BRO5', 'ELEKTRONIK', '', 'PCS', 'BRONET 5GB 2 BULAN', '54100', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(738, 'XD50M', 'ELEKTRONIK', '', 'PCS', 'HOTROD 50MB 7 HARI ', '6100', '7000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(739, 'XD800M', 'ELEKTRONIK', '', 'PCS', 'HOTROD 800MB 30 HARI ', '30100', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(740, 'XD15', 'ELEKTRONIK', '', 'PCS', 'HOTROD 1,5GB 30 HARI ', '45100', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(741, 'XD3GB', 'ELEKTRONIK', '', 'PCS', 'HOTROD 3GB 30 HARI ', '54100', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(742, 'XD6GB', 'ELEKTRONIK', '', 'PCS', 'HOTROD 6GB 30 HARI', '90100', '91000', 0, 0, 0, 1500, NULL, '0000-00-00', '0000-00-00', '2022-09-10 11:30:17', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 12:30:11, oleh : Irfan.'),
(743, 'XD8GB', 'ELEKTRONIK', '', 'PCS', 'HOTROD 8GB 30 HARI', '117200', '118000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(744, 'XD12GB', 'ELEKTRONIK', '', 'PCS', 'HOTROD 12GB 30 HARI', '162200', '163000', 0, 0, 0, 1678, NULL, '0000-00-00', '0000-00-00', '2022-09-10 11:52:22', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 12:52:16, oleh : Irfan.'),
(745, 'DT5', 'ELEKTRONIK', '', 'PCS', 'TSEL INTERNET KUOTA 35MB Aktif 7hari', '5500', '7000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(746, 'DT10', 'ELEKTRONIK', '', 'PCS', 'TSEL INTERNET KUOTA 90MB Aktif 7hari  ', '10500', '12000', 0, 0, 0, 20000, NULL, '0000-00-00', '0000-00-00', '2022-09-10 13:38:08', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 14:38:03, oleh : Irfan.'),
(747, 'DT20', 'ELEKTRONIK', '', 'PCS', 'TSEL INTERNET KUOTA 420MB Aktif 7hari ', '20200', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(748, 'DT25', 'ELEKTRONIK', '', 'PCS', 'TSEL INTERNET KUOTA 550MB Aktif 30hari', '25200', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(749, 'DT50', 'ELEKTRONIK', '', 'PCS', 'TSEL INET 1.2GB+2GB (4G)+2GB WIFI 30Hri', '48950', '51000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(750, 'DT100', 'ELEKTRONIK', '', 'PCS', 'TSEL INET 2.5GB+1GB LOKAL +4GB (4G)+2GB WIFI 30Hri', '96500', '100000', 0, 0, 0, 9800, NULL, '0000-00-00', '0000-00-00', '2022-09-10 13:58:27', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 14:58:19, oleh : Irfan.'),
(751, 'DI1', 'ELEKTRONIK', '', 'PCS', 'ISAT DATA 1GB RETAIL', '28200', '29000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(752, 'DI2', 'ELEKTRONIK', '', 'PCS', 'ISAT DATA 2GB RETAIL', '41200', '42000', 0, 0, 0, 20000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 14:30:31', '0000-00-00', '-', 'Ready', NULL, ''),
(753, 'DI3', 'ELEKTRONIK', '', 'PCS', 'ISAT DATA 3GB RETAIL', '51300', '52000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(754, 'DI5', 'ELEKTRONIK', '', 'PCS', 'ISAT DATA 5GB RETAIL', '86800', '88000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(755, 'TQ1', 'ELEKTRONIK', '', 'PCS', 'Quota 1GB+10K Pulsa', '18500', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(756, 'TQ2', 'ELEKTRONIK', '', 'PCS', 'Quota 2GB+10K Pulsa', '34500', '36000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(757, 'TQ3', 'ELEKTRONIK', '', 'PCS', 'Quota 3GB+10K Pulsa', '48750', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(758, 'TQ4', 'ELEKTRONIK', '', 'PCS', 'Quota 4GB+10K Pulsa', '59000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2016-11-28 22:53:13', '0000-00-00', '-', 'Ready', NULL, ''),
(759, 'TQ5', 'ELEKTRONIK', '', 'PCS', 'Quota 5GB+20K Pulsa', '72500', '74000', 0, 0, 0, 9000, NULL, '0000-00-00', '0000-00-00', '2022-09-10 11:30:10', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 12:30:00, oleh : Irfan.'),
(89608876198, 'DEPAL', 'ELEKTRONIK', '', 'RUPIAH', 'Deposit Downline', '', '', 0, 0, 0, 0, '', '2016-11-30', '0000-00-00', '2016-11-30 13:06:40', '0000-00-00', '-', 'Ready', 'a', ''),
(89608876331, 'ap30', 'ELEKTRONIK', '', 'PCS', '', '', '31000', 0, 0, 0, 0, '', '2016-12-11', '0000-00-00', '2016-12-11 17:39:07', '0000-00-00', '-', 'Ready', 'a', ''),
(89608882906, 'PPOBALLOP', 'ELEKTRONIK', '', 'RUPIAH', '', '', '', 0, 0, 0, 0, '', '2017-11-08', '0000-00-00', '2017-11-08 10:58:27', '0000-00-00', '-', 'Ready', 'a', ''),
(89608882083, 'MG', 'FISIK', '', 'PCS', 'mobile game', '10000', '10000', 0, 0, 0, 5, '', '2017-10-12', '0000-00-00', '2017-10-12 11:13:00', '0000-00-00', '-', 'Ready', 'a', ''),
(89608882084, 'MMC32C10VGEN', 'FISIK', '', 'PCS', 'MMC 32GB CLASS 10 VGEN', '148000', '148000', 0, 0, 0, 6, '', '2017-10-12', '0000-00-00', '2017-10-12 11:13:44', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881907, 'OTGMN', 'FISIK', '', 'PCS', 'MINI OTG MICRO USB', '10000', '10000', 0, 0, 0, 20, '', '2017-10-01', '0000-00-00', '2017-10-01 12:04:19', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881906, 'KDXTC', 'FISIK', '', 'PCS', 'Kabel Data TYPE C ORI Xiaomi', '15000', '20000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 12:03:06', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881905, 'HS SAMSUNG ', 'FISIK', '', 'PCS', 'HEADSET/HANDSFREE SAMSUNG HS330', '33000', '45000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 12:01:27', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881904, 'IRING KARAKTER HERO', 'FISIK', '', 'PCS', 'IRING KARAKTER HERO', '5000', '10000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:59:29', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881903, 'IRINGPL', 'FISIK', '', 'PCS', 'IRING POLOS', '3000', '10000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:59:13', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881902, 'IRCARAKTERCEWE', 'FISIK', '', 'PCS', 'IRING KARAKTER CEWE', '10000', '15000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:58:03', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881901, 'KDINVIGO ', 'FISIK', '', 'PCS', 'KABEL DATA INVIGO', '10000', '20000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 11:54:30', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881900, 'KDREMAXPIPIH', 'FISIK', '', 'PCS', 'Kabel Data Remax Pipih Micro USB ', '7000', '20000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 11:50:57', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881899, 'CHi9000/s5360', 'FISIK', '', 'PCS', 'Charger Samsung  i9000/s5360', '27500', '35000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 11:49:29', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881898, 'CHXIO2KDORI', 'FISIK', '', 'PCS', 'Charger Xiaomi 2A ORI Kabel Data ORI ', '49000', '55000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:44:52', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881897, 'KDS4NOTE4', 'FISIK', '', 'PCS', 'KabelData Micro FAST CH S4 Note 4 Original 100 % 	', '13000', '13000', 0, 0, 0, 10, '', '2017-10-01', '0000-00-00', '2017-10-01 11:36:05', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881896, 'iPakyS8 ', 'FISIK', '', 'PCS', 'Case iPaky Samsung Galaxy S8', '26500', '35000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:32:05', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881895, 'LNSSPWD0.4', 'FISIK', '', 'PCS', 'lensa super wide 0.4', '10000', '15000', 0, 0, 0, 2, '', '2017-10-01', '0000-00-00', '2017-10-01 11:20:45', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881894, 'CH2.1+2USB', 'FISIK', '', 'PCS', 'charger 2.1+2usb fast charging ', '18500', '40000', 0, 0, 0, 1, '', '2017-10-01', '0000-00-00', '2017-10-01 11:17:15', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881893, 'TS3IN1', 'FISIK', '', 'PCS', 'Tongsis 3IN1 ', '36000', '45000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 11:15:30', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881892, 'TSBL ', 'FISIK', '', 'PCS', 'Tongsis kabel + holder lipat', '15000', '20000', 0, 0, 0, 1, '', '2017-10-01', '0000-00-00', '2017-10-01 11:13:28', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881891, 'KDDAP1M', 'FISIK', '', 'PCS', 'KABEL DATA DAP 1M', '15000', '20000', 0, 0, 0, 0, '', '2017-10-01', '0000-00-00', '2017-10-01 11:10:59', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881727, 'CATRYUMATO', 'FISIK', '', 'PCS', 'CATRIDER YUMOTO', '10000', '12000', 0, 0, 0, 1, '', '2017-09-26', '0000-00-00', '2017-09-26 11:33:24', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881728, 'TEMPELANGURITA', 'FISIK', '', 'PCS', 'TEMPELAN GURITA', '3000', '5000', 0, 0, 0, 1, '', '2017-09-26', '0000-00-00', '2017-09-26 11:33:49', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881726, 'CHSAGALS4ORI', 'FISIK', '', 'PCS', 'CHARGER SAMSUNG GALAXY S4 ORI', '19500', '25000', 0, 0, 0, 1, '', '2017-09-26', '0000-00-00', '2017-09-26 11:32:48', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881723, 'MMC4C6VGEN', 'FISIK', '', 'PCS', 'MMC 4GB CLASS 6 VGEN', '53000', '57500', 0, 0, 0, 2, '', '2017-09-26', '0000-00-00', '2017-09-26 11:29:08', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881722, 'FD32CLASS6SANDISK', 'FISIK', '', 'PCS', 'FALSH DISK 32GB CLASS 6 SANDISK', '155000', '165000', 0, 0, 0, 0, '', '2017-09-26', '0000-00-00', '2017-09-26 11:28:19', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881721, 'FD16CLASS10SANDISK', 'FISIK', '', 'PCS', 'FALSH DISK 16gb CLASS 10 SANDISK', '120000', '100000', 0, 0, 0, 0, '', '2017-09-26', '0000-00-00', '2017-09-26 11:26:17', '0000-00-00', '-', 'Ready', 'a', ''),
(89608881720, 'MMC16C10VGEN', 'FISIK', '', 'PCS', 'MMC 16GB CLASS 10 VGEN', '95000', '110000', 0, 0, 0, 1, '', '2017-09-26', '0000-00-00', '2017-09-26 11:23:32', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884515, 'ADAPTORSIMCARD', 'FISIK', '', 'RUPIAH', 'ADAPTOR SIM CARD', '5000', '7500', 0, 0, 0, 2, '', '2017-12-28', '0000-00-00', '2017-12-28 12:43:57', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884516, 'FDDOMINO8GB', 'FISIK', '', 'RUPIAH', 'FD DOMINO 8GB', '75000', '85000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 12:47:07', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884517, 'HFBLOTOTR550', 'FISIK', '', 'PCS', '', '135000', '150000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:02:32', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884518, 'TC SA NOTE1 / S4 ORI', 'FISIK', '', 'PCS', 'CHARGER  TC SA NOTE1 / S4 ORI', '65000', '80000', 0, 0, 0, 1, '', '2017-12-28', '0000-00-00', '2017-12-28 13:03:39', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884519, 'TCSAROGO2.0', 'FISIK', '', 'PCS', 'TC SA ROGO 2.0 LED COLOR', '25000', '35000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:05:04', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884520, 'HF SA C550', 'FISIK', '', 'PCS', 'Head Seat HF SA C550', '15000', '20000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:07:34', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884521, 'KBLCBM80', 'FISIK', '', 'PCS', 'KABEL CBM 80', '5000', '8000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:08:21', '0000-00-00', '-', 'Ready', 'a', ''),
(89608884522, 'RINGHOLDENCARTOON', 'FISIK', '', 'PCS', 'RING HOLDEN CARTOON', '18000', '23000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:09:12', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892642, '410214', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608884523, 'MMC8C6VGEN', 'FISIK', '', 'PCS', 'MMC 8gb C 6 VGEN', '68000', '80000', 0, 0, 0, 0, '', '2017-12-28', '0000-00-00', '2017-12-28 13:16:51', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885714, 'RING', 'FISIK', '', 'PCS', 'RINGHOLDENPOLOS', '3000', '5000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 12:36:39', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885715, 'BATOKCHARGER', 'FISIK', '', 'PCS', 'BATOK CHARGER SAMSUNG', '7500', '13000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 12:50:46', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885716, 'CARCHARGER', 'FISIK', '', 'PCS', 'CC REMAX NON KABEL', '29000', '40000', 0, 0, 0, 1, '', '2018-02-06', '0000-00-00', '2018-02-06 12:54:47', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885717, 'USBCARCHARGER', 'FISIK', '', 'PCS', 'CAR CHARGER FLASHANGEL 3.1A', '47500', '60000', 0, 0, 0, 1, '', '2018-02-06', '0000-00-00', '2018-02-06 13:03:52', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885718, 'HEADSETCAPSUL', 'FISIK', '', 'PCS', 'HEADSET F.ANGEL CAPSUL', '21000', '30000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 13:08:35', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885719, 'HEADSETROCKET', 'FISIK', '', 'PCS', 'HEADSET F.ANGEL ROCKET', '18500', '25000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 13:10:37', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885720, 'HEADSETROCK+', 'FISIK', '', 'PCS', 'HEADSET F.ANGEL ROCK +', '17000', '25000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 13:11:54', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885721, 'CHARGERNOKIA', 'FISIK', '', 'PCS', 'CHARGER NOKIA ORI', '11000', '20000', 0, 0, 0, 2, '', '2018-02-06', '0000-00-00', '2018-02-06 13:13:24', '0000-00-00', '-', 'Ready', 'a', ''),
(89608885722, 'POWERBANKROBOT', 'FISIK', '', 'PCS', 'PB ROBOT RT5700/5200MAH', '100000', '115000', 0, 0, 0, 0, '', '2018-02-06', '0000-00-00', '2018-02-06 13:15:05', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887635, 'TC SA S4 ', '', '', 'PCS', 'CHARGER SAMSUNG ', '20000', '25000', 0, 0, 0, 0, '', '2018-04-04', '0000-00-00', '2018-04-04 09:18:11', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887636, 'MMC8Robbot', '', '', 'PCS', 'MMC 8gb Robbot', '62000', '75000', 0, 0, 0, 5, '', '2018-04-04', '0000-00-00', '2018-04-04 09:24:26', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887637, 'FD4GBTOSHIBA', '', '', 'PCS', 'FLASHDISK 4GB TOSHIBA', '40000', '50000', 0, 0, 0, 2, '', '2018-04-04', '0000-00-00', '2018-04-04 09:28:09', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887638, 'FD8GBTOSHIBA', '', '', 'PCS', 'FLASHDISK 8GB TOSHIBA', '45000', '58000', 0, 0, 0, 1, '', '2018-04-04', '0000-00-00', '2018-04-04 09:30:57', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887639, 'MMCRobbot8gb', '', '', 'PCS', 'mmc robbot 8gb', '65000', '75000', 0, 0, 0, 0, '', '2018-04-04', '0000-00-00', '2018-04-04 10:28:12', '0000-00-00', '-', 'Ready', 'a', ''),
(89608887640, 'TCSAS4ORI99', '', '', 'PCS', 'CHARGER SAMSUNG ', '20000', '25000', 0, 0, 0, 0, '', '2018-04-04', '0000-00-00', '2018-04-04 10:33:52', '0000-00-00', '-', 'Ready', 'a', ''),
(89608889074, 'TCYUMOTO', '', '', 'PCS', 'CHARGER YUMOTO', '11000', '18000', 0, 0, 0, 0, '', '2018-05-18', '0000-00-00', '2018-05-18 09:25:49', '0000-00-00', '-', 'Ready', 'a', ''),
(89608889075, 'YUMOTO', '', '', 'PCS', 'CHARGER YUMOTO', '11000', '18000', 0, 0, 0, 0, '', '2018-05-18', '0000-00-00', '2018-05-18 09:35:51', '0000-00-00', '-', 'Ready', 'a', ''),
(89608889076, 'TOSHIBA', '', '', 'PCS', 'FD TOSHIBA 2GB', '30000', '40000', 0, 0, 0, 0, '', '2018-05-18', '0000-00-00', '2018-05-18 09:36:41', '0000-00-00', '-', 'Ready', 'a', ''),
(89608889077, 'FD2GBTOSHIBA', 'FISIK', '', 'PCS', 'FLASHDISK 2GB TOSHIBA', '30000', '38000', 0, 0, 0, 0, '', '2018-05-18', '0000-00-00', '2018-05-18 11:44:20', '0000-00-00', '-', 'Ready', 'a', ''),
(89608890415, '081327507308', 'FISIK', '', 'PCS', 'SIMPATI 13GB (3G/4G) 2GB(CHAT) 2GB(HOOQ)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-25 12:01:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890424, '082242704823', 'FISIK', '', 'PCS', 'PERDANA LOOP 5K', '10000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-25 12:01:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890461, '1000294193705', 'FISIK', '', 'PCS', 'VOCHER ISAT 5GB(3G/4G) 5.5GB(APP) 22GB(01-06)', '50000', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-26 10:30:03', '0000-00-00', '-', 'Ready', NULL, ''),
(89608890462, '1000294193524', 'FISIK', '', 'PCS', 'VOCHER ISAT 5GB(3G/4G) 5.5GB(APP) 22GB(01-06)', '50000', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-26 10:30:03', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890463, '  ', '', '', '', '', '', '', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-26 10:30:03', '0000-00-00', '-', 'Ready', NULL, ''),
(89608890650, '083113562654', 'FISIK', '', 'PCS', 'PERDANA AXIS', '1000', '3000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-29 20:40:52', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890652, '083113562660', 'FISIK', '', 'PCS', 'PERDANA AXIS', '1000', '3000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-29 20:40:52', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890653, '083113562662', 'FISIK', '', 'PCS', 'PERDANA AXIS', '1000', '3000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-29 20:40:52', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890654, '083113562661', 'FISIK', '', 'PCS', 'PERDANA AXIS', '1000', '3000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-06-29 20:40:52', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890773, '081327507087', 'FISIK', '', 'PCS', 'SIMPATI 13GB (3G/4G) 2GB(CHAT) 2GB(HOOQ)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-04 09:36:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890774, '081327507301', 'FISIK', '', 'PCS', 'SIMPATI 13GB (3G/4G) 2GB(CHAT) 2GB(HOOQ)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-04 09:36:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890775, '081327507293', 'FISIK', '', 'PCS', 'SIMPATI 13GB (3G/4G) 2GB(CHAT) 2GB(HOOQ)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-04 09:36:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890776, '081327507091', 'FISIK', '', 'PCS', 'SIMPATI 13GB (3G/4G) 2GB(CHAT) 2GB(HOOQ)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-04 09:36:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890959, '088229856651', 'FISIK', '', 'PCS', 'smartfren 1gb 24jam+3gb mlm+1gb 3hari', '20000', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-07 17:20:21', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890963, '088983732151', 'FISIK', '', 'PCS', 'PERDANA SMARTFREN', '2000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-07 17:20:21', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890964, '088983732152', 'FISIK', '', 'PCS', 'PERDANA SMARTFREN', '2000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-07 17:20:21', '0000-00-00', '-', 'Sold', NULL, ''),
(89608890966, '088983732154', 'FISIK', '', 'PCS', 'PERDANA SMARTFREN', '2000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-07 17:20:21', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891277, '085863297397', 'FISIK', '', 'PCS', 'INDOSAT 1GB(3G/4G) 1GB(01-06) 500MB(APP)', '11500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-16 17:18:58', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891413, '0724316', 'FISIK', '', 'PCS', 'VOCHER 7GB(3G/4G),18GB(MLM)', '41000', '44000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-19 18:47:00', '0000-00-00', '-', 'Ready', NULL, ''),
(89608891414, '0724315', 'FISIK', '', 'PCS', 'VOCHER 7GB(3G/4G),18GB(MLM)', '41000', '44000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-19 18:47:00', '0000-00-00', '-', 'Ready', NULL, ''),
(89608891415, '0724314', 'FISIK', '', 'PCS', 'VOCHER 7GB(3G/4G),18GB(MLM)', '41000', '44000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-19 18:47:00', '0000-00-00', '-', 'Ready', NULL, ''),
(89608891416, '0724313', 'FISIK', '', 'PCS', 'VOCHER 7GB(3G/4G),18GB(MLM)', '41000', '44000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-19 18:47:00', '0000-00-00', '-', 'Ready', NULL, ''),
(555555555, '555555555', 'FISIK', '', 'PCS', 'THREE AON 1 GB', '10000', '10000', 0, 0, 0, 999, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:36:51', '2018-10-24', '-', 'Ready', NULL, ''),
(321321, '321321', 'FISIK', '', 'PCS', 'THREE AON 1 GB', '321321', '100000', 0, 0, 0, 10000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 14:15:27', '2018-10-24', '-', 'Ready', NULL, ''),
(89608893465, '081575312367', 'FISIK', '', 'Perdana ISAT', 'PERDANA ISAT PULSA 5K', '10000', '8500', 0, 0, 0, 1200, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:36:37', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893464, '081575311859', 'FISIK', '', 'Perdana ISAT', 'PERDANA ISAT PULSA 5K', '8000', '10000', 0, 0, 0, 330, NULL, '0000-00-00', '0000-00-00', '2018-10-23 18:54:35', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893463, '081575311765', 'FISIK', '', 'Perdana ISAT', 'PERDANA ISAT PULSA 5K', '12000', '10000', 0, 0, 0, 370, NULL, '0000-00-00', '0000-00-00', '2018-10-23 18:54:35', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893467, 'OMG3', '', '', 'Voucher Tsel', 'Voucer Tsel 2 + 1 GB 30 Hari', '12500', '12000', 0, 0, 0, 4000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 13:46:52', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893466, 'VIDUH1', '', '', 'Voucher ISAT', 'Indosat Voucher 1GB', '10000', '7500', 0, 0, 0, 16700, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:50:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893471, 'ALL OPP XML', '', '', 'Server XML', 'Saldo ALL Operator', '10000', '9000', 0, 0, 0, 823800, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:50:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893451, '081575312648', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 5K', '12000', '10000', 0, 0, 0, 200, NULL, '0000-00-00', '0000-00-00', '2018-10-23 18:54:35', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893450, '081575312634', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 5K', '8000', '10000', 0, 0, 0, 200, NULL, '0000-00-00', '0000-00-00', '2018-10-23 18:54:35', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893449, '081575312628', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 5K', '12000', '10000', 0, 0, 0, 690, NULL, '0000-00-00', '0000-00-00', '2018-10-23 18:54:35', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893448, '081575312529', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 5K', '15000', '11000', 0, 0, 0, 47000, NULL, '0000-00-00', '0000-00-00', '2022-09-10 10:40:06', '0000-00-00', '-', 'Ready', NULL, 'terakhir diubah pada : 10-09-2022 11:34:32, oleh : Irfan.'),
(89608893472, '898989', '', '', 'Acc Vivan HP', 'kabel data', '21000', '20000', 0, 0, 0, 91000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:32:09', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893442, '230893', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '2600', '25000', 0, 0, 0, 100, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893441, '230899', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893440, '230898', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893439, '230897', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893438, '230896', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893437, '230895', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893436, '230894', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893435, '230900', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893434, '206511', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893433, '206512', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893432, '206513', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893431, '206514', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893430, '206515', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893429, '586549', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893428, '586550', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893427, '586515', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893426, '586516', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893425, '586517', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893424, '870211', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893423, '870212', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893422, '870213', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893421, '870214', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893420, '870215', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893419, '870216', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893418, '870217', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30250', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893417, '955578', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893416, '955577', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893415, '955576', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893414, '955575', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893413, '955574', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893412, '426255', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893411, '426251', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893410, '426252', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893409, '426253', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893408, '426254', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893407, '050925', 'FISIK', '', 'PCS', 'VOCHER SMART5GB+5GB(MLM)', '24000', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893406, '050926', 'FISIK', '', 'PCS', 'VOCHER SMART5GB+5GB(MLM)', '24000', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893405, '050927', 'FISIK', '', 'PCS', 'VOCHER SMART5GB+5GB(MLM)', '24000', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893404, '050928', 'FISIK', '', 'PCS', 'VOCHER SMART5GB+5GB(MLM)', '24000', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893403, '050929', 'FISIK', '', 'PCS', 'VOCHER SMART5GB+5GB(MLM)', '24000', '26000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-22 17:53:40', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893402, '087884310897', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893401, '087884310895', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893400, '087884310878', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893399, '087884310873', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893398, '087884310861', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893397, '383907', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893396, '383861', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893395, '383934', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893394, '383933', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893393, '383909', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893392, '383908', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893391, '693104', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893390, '693105', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:05', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893389, '693149', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893388, '693103', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893387, '693102', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893386, '693101', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28750', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893385, '567117', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893384, '567118', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893383, '567119', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893382, '567120', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893381, '567116', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893380, '567115', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893379, '870541', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893378, '870542', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893377, '870543', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893376, '870544', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893375, '870545', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893374, '870546', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893373, '870547', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893372, '639825', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893371, '639817', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893370, '639818', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893369, '639819', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893368, '639820', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893367, '639821', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893366, '639822', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893365, '639823', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893364, '639824', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893363, '639816', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893362, '310701', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893361, '310155', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893360, '310198', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893359, '310199', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893358, '310200', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893357, '310197', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893356, '850621', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893355, '850617', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893354, '850616', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893353, '850618', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893352, '850619', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893351, '850620', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893350, '850624', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893349, '850625', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893348, '850623', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893347, '850622', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-19 11:54:04', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893346, '081575399598', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G)5GB(APK)1GB(MLM)', '25000', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-17 10:06:16', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893345, '081575399243', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G)5GB(APK)1GB(MLM)', '25000', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-17 10:06:16', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893344, '081575399562', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G)5GB(APK)1GB(MLM)', '25000', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-17 10:06:16', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893343, '081575399246', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G)5GB(APK)1GB(MLM)', '25000', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-17 10:06:16', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893342, '081575399772', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G)5GB(APK)1GB(MLM)', '25000', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-17 10:06:16', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893341, '810036', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893340, '810047', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893339, '810034', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893338, '810035', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893337, '810033', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893336, '810032', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893335, '160252', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893334, '390586', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893333, '160270', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893332, '160269', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893331, '160271', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893330, '160272', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893329, '737701', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893328, '737705', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893327, '737704', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893326, '737703', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893325, '737702', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893324, '955781', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, '');
INSERT INTO `produk` (`id`, `produk_id`, `kategori`, `tipe`, `provider`, `nama`, `harga_jual`, `harga_beli`, `jml_spesial`, `harga_spesial`, `diskon_jual`, `jml_stok`, `nominal`, `tgl_beli`, `tgl_jual`, `tgl_update`, `tgl_expire`, `kode_box`, `status`, `opr`, `keterangan`) VALUES
(89608893323, '955770', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893322, '955769', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893321, '955768', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893320, '955767', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893319, '637589', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893318, '637582', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893317, '637583', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893316, '637584', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893315, '637585', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893314, '637586', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893313, '637587', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893312, '637588', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893311, '842128', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893310, '842130', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893309, '842131', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893308, '842132', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893307, '242133', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893306, '842129', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893305, '682131', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893304, '682126', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893303, '682127', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893302, '682128', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893301, '682129', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893300, '682130', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893299, '682125', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893298, '755570', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893297, '755569', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893296, '755568', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893295, '755567', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893294, '755576', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893293, '093953', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12750', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893292, '093958', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12750', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893291, '093957', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12750', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893290, '093956', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12750', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893289, '093954', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12750', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893288, '895395', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HR', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893287, '895399', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HR', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893286, '895398', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HR', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893285, '895397', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HR', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893284, '895396', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HR', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893283, '346140', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HR', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893282, '346139', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HR', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893281, '346137', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HR', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893280, '346138', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HR', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893279, '346136', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HR', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893278, '516814', 'FISIK', '', 'PCS', 'SMART 5GB (FUUL),5GB(MLM)', '24000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893277, '516815', 'FISIK', '', 'PCS', 'SMART 5GB (FUUL),5GB(MLM)', '24000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893276, '516816', 'FISIK', '', 'PCS', 'SMART 5GB (FUUL),5GB(MLM)', '24000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893275, '516817', 'FISIK', '', 'PCS', 'SMART 5GB (FUUL),5GB(MLM)', '24000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893274, '516818', 'FISIK', '', 'PCS', 'SMART 5GB (FUUL),5GB(MLM)', '24000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893273, '085960190302', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893272, '085960190301', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893271, '085960190300', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893270, '085960190299', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893269, '085960190298', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893268, '085960190297', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893267, '08170096815', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893266, '08170096816', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893265, '08170096817', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893264, '08170096818', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893263, '08170096819', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893262, '08170096820', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893261, '0859141477126', 'FISIK', '', 'PCS', 'AXIS 1GB (3G/4G)', '10950', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893260, '083106244200', 'FISIK', '', 'PCS', 'AXIS 1GB (3G/4G)', '10950', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893259, '083106244204', 'FISIK', '', 'PCS', 'AXIS 1GB (3G/4G)', '10950', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893258, '081575399767', 'FISIK', '', 'PCS', 'INDOSAT 3GB(3G/4G),5GB(APK),1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893257, '081575399453', 'FISIK', '', 'PCS', 'INDOSAT 3GB(3G/4G),5GB(APK),1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893256, '081575399655', 'FISIK', '', 'PCS', 'INDOSAT 3GB(3G/4G),5GB(APK),1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891658, '8968586', 'FISIK', '', 'PCS', 'ISAT 2GB(3G) 2GB(APP) 15GB(MLM)', '27000', '34000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-29 12:52:27', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891659, '8968582', 'FISIK', '', 'PCS', 'ISAT 2GB(3G) 2GB(APP) 15GB(MLM)', '27000', '34000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-07-29 12:52:27', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893255, '081575399294', 'FISIK', '', 'PCS', 'INDOSAT 3GB(3G/4G),5GB(APK),1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893254, '081575399452', 'FISIK', '', 'PCS', 'INDOSAT 3GB(3G/4G),5GB(APK),1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893253, '081466724665', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 2K', '3000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893252, '081466724672', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 2K', '3000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893251, '081466724671', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 2K', '3000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893250, '081466724814', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 2K', '3000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893249, '081466724818', 'FISIK', '', 'PCS', 'PERDANA ISAT PULSA 2K', '3000', '5000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-15 17:55:46', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893248, '690009', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893247, '690031', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893246, '690032', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893245, '690033', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893244, '690034', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17750', '20000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893243, '755198', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893242, '755190', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893241, '755197', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893240, '755191', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893239, '755189', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '28500', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893238, '392245', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893237, '392247', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893236, '392246', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893235, '392248', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893234, '392249', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893233, '754357', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893232, '754361', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893231, '754360', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893230, '754359', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893229, '754358', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893228, '739249', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893227, '739050', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893226, '739250', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893225, '739161', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893224, '739177', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893223, '840664', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893222, '840660', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893221, '840661', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893220, '840662', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893219, '840663', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893218, '840665', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893217, '840666', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893216, '840667', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893215, '840668', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893214, '840669', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893213, '637310', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893212, '637304', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893211, '637305', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893210, '637306', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893209, '637307', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893208, '637308', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893207, '637309', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893206, '300545', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43000', '45000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893205, '300544', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43000', '45000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893204, '300543', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43000', '45000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893203, '300542', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43000', '45000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893202, '300546', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43000', '45000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893201, '370096', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893200, '370098', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893199, '370097', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893198, '370099', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893197, '370100', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22400', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893196, '460506', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893195, '460509', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893194, '460508', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893193, '460507', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893192, '460510', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893191, '460511', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12950', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893190, '087885052614', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893189, '087885052474', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893188, '087882304994', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893187, '087882304993', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893186, '087885052895', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893185, '085947359233', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893184, '085947359232', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893183, '085947359231', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893182, '085947359230', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893181, '085947359229', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893180, '085947359235', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893179, '085947359234', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893178, '085959363533', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893177, '085959363534', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893176, '085959363535', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893175, '085959363536', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893174, '085959363537', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893173, '085959363538', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893172, '085959363539', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893171, '085959363540', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893170, '083106260149', 'FISIK', '', 'PCS', 'PERDANA AXIS 1GB 3G/4G', '11000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893169, '083106260147', 'FISIK', '', 'PCS', 'PERDANA AXIS 1GB 3G/4G', '11000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893168, '083106260150', 'FISIK', '', 'PCS', 'PERDANA AXIS 1GB 3G/4G', '11000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-09 19:18:11', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893167, '085959302602', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893166, '085959302604', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893165, '085959302603', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893164, '085959302605', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893163, '085959302606', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893162, '085959302607', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893161, '085959302601', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893160, '245431', 'FISIK', '', 'PCS', 'VOCHER SF 5GB 4G+5GB MLM', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893159, '245432', 'FISIK', '', 'PCS', 'VOCHER SF 5GB 4G+5GB MLM', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893158, '245433', 'FISIK', '', 'PCS', 'VOCHER SF 5GB 4G+5GB MLM', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893157, '245434', 'FISIK', '', 'PCS', 'VOCHER SF 5GB 4G+5GB MLM', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893156, '245435', 'FISIK', '', 'PCS', 'VOCHER SF 5GB 4G+5GB MLM', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893155, '957625', 'FISIK', '', 'PCS', 'VOCHER SF 15GB 4G+15GB MLM', '58000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893154, '957624', 'FISIK', '', 'PCS', 'VOCHER SF 15GB 4G+15GB MLM', '58000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893153, '957623', 'FISIK', '', 'PCS', 'VOCHER SF 15GB 4G+15GB MLM', '58000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893152, '957622', 'FISIK', '', 'PCS', 'VOCHER SF 15GB 4G+15GB MLM', '58000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893151, '957621', 'FISIK', '', 'PCS', 'VOCHER SF 15GB 4G+15GB MLM', '58000', '60000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893150, '874424', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893149, '874469', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893148, '874468', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893147, '874402', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893146, '874403', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893145, '874679', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893144, '874663', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893143, '874662', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893142, '874661', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893141, '874660', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893140, '655300', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893139, '655299', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893138, '655298', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893137, '655297', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893136, '655296', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893135, '655256', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893134, '653560', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893133, '386513', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893132, '392705', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893131, '392706', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893130, '392707', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893129, '392708', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893128, '392720', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893127, '689422', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893126, '689423', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893125, '689424', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893124, '689425', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893123, '689426', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893122, '689427', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+UNLIMETED', '17100', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893121, '666433', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893120, '666407', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893119, '666430', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893118, '666431', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893117, '666432', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893116, '666597', 'FISIK', '', 'PCS', 'VOCHER ISAT 2GB+UNLIMETED', '27900', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-06 11:44:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893115, '082242752944', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893114, '082242752985', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893113, '082242752983', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893112, '082242752984', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893111, '082242752943', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893110, '082242752938', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893109, '082242752936', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893108, '082242752955', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893107, '082242752932', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893106, '082242752937', 'FISIK', '', 'PCS', 'TSEL 1GB (3G/4G),250MB (CHAT),2GB(HOOQ)', '30000', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-04 10:07:17', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893105, '144199', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893104, '144248', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893103, '144249', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893102, '074447', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893101, '144246', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893100, '144247', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893099, '144198', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893098, '346301', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893097, '346300', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893096, '346319', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893095, '346320', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893094, '346302', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893093, '500545', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893092, '500542', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893091, '500541', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893090, '500543', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893089, '500544', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893088, '140109', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893087, '140110', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893086, '140108', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893085, '140107', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893084, '140106', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893083, '360082', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893082, '360083', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893081, '360084', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893080, '360085', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893079, '360086', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893078, '360087', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893077, '360088', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893076, '360089', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893075, '360090', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, '');
INSERT INTO `produk` (`id`, `produk_id`, `kategori`, `tipe`, `provider`, `nama`, `harga_jual`, `harga_beli`, `jml_spesial`, `harga_spesial`, `diskon_jual`, `jml_stok`, `nominal`, `tgl_beli`, `tgl_jual`, `tgl_update`, `tgl_expire`, `kode_box`, `status`, `opr`, `keterangan`) VALUES
(89608893074, '360091', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893073, '873342', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893072, '873343', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893071, '873344', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893070, '873345', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893069, '873346', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893068, '873347', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893067, '873348', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893066, '653600', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893065, '653562', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893064, '653561', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893063, '653564', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893062, '653565', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893061, '653563', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893060, '653586', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893059, '653587', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893058, '653588', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893057, '653589', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893056, '737325', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893055, '737324', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893054, '737323', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893053, '737322', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893052, '737321', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893051, '876271', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893050, '876274', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893049, '876273', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893048, '876272', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893047, '876275', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893046, '08174831419', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893045, '08174831418', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893044, '08174831417', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893043, '08174831416', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893042, '08174831392', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893041, '08174831393', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893040, '08174831420', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893039, '08174831386', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-10-03 09:58:24', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893038, '082124331486', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893037, '082124331484', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893036, '082124331483', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893035, '082124331482', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893034, '082124331442', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893033, '082124331490', 'FISIK', '', 'PCS', 'PERDANA TELKOMSEL 10K', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893032, '081575260429', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893031, '081575260596', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893030, '081575260551', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893029, '081575260250', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893028, '081575260553', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893027, '087837398402', 'FISIK', '', 'PCS', 'PERDANA XL 7K', '5000', '8000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893026, '087837398404', 'FISIK', '', 'PCS', 'PERDANA XL 7K', '5000', '8000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893025, '087735367674', 'FISIK', '', 'PCS', 'PERDANA XL 7K', '5000', '8000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893024, '087837398405', 'FISIK', '', 'PCS', 'PERDANA XL 7K', '5000', '8000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893023, '087837398403', 'FISIK', '', 'PCS', 'PERDANA XL 7K', '5000', '8000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893022, '085960192718', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893021, '085960192724', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893020, '085960192723', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893019, '085960192722', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893018, '085960192714', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893017, '085960192715', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893016, '085960192716', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893015, '085960192717', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893014, '085959303614', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893013, '085959303607', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893012, '085959303608', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893011, '085959303613', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893010, '085959303612', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893009, '085959303611', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893008, '085959303610', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893007, '085959303609', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893006, '08816424814', 'FISIK', '', 'PCS', 'PERDANA SMRTFREN UNLIMETED', '65000', '70000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893005, '245046', 'FISIK', '', 'PCS', 'VOCHER SMARTFREN 10GB (4G)', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893004, '245045', 'FISIK', '', 'PCS', 'VOCHER SMARTFREN 10GB (4G)', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893003, '245044', 'FISIK', '', 'PCS', 'VOCHER SMARTFREN 10GB (4G)', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893002, '245043', 'FISIK', '', 'PCS', 'VOCHER SMARTFREN 10GB (4G)', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893001, '245047', 'FISIK', '', 'PCS', 'VOCHER SMARTFREN 10GB (4G)', '27000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893000, '825913', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892999, '825914', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892998, '825915', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892997, '825916', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892996, '825917', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892995, '964206', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892994, '964210', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892993, '964209', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892992, '964208', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892991, '964207', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892990, '964321', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892989, '964350', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892988, '964349', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892987, '631811', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892986, '631814', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892985, '631813', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892984, '631812', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892983, '631850', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-27 19:48:01', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892982, 'KABELMICROVIVAN', 'FISIK', '', 'PCS', 'KABEL DATA PIPIH VIVAN', '11000', '15000', 0, 0, 0, 2, '', '2018-09-27', '0000-00-00', '2018-09-27 10:09:36', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892981, 'FD4GBVANDISK', 'FISIK', '', 'PCS', 'FLASH DISK 4GB VANDISK', '62000', '65000', 0, 0, 0, 2, '', '2018-09-27', '0000-00-00', '2018-09-27 10:06:15', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892980, 'KABELMICROFRIWOL', 'FISIK', '', 'PCS', 'KABEL MICRO FRIWOL', '8000', '10000', 0, 0, 0, 1, '', '2018-09-27', '0000-00-00', '2018-09-27 10:04:19', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892979, 'HFFACAP', 'FISIK', '', 'PCS', 'HF FA CAPSULE', '21000', '25000', 0, 0, 0, 1, '', '2018-09-27', '0000-00-00', '2018-09-27 10:00:20', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892978, 'TCSAS6', 'FISIK', '', 'PCS', 'TC SA S6 FC99%', '20000', '25000', 0, 0, 0, 3, '', '2018-09-27', '0000-00-00', '2018-09-27 09:57:58', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892977, 'KDPIPIHVIVAN', '', '', '', 'KABEL DATA PIPIH VIVAN100', '11000', '25000', 0, 0, 0, 0, '', '2018-09-26', '0000-00-00', '2018-09-26 17:31:29', '0000-00-00', '-', 'Ready', 'a', ''),
(89608892976, '085725959994', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891993, '00620559', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '44250', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-10 18:06:07', '0000-00-00', '-', 'Sold', NULL, ''),
(89608891994, '00620558', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '44250', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-10 18:06:07', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892975, '085725959993', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892974, '085725958994', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892973, '085725958993', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892972, '085725959983', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892971, '085725959984', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892970, '085725960008', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892969, '085725960007', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892968, '085725960002', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892967, '085725959996', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:44:33', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892966, '085865952783', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:04:28', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892965, '085865952755', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:04:28', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892964, '085865952753', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-25 18:04:28', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892963, '087789840557', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892962, '087789840561', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892961, '087789840560', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892960, '087789840559', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892959, '087789840558', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892958, '085960203123', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892957, '085960203124', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892956, '085960203117', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892955, '085960203118', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892954, '085960203119', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892953, '085960203120', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892952, '085960203121', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892951, '085960203122', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892950, '081908943542', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892949, '081908943541', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892948, '081908943540', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892947, '081908943544', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892946, '081908943546', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892945, '081908943532', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892944, '081908943538', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892943, '081908943539', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892942, '085330194670', 'FISIK', '', 'PCS', 'SIMPATI 4GB(3G/4G)+1.5(CHAT)+2GB(HOOQ)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892941, '085330194822', 'FISIK', '', 'PCS', 'SIMPATI 4GB(3G/4G)+1.5(CHAT)+2GB(HOOQ)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892940, '085330194831', 'FISIK', '', 'PCS', 'SIMPATI 4GB(3G/4G)+1.5(CHAT)+2GB(HOOQ)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892939, '085330194611', 'FISIK', '', 'PCS', 'SIMPATI 4GB(3G/4G)+1.5(CHAT)+2GB(HOOQ)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892938, '085330194620', 'FISIK', '', 'PCS', 'SIMPATI 4GB(3G/4G)+1.5(CHAT)+2GB(HOOQ)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892937, '351869', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10250', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892936, '351870', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10250', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892935, '351871', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10250', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892934, '351872', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10250', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892933, '740062', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892932, '740061', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892931, '740060', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892930, '740059', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892929, '740058', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892928, '740057', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892927, '740056', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892926, '330211', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892925, '330212', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892924, '330213', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892923, '330214', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892922, '330215', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892921, '330207', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892920, '330208', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892919, '330209', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892918, '330210', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892917, '330216', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892916, '083971', 'FISIK', '', 'PCS', 'VOCHER ISAT 8GB (3G/4G)', '17750', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892915, '083972', 'FISIK', '', 'PCS', 'VOCHER ISAT 8GB (3G/4G)', '17750', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892914, '083968', 'FISIK', '', 'PCS', 'VOCHER ISAT 8GB (3G/4G)', '17750', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892913, '083969', 'FISIK', '', 'PCS', 'VOCHER ISAT 8GB (3G/4G)', '17750', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892912, '083970', 'FISIK', '', 'PCS', 'VOCHER ISAT 8GB (3G/4G)', '17750', '21000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892911, '084706', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892910, '084707', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892909, '084708', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892908, '084709', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892907, '084710', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892906, '084711', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892905, '084712', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892904, '084713', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892903, '084714', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892902, '084700', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892901, '346547', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892900, '346549', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892899, '346548', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892898, '346505', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892897, '346504', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892896, '161434', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892895, '161435', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892894, '161436', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892893, '161437', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892892, '161438', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892891, '990057', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892890, '990058', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892889, '990055', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892888, '990056', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892887, '990051', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892886, '990054', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892885, '990052', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892884, '990053', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892883, '591569', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892882, '591571', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892110, '306772313660', 'FISIK', '', 'PCS', 'THREE 6GB(3G) 6GB(4G) 18GB(WEEK) 20GB(00-06)', '73000', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-14 18:19:26', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892111, '306772313659', 'FISIK', '', 'PCS', 'THREE 6GB(3G) 6GB(4G) 18GB(WEEK) 20GB(00-06)', '73000', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-14 18:19:26', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892112, '306772313658', 'FISIK', '', 'PCS', 'THREE 6GB(3G) 6GB(4G) 18GB(WEEK) 20GB(00-06)', '73000', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-14 18:19:26', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892113, '306772313657', 'FISIK', '', 'PCS', 'THREE 6GB(3G) 6GB(4G) 18GB(WEEK) 20GB(00-06)', '73000', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-14 18:19:26', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892881, '591572', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892880, '591574', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892879, '591575', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892878, '591576', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892877, '591579', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892876, '591580', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892875, '591581', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892874, '591582', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892873, '741850', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892872, '741839', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892871, '741840', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892870, '741841', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892126, '081575981112', 'FISIK', '', 'PCS', 'PERDANA REGULER ISAT 5K', '8000', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-15 17:20:29', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892127, '081575981081', 'FISIK', '', 'PCS', 'PERDANA REGULER ISAT 5K', '8000', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-15 17:20:29', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892128, '081575981080', 'FISIK', '', 'PCS', 'PERDANA REGULER ISAT 5K', '8000', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-15 17:20:29', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892869, '741838', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892130, '08157767206', 'FISIK', '', 'PCS', 'INDOSAT 1GB(3G/4G) 1GB(01-06) 500MB(APP)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-15 17:20:29', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892868, '741806', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892867, '978934', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892866, '978935', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892865, '978936', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892864, '978937', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892863, '978932', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-24 17:38:02', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892862, '087882304178', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892861, '087882304177', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892139, '0895422722527', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G), 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-16 18:12:22', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892860, '087882304176', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892859, '087882304175', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892142, '081340590143', 'FISIK', '', 'PCS', 'PERDANA REGULER TELKOMSEL 10K', '19750', '22000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-16 18:12:22', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892143, '081340590147', 'FISIK', '', 'PCS', 'PERDANA REGULER TELKOMSEL 10K', '19750', '22000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-16 18:12:22', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892144, '081340590148', 'FISIK', '', 'PCS', 'PERDANA REGULER TELKOMSEL 10K', '19750', '22000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-16 18:12:22', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892858, '087882304173', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '56000', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892857, '085960204760', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892856, '085960204761', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892855, '085960204762', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892854, '085960204763', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892853, '085960204764', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892852, '085960204765', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892851, '085960204766', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892850, '085960204767', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '38000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892849, '08176450167', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892848, '08176450174', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892847, '08176450175', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892846, '08176450176', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892845, '08176450177', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892844, '08176450178', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892843, '08176450179', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892842, ' 08176450181', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892841, '0895422721459', 'FISIK', '', 'PCS', 'THREE 1(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892840, '0895422721460', 'FISIK', '', 'PCS', 'THREE 1(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, '');
INSERT INTO `produk` (`id`, `produk_id`, `kategori`, `tipe`, `provider`, `nama`, `harga_jual`, `harga_beli`, `jml_spesial`, `harga_spesial`, `diskon_jual`, `jml_stok`, `nominal`, `tgl_beli`, `tgl_jual`, `tgl_update`, `tgl_expire`, `kode_box`, `status`, `opr`, `keterangan`) VALUES
(89608892839, '0895422421461', 'FISIK', '', 'PCS', 'THREE 1(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892838, '0895422721462', 'FISIK', '', 'PCS', 'THREE 1(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892837, '0895422721463', 'FISIK', '', 'PCS', 'THREE 1(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892836, '975542', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892835, '736601', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892834, '975545', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892833, '975544', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892832, '975543', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892831, '981690', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892830, '981689', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892829, '981688', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892828, '981687', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892827, '981651', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892826, '981652', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892825, '981653', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892824, '988215', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892823, '988217', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892822, '988220', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892821, '988219', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892820, '988218', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892819, '988216', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892818, '988214', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892817, '591999', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892816, '591998', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892815, '591997', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892814, '591996', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892813, '591995', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892812, '591994', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892811, '591993', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892810, '591992', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892809, '591991', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892808, '591990', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892807, '346299', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892806, '346293', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892805, '346294', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892804, '346295', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892803, '346296', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892802, '346973', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892801, '346974', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892800, '346975', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892799, '346852', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892798, '346972', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892797, '346851', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892796, '176584', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892795, '176581', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892794, '176582', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892793, '176579', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892792, '176580', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892791, '176577', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892790, '176578', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12250', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892789, '083865914267', 'FISIK', '', 'PCS', 'AXIS 1GB(3G/4G)', '10750', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892788, '083865914270', 'FISIK', '', 'PCS', 'AXIS 1GB(3G/4G)', '10750', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892787, '083865914271', 'FISIK', '', 'PCS', 'AXIS 1GB(3G/4G)', '10750', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892786, '083865914269', 'FISIK', '', 'PCS', 'AXIS 1GB(3G/4G)', '10750', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892785, '083865914268', 'FISIK', '', 'PCS', 'AXIS 1GB(3G/4G)', '10750', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892784, '460610', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892783, '460609', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892782, '460608', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892781, '460607', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892780, '460606', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892779, '460605', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB(3G/4G)', '29000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892778, '810343', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892777, '810344', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892776, '810345', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892775, '810346', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892774, '810347', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892773, '810339', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892772, '810340', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB(3G/4G)', '22300', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892771, '360024', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892770, '360023', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892769, '360022', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892768, '360021', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892767, '360020', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892254, '0159816', 'FISIK', '', 'PCS', 'VOCHER ISAT 19GB (3G/4G)', '30000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892255, '0159817', 'FISIK', '', 'PCS', 'VOCHER ISAT 19GB (3G/4G)', '30000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892256, '0159818', 'FISIK', '', 'PCS', 'VOCHER ISAT 19GB (3G/4G)', '30000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892257, '0159819', 'FISIK', '', 'PCS', 'VOCHER ISAT 19GB (3G/4G)', '30000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892258, '0159820', 'FISIK', '', 'PCS', 'VOCHER ISAT 19GB (3G/4G)', '30000', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892766, '360019', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892260, '085842136727', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892261, '085842136726', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892262, '085842136725', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892765, '360018', 'FISIK', '', 'PCS', 'VOCHER AXIS1GB(3G/4G)', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-18 11:00:40', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892264, '081578821076', 'FISIK', '', 'PCS', 'INDOSAT 30GB (3G/4G)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-18 15:11:53', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892764, '085865939687', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892763, '085865939629', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892762, '085865939628', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892761, '085865939631', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892760, '085865939630', 'FISIK', '', 'PCS', 'ISAT 3GB(3G/4G) 1GB(MLM)', '15000', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892759, '081575397816', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892758, '081575396945', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892757, '081575397834', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892756, '081575397951', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892755, '081575398103', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892754, '081575398109', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892753, '081575397562', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892752, '081575398942', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892751, '081575398397', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892750, '081575398376', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892749, '081575398068', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892748, '081575398075', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892747, '081575397942', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892746, '081575397986', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892745, '081575398932', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892744, '081575398793', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892743, '081575398951', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892742, '081575397912', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892741, '081575398301', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892740, '081575398403', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892739, '081575398904', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892738, '081575398751', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892737, '081575398014', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892736, '081575398127', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892735, '081575397692', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892734, '081575397135', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892733, '081575397561', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892732, '081575398167', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892731, '081575397948', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892730, '081575398049', 'FISIK', '', 'PCS', 'INDOSAT PERDANA 6K (AKTIF)', '6000', '10000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-14 18:32:18', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892729, '081274594923', 'FISIK', '', 'PCS', 'SIMPATI7.5GB (3G/4G)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892728, '081274594920', 'FISIK', '', 'PCS', 'SIMPATI7.5GB (3G/4G)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892727, '081274594900', 'FISIK', '', 'PCS', 'SIMPATI7.5GB (3G/4G)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892726, '081274594952', 'FISIK', '', 'PCS', 'SIMPATI7.5GB (3G/4G)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892725, '081274594870', 'FISIK', '', 'PCS', 'SIMPATI7.5GB (3G/4G)', '53000', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892724, '082118661189', 'FISIK', '', 'PCS', 'PERDANA SIMPATI 10K', '22000', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892723, '082118661185', 'FISIK', '', 'PCS', 'PERDANA SIMPATI 10K', '22000', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892722, '082118661187', 'FISIK', '', 'PCS', 'PERDANA SIMPATI 10K', '22000', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892721, '082118661186', 'FISIK', '', 'PCS', 'PERDANA SIMPATI 10K', '22000', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892720, '082118661184', 'FISIK', '', 'PCS', 'PERDANA SIMPATI 10K', '22000', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892719, '085842138153', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892718, '085842138151', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892717, '085842138185', 'FISIK', '', 'PCS', 'INDOSAT 25GB (3G/4G)', '45000', '48000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892716, '081578822627', 'FISIK', '', 'PCS', 'ISAT 25GB(3G/4G),10GB(01.00-06.00)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892715, '081578822628', 'FISIK', '', 'PCS', 'ISAT 25GB(3G/4G),10GB(01.00-06.00)', '90000', '95000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892714, '085960193738', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892713, '085960193739', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892712, '085960193740', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892711, '085960193741', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35500', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892710, '087711457818', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892709, '087711457819', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892708, '087711457820', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892707, '087711457821', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892706, '087711457822', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892705, '0895422421735', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892340, '083841039752', 'FISIK', '', 'PCS', 'AXIS 1GB (3G/4G)', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-21 10:01:07', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892341, '083841039732', 'FISIK', '', 'PCS', 'AXIS 1GB (3G/4G)', '10900', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-21 10:01:07', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892704, '0895422721736', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892703, '0895422721737', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892702, '0895422721738', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892701, '0895392640677', 'FISIK', '', 'PCS', 'THREE 1GB(3G/4G) 1GB(4G)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892700, '975284', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892699, '975285', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892698, '975286', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892697, '975287', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892696, '975288', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892695, '351479', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892694, '351480', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892693, '351481', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892692, '351482', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892691, '351483', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10500', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892690, '980419', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892689, '980418', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892688, '980417', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892687, '980416', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892686, '980415', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892685, '081145', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892684, '081146', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892683, '081147', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892682, '081148', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892681, '081149', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892680, '589155', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892679, '589154', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892678, '589158', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892677, '589183', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892676, '589156', 'FISIK', '', 'PCS', 'VOCHER THREE 2GB+4GB 4G', '30500', '33000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892675, '630455', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892674, '630454', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892673, '630453', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892672, '630452', 'FISIK', '', 'PCS', 'VOCHER THREE 1GB+1GB 4G', '16750', '18000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892377, '087887475245', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '54750', '56000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-21 10:01:07', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892671, '955494', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892670, '955498', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892669, '955497', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892668, '955496', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892667, '955495', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892666, '739796', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892665, '739795', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892664, '739794', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892663, '739792', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892662, '739793', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892661, '739791', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892660, '460846', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892390, '706230', 'FISIK', '', 'PCS', 'VOCHER ISAT 3GB+UNLIMETED', '39500', '43000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892391, '706222', 'FISIK', '', 'PCS', 'VOCHER ISAT 3GB+UNLIMETED', '39500', '43000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892392, '706225', 'FISIK', '', 'PCS', 'VOCHER ISAT 3GB+UNLIMETED', '39500', '43000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892393, '706224', 'FISIK', '', 'PCS', 'VOCHER ISAT 3GB+UNLIMETED', '39500', '43000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892659, '460847', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892395, '706233', 'FISIK', '', 'PCS', 'VOCHER ISAT 3GB+UNLIMETED', '39500', '43000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892658, '460848', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892657, '460849', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892656, '460850', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892655, '400035', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892654, '400034', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892653, '400033', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892652, '400032', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892651, '400031', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892650, '400030', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892405, '122048', 'FISIK', '', 'PCS', 'vocher isat 7 hari ', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892649, '400029', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892648, '410224', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892408, '313785', 'FISIK', '', 'PCS', 'VOCHER THREE 4GB+8GB 4G', '54000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892409, '313784', 'FISIK', '', 'PCS', 'VOCHER THREE 4GB+8GB 4G', '54000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892647, '410225', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892646, '410216', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892645, '410217', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892644, '410218', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892643, '410215', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-11 18:20:31', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892415, '625492', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB+3GB(MLM)', '26500', '28000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892641, '087711458988', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892640, '087711458987', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892639, '087711458986', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892638, '087711458985', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892637, '087711458984', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892636, '087711458983', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892635, '087711458982', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892634, '087711458981', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892633, '085960191175', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892632, '085960191169', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892631, '085960191168', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892630, '085960191167', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892629, '085960191166', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892628, '085939450044', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '55500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892627, '085939450043', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '55500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892626, '085939450039', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '55500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892625, '085939450038', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '55500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892624, '085939450045', 'FISIK', '', 'PCS', 'XL 6GB(3G) 8GB(4G) 1GB(YOUTUBE)', '55500', '58000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892623, '651458', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892445, '130965', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43500', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892446, '130966', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43500', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892447, '130967', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43500', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892448, '130963', 'FISIK', '', 'PCS', 'VOCHER AXIS 5GB', '43500', '46000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892622, '651459', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892450, '080934', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892451, '080935', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892452, '080936', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892621, '651460', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892620, '651461', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892619, '651462', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892618, '651463', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892617, '061515', 'FISIK', '', 'PCS', 'VOCHER THREE 33GB (3G/4G)', '74500', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892616, '061514', 'FISIK', '', 'PCS', 'VOCHER THREE 33GB (3G/4G)', '74500', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892615, '061512', 'FISIK', '', 'PCS', 'VOCHER THREE 33GB (3G/4G)', '74500', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892614, '061510', 'FISIK', '', 'PCS', 'VOCHER THREE 33GB (3G/4G)', '74500', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, '');
INSERT INTO `produk` (`id`, `produk_id`, `kategori`, `tipe`, `provider`, `nama`, `harga_jual`, `harga_beli`, `jml_spesial`, `harga_spesial`, `diskon_jual`, `jml_stok`, `nominal`, `tgl_beli`, `tgl_jual`, `tgl_update`, `tgl_expire`, `kode_box`, `status`, `opr`, `keterangan`) VALUES
(89608892613, '061511', 'FISIK', '', 'PCS', 'VOCHER THREE 33GB (3G/4G)', '74500', '77000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892612, '952569', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892466, '975449', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892467, '975450', 'FISIK', '', 'PCS', 'SMARTFREN 8GB ', '28000', '30000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892611, '952562', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892610, '952568', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892609, '952563', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892608, '952565', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892607, '852355', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892606, '852356', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892605, '852359', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892604, '852360', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892603, '852372', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892479, '08817690213', 'FISIK', '', 'PCS', 'smartfren 8gb 24jam+8gb mlm', '51500', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892480, '08817690267', 'FISIK', '', 'PCS', 'smartfren 8gb 24jam+8gb mlm', '51500', '55000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-24 18:07:06', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892602, '852361', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892601, '852332', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892600, '852333', 'FISIK', '', 'PCS', 'VOCHER THREE 1.5GB 3G/4G', '12500', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892484, '081575396235', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892485, '081575396253', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892486, '081575396376', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892487, '081575396367', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892488, '081575396372', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892489, '081575396434', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892490, '081575396431', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892491, '081575396086', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892493, '081575397349', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 7K', '7000', '15000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Ready', NULL, ''),
(89608892494, '085799173744', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892495, '085700579160', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892496, '085799176534', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892497, '085799176533', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892498, '085700579161', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892599, '970746', 'FISIK', '', 'PCS', 'VOC ISAT1GB(3G/4G)1.5GB(APP)5.5GB(01-06)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892500, '085700579165', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892501, '085700579164', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892502, '085700579168', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892503, '085700579169', 'FISIK', '', 'PCS', 'PERDANA INDOSAT 0K', '2000', '4000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-29 18:13:13', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892504, '082242690146', 'FISIK', '', 'PCS', 'T.SEL 5GB(3G/4G),1.5GB(CHATT),2GB(HOOQ)', '69000', '72000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892505, '082242690116', 'FISIK', '', 'PCS', 'T.SEL 5GB(3G/4G),1.5GB(CHATT),2GB(HOOQ)', '69000', '72000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892506, '082242690117', 'FISIK', '', 'PCS', 'T.SEL 5GB(3G/4G),1.5GB(CHATT),2GB(HOOQ)', '69000', '72000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892507, '082242690114', 'FISIK', '', 'PCS', 'T.SEL 5GB(3G/4G),1.5GB(CHATT),2GB(HOOQ)', '69000', '72000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892508, '082242690147', 'FISIK', '', 'PCS', 'T.SEL 5GB(3G/4G),1.5GB(CHATT),2GB(HOOQ)', '69000', '72000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892510, '091879', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892511, '091890', 'FISIK', '', 'PCS', 'SMARTFREN 3GB', '10000', '13000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892598, '970747', 'FISIK', '', 'PCS', 'VOC ISAT1GB(3G/4G)1.5GB(APP)5.5GB(01-06)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892597, '970748', 'FISIK', '', 'PCS', 'VOC ISAT1GB(3G/4G)1.5GB(APP)5.5GB(01-06)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892514, '912450', 'FISIK', '', 'PCS', 'SMARTFREN 8GB', '28000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892515, '912449', 'FISIK', '', 'PCS', 'SMARTFREN 8GB', '28000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892516, '912448', 'FISIK', '', 'PCS', 'SMARTFREN 8GB', '28000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892517, '912447', 'FISIK', '', 'PCS', 'SMARTFREN 8GB', '28000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892518, '912446', 'FISIK', '', 'PCS', 'SMARTFREN 8GB', '28000', '31000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892519, '106009', 'FISIK', '', 'PCS', 'SMARTFREN 16GB', '55000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892520, '106010', 'FISIK', '', 'PCS', 'SMARTFREN 16GB', '55000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892521, '106011', 'FISIK', '', 'PCS', 'SMARTFREN 16GB', '55000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892522, '106012', 'FISIK', '', 'PCS', 'SMARTFREN 16GB', '55000', '57000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892596, '970744', 'FISIK', '', 'PCS', 'VOC ISAT1GB(3G/4G)1.5GB(APP)5.5GB(01-06)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892525, '717193', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892526, '717199', 'FISIK', '', 'PCS', 'VOCHER THREE 3GB 3G/4G', '23500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892595, '970745', 'FISIK', '', 'PCS', 'VOC ISAT1GB(3G/4G)1.5GB(APP)5.5GB(01-06)', '16500', '19000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892594, '170785', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892593, '170765', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892592, '170766', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892591, '170767', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892590, '170789', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892589, '170788', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892537, '567861', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892538, '567865', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892539, '688816', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 15HARI', '9600', '12000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892541, '270560', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892542, '270559', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892543, '270558', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892544, '270557', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892545, '270556', 'FISIK', '', 'PCS', 'VOUCHER ISAT 1GB 7HARI', '7250', '9000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892588, '170787', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892587, '170786', 'FISIK', '', 'PCS', 'VOCHER ISAT 1GB+500MB+1GB MLM', '12000', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892586, '090556', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892585, '090557', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892584, '090558', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892583, '090559', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892582, '090555', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892581, '090554', 'FISIK', '', 'PCS', 'VOCHER AXIS 3GB', '29500', '32000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892580, '840404', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892555, '3190853', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '25000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892579, '840403', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892578, '840402', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892577, '840401', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892576, '870598', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892575, '870597', 'FISIK', '', 'PCS', 'VOCHER AXIS 2GB', '22500', '24000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892574, '140838', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892562, '087711460880', 'FISIK', '', 'PCS', 'XL 1.5GB(3G) 2GB(4G) 1GB(YOUTUBE)', '25000', '27000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892573, '140839', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892572, '140840', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892571, '140846', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892566, '085960194652', 'FISIK', '', 'PCS', 'XL 3GB(3G) 4GB(4G) 1GB(YOUTUBE)', '35000', '37000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-08-30 17:30:42', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892570, '140847', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892569, '140848', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892568, '140849', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608892567, '140850', 'FISIK', '', 'PCS', 'VOCHER AXIS 1GB', '12900', '14000', 0, 0, 0, 0, NULL, '0000-00-00', '0000-00-00', '2018-09-04 10:39:38', '0000-00-00', '-', 'Sold', NULL, ''),
(89608893469, '085712345674', '', '', 'Perdana ISAT', 'Nomor Cantik Indosat ', '20000', '5000', 0, 0, 0, 9000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:36:11', '0000-00-00', '-', 'Ready', NULL, ''),
(89608893470, '085878578578', '', '', 'SP data Indosat', 'Isat data 1GB', '12000', '10000', 0, 0, 0, 9000, NULL, '0000-00-00', '0000-00-00', '2022-09-09 10:36:02', '0000-00-00', '-', 'Ready', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE IF NOT EXISTS `provider` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `tipe` varchar(50) default NULL,
  PRIMARY KEY  (`id`,`nama`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `nama`, `keterangan`, `tipe`) VALUES
(0, 'SP data Indosat', 'Perdana data Indosat', 'Perdana'),
(0, 'Perdana TSEL', 'Perdana Telkomsel', 'Perdana'),
(0, 'Perdana ISAT', 'Pedana Indosat', 'Perdana'),
(0, 'Voucher ISAT', 'Voucher Indosat', 'Voucer '),
(0, 'Voucher Tsel', 'Voucher Telkomsel', 'Voucer '),
(0, 'Acc Vivan HP', 'Accesoris HP Merek Vivan', 'Accesoris HP'),
(0, 'Server XML', 'Saldo XML', 'Saldo ALL Operator');

-- --------------------------------------------------------

--
-- Table structure for table `retur_beli_rinci`
--

CREATE TABLE IF NOT EXISTS `retur_beli_rinci` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(20) default NULL,
  `nofaktur` varchar(20) NOT NULL,
  `suplier` varchar(60) default NULL,
  `produk_id` varchar(60) NOT NULL,
  `harga_beli` varchar(10) default NULL,
  `qty` varchar(10) default NULL,
  `total_beli` varchar(999) NOT NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`nofaktur`,`produk_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `retur_beli_rinci`
--

INSERT INTO `retur_beli_rinci` (`id`, `noretur`, `nofaktur`, `suplier`, `produk_id`, `harga_beli`, `qty`, `total_beli`, `tgl_add`) VALUES
(1, 'NRB20220922113739', 'FBI20220922110025', 'XMLTRONIK', '081575312628', '10000', '10', '100000', '2022-09-22 10:38:13'),
(2, 'NRB20220922113739', 'FBI20220922110025', 'XMLTRONIK', '081575311859', '10000', '20', '200000', '2022-09-22 10:38:13'),
(3, 'NRB20220922113739', 'FBI20220922110025', 'XMLTRONIK', '081575311765', '10000', '30', '300000', '2022-09-22 10:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `retur_distribusi`
--

CREATE TABLE IF NOT EXISTS `retur_distribusi` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(999) NOT NULL,
  `no_distribusi` varchar(999) NOT NULL,
  `sales` varchar(999) NOT NULL,
  `produk_id` varchar(999) NOT NULL,
  `qty` varchar(999) NOT NULL,
  `total` varchar(999) NOT NULL,
  `tgl_retur` varchar(999) NOT NULL,
  `admin` varchar(999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `retur_distribusi`
--

INSERT INTO `retur_distribusi` (`id`, `noretur`, `no_distribusi`, `sales`, `produk_id`, `qty`, `total`, `tgl_retur`, `admin`) VALUES
(1, 'NRD20220922112247', 'D2209221122', 'Konter', '898989', '100', '2100000', '2022-09-22 11:22:49', 'Irfan');

-- --------------------------------------------------------

--
-- Table structure for table `retur_jual_rinci`
--

CREATE TABLE IF NOT EXISTS `retur_jual_rinci` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(200) default NULL,
  `nofaktur` varchar(200) NOT NULL,
  `sales` varchar(600) default NULL,
  `produk_id` varchar(600) NOT NULL,
  `harga_jual` varchar(10) default NULL,
  `qty` varchar(10) default NULL,
  `total_jual` varchar(999) NOT NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `retur_jual_rinci`
--

INSERT INTO `retur_jual_rinci` (`id`, `noretur`, `nofaktur`, `sales`, `produk_id`, `harga_jual`, `qty`, `total_jual`, `tgl_add`) VALUES
(1, 'NRJ20220922091237', 'FJL20220921043908', 'Konter', 'ALL OPP XML', '10000', '20', '200000', '2022-09-22 08:14:20'),
(2, 'NRJ20220922092546', 'FJL20220921043948', 'Sales bonge', 'VIDUH1', '10000', '10', '100000', '2022-09-22 08:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(9999) NOT NULL,
  `alamat` varchar(9999) NOT NULL,
  `keterangan` varchar(999) NOT NULL,
  `foto` varchar(9999) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `nama`, `alamat`, `keterangan`, `foto`) VALUES
(1, 'Konter', 'Jl. Flores Cilacap', 'Sales utama', 'konter.jpg'),
(3, 'Sales bonge', 'Jl. Jawa cilacap jawa tengah', 'Sales 2', NULL),
(4, 'Sales Maulana', 'Jl. Kalimantan Cilacap Jawa Tengah', 'sales 3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stok_distribusi`
--

CREATE TABLE IF NOT EXISTS `stok_distribusi` (
  `id` bigint(20) NOT NULL auto_increment,
  `produk_id` varchar(500) NOT NULL,
  `kategori` varchar(300) NOT NULL,
  `provider` varchar(300) NOT NULL,
  `nama` varchar(500) NOT NULL default '-',
  `harga_jual` varchar(200) character set utf8 NOT NULL default '0.0000',
  `harga_beli` varchar(200) character set utf8 NOT NULL default '0.0000',
  `jml_spesial` bigint(20) NOT NULL default '0',
  `harga_spesial` bigint(20) NOT NULL default '0',
  `diskon_jual` double NOT NULL default '0',
  `gudang` varchar(10) default NULL,
  `jml_stok` bigint(11) NOT NULL default '0',
  `nominal` varchar(40) default NULL,
  `tgl_beli` date NOT NULL default '0000-00-00',
  `tgl_jual` date NOT NULL default '0000-00-00',
  `tgl_update` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `tgl_expire` date NOT NULL default '0000-00-00',
  `kode_box` varchar(30) NOT NULL default '-',
  `status` enum('Ready','Sold') NOT NULL default 'Ready',
  `opr` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stok_distribusi`
--


-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE IF NOT EXISTS `suplier` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(20) default NULL,
  `alamat` varchar(200) default NULL,
  `keterangan` varchar(200) default NULL,
  `status` int(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`id`, `nama`, `alamat`, `keterangan`, `status`) VALUES
(1, 'XMLTRONIK', 'Sidanegara Indah', 'ketarangan', 0),
(2, 'Toko Contoh', 'Alamat toko contoh', 'keterangan toko contoh', 0),
(3, 'Toko Contoh 2', 'Alamat Toko Contoh 2', 'keterangan Toko Contoh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tipe`
--

CREATE TABLE IF NOT EXISTS `tipe` (
  `id` int(11) NOT NULL auto_increment,
  `kategori` varchar(20) default NULL,
  `nama` varchar(100) default NULL,
  `keterangan` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tipe`
--

INSERT INTO `tipe` (`id`, `kategori`, `nama`, `keterangan`) VALUES
(1, 'ELEKTRONIK', 'Saldo ALL Operator', 'Saldo ALL Operator'),
(2, 'FISIK', 'Accesoris HP', 'Accesoris HP'),
(3, 'FISIK', 'Voucer ', 'Voucer Fisik'),
(4, 'FISIK', 'Perdana', 'Perdana ');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_beli`
--

CREATE TABLE IF NOT EXISTS `tmp_beli` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(20) NOT NULL,
  `suplier` varchar(60) default NULL,
  `produk_id` varchar(60) NOT NULL,
  `harga_beli` varchar(10) default NULL,
  `harga_jual` varchar(10) default NULL,
  `qty` varchar(10) default NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`nofaktur`,`produk_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

--
-- Dumping data for table `tmp_beli`
--

INSERT INTO `tmp_beli` (`id`, `nofaktur`, `suplier`, `produk_id`, `harga_beli`, `harga_jual`, `qty`, `tgl_add`) VALUES
(121, 'FBI20220922031354', 'Toko Contoh', '898989', '20000', '21000', '1', '2022-09-22 14:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_distri`
--

CREATE TABLE IF NOT EXISTS `tmp_distri` (
  `id` int(11) NOT NULL auto_increment,
  `produk_id` varchar(999) NOT NULL,
  `nama_barang` varchar(999) NOT NULL,
  `qty` varchar(99) NOT NULL,
  `sales` varchar(99) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `tmp_distri`
--


-- --------------------------------------------------------

--
-- Table structure for table `tmp_jual`
--

CREATE TABLE IF NOT EXISTS `tmp_jual` (
  `id` int(11) NOT NULL auto_increment,
  `nofaktur` varchar(999) NOT NULL,
  `sales` varchar(999) default NULL,
  `produk_id` varchar(999) NOT NULL,
  `harga_beli` varchar(999) default NULL,
  `harga_jual` varchar(999) default NULL,
  `qty` mediumtext,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=208 ;

--
-- Dumping data for table `tmp_jual`
--


-- --------------------------------------------------------

--
-- Table structure for table `tmp_retur_beli`
--

CREATE TABLE IF NOT EXISTS `tmp_retur_beli` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(20) default NULL,
  `nofaktur` varchar(20) NOT NULL,
  `suplier` varchar(60) default NULL,
  `produk_id` varchar(60) NOT NULL,
  `harga_beli` varchar(10) default NULL,
  `qty` varchar(10) default NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`nofaktur`,`produk_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `tmp_retur_beli`
--


-- --------------------------------------------------------

--
-- Table structure for table `tmp_retur_distri`
--

CREATE TABLE IF NOT EXISTS `tmp_retur_distri` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(999) NOT NULL,
  `nodistribusi` varchar(999) NOT NULL,
  `sales` varchar(999) NOT NULL,
  `produk_id` varchar(999) NOT NULL,
  `harga_jual` varchar(999) NOT NULL,
  `jumlah` varchar(999) NOT NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tmp_retur_distri`
--


-- --------------------------------------------------------

--
-- Table structure for table `tmp_retur_jual`
--

CREATE TABLE IF NOT EXISTS `tmp_retur_jual` (
  `id` int(11) NOT NULL auto_increment,
  `noretur` varchar(200) NOT NULL,
  `nofaktur` varchar(200) NOT NULL,
  `sales` varchar(600) NOT NULL,
  `produk_id` varchar(600) NOT NULL,
  `harga_jual` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `tgl_add` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `tmp_retur_jual`
--


-- --------------------------------------------------------

--
-- Table structure for table `transaksi_distribusi`
--

CREATE TABLE IF NOT EXISTS `transaksi_distribusi` (
  `id` int(11) NOT NULL auto_increment,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `kode_transaksi` varchar(999) NOT NULL,
  `nama_barang` varchar(9999) NOT NULL,
  `kode_barang` varchar(9999) NOT NULL,
  `nama_sales` varchar(999) NOT NULL,
  `qty` varchar(9999) NOT NULL,
  `keterangan` varchar(9999) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transaksi_distribusi`
--

INSERT INTO `transaksi_distribusi` (`id`, `tanggal`, `kode_transaksi`, `nama_barang`, `kode_barang`, `nama_sales`, `qty`, `keterangan`) VALUES
(1, '2022-09-22 10:22:01', 'D2209221122', 'PERDANA ISAT PULSA 5K', '081575312367', 'Konter', '0', 'admin : Irfan'),
(2, '2022-09-22 10:22:01', 'D2209221122', 'Saldo ALL Operator', 'ALL OPP XML', 'Konter', '35', 'admin : Irfan'),
(3, '2022-09-22 10:22:01', 'D2209221122', 'Indosat Voucher 1GB', 'VIDUH1', 'Konter', '75', 'admin : Irfan'),
(4, '2022-09-22 10:22:01', 'D2209221122', 'kabel data', '898989', 'Konter', '150', 'admin : Irfan'),
(5, '2022-09-22 13:08:57', 'D2209221408', 'Indosat Voucher 1GB', 'VIDUH1', 'Sales bonge', '160', 'admin : Irfan'),
(6, '2022-09-22 13:08:57', 'D2209221408', 'Saldo ALL Operator', 'ALL OPP XML', 'Sales bonge', '70', 'admin : Irfan'),
(7, '2022-09-22 13:08:57', 'D2209221408', 'kabel data', '898989', 'Sales bonge', '7', 'admin : Irfan');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_mukas`
--

CREATE TABLE IF NOT EXISTS `transaksi_mukas` (
  `id` int(11) NOT NULL auto_increment,
  `akun_asal` varchar(999) NOT NULL,
  `akun_tujuan` varchar(999) NOT NULL,
  `nominal` varchar(999) NOT NULL,
  `waktu` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `admin` varchar(999) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `transaksi_mukas`
--

INSERT INTO `transaksi_mukas` (`id`, `akun_asal`, `akun_tujuan`, `nominal`, `waktu`, `admin`, `keterangan`) VALUES
(1, 'BCA ', 'TUNAI', '40000000', '2022-09-22 10:41:57', 'Irfan', 'Thursday, Tanggal 22-September-2022, Jam 11:41:57'),
(2, 'BCA ', 'TUNAI', '30000000', '2022-09-22 10:42:25', 'Irfan', 'Thursday, Tanggal 22-September-2022, Jam 11:42:25'),
(3, 'TUNAI', 'BCA ', '100000000', '2022-09-22 11:01:52', 'Irfan', 'Thursday, Tanggal 22-September-2022, Jam 12:01:52');
