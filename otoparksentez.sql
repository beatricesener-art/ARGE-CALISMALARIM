-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Eylül 2017 saat 16:49:16
-- Sunucu sürümü: 5.0.51
-- PHP Sürümü: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Veritabanı: `otoparksentez`
-- 

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_abonelikturleri`
-- 

CREATE TABLE `db_abonelikturleri` (
  `id` int(10) NOT NULL auto_increment,
  `abonelik_adi` varchar(1000) NOT NULL,
  `abonelik_suresi` varchar(1000) NOT NULL,
  `ucret` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_abonelikturleri`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_araclar`
-- 

CREATE TABLE `db_araclar` (
  `id` int(11) NOT NULL auto_increment,
  `kullaniciid` varchar(1000) NOT NULL,
  `marka` varchar(1000) NOT NULL,
  `model` varchar(1000) NOT NULL,
  `renk` varchar(1000) NOT NULL,
  `UID` varchar(1000) NOT NULL,
  `aracsurucusu` varchar(1000) NOT NULL,
  `eklenme` datetime NOT NULL,
  `plaka` varchar(60) NOT NULL,
  `aracKonum` varchar(300) NOT NULL,
  `aracParola` varchar(100) NOT NULL,
  `geciciarac` int(1) NOT NULL,
  `sondegisim` datetime NOT NULL,
  `soncamid` int(5) NOT NULL,
  `soncamgrupid` int(5) NOT NULL,
  `abonelikbaslangic` datetime NOT NULL,
  `abonelikbitis` datetime NOT NULL,
  `abonelikdurum` enum('a','p') NOT NULL,
  `barkod` varchar(15) default NULL,
  `tipID` int(4) NOT NULL default '1',
  `vale_arac` int(1) NOT NULL default '0',
  `odeme_durum` int(1) NOT NULL default '0',
  `abonelikTipi` int(1) NOT NULL default '0',
  `AbonelikSaat` int(3) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_araclar`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_araclar_temp`
-- 

CREATE TABLE `db_araclar_temp` (
  `id` int(9) NOT NULL auto_increment,
  `plaka` varchar(30) NOT NULL,
  `puan` int(9) NOT NULL,
  `confidence` int(9) NOT NULL,
  `resimyolu` varchar(1000) NOT NULL,
  `soncamid` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_araclar_temp`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_aractipleri`
-- 

CREATE TABLE `db_aractipleri` (
  `tipID` int(11) NOT NULL auto_increment,
  `tipAdi` varchar(155) default NULL,
  PRIMARY KEY  (`tipID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Tablo döküm verisi `db_aractipleri`
-- 

INSERT INTO `db_aractipleri` VALUES (1, 'Ücretli');
INSERT INTO `db_aractipleri` VALUES (2, 'Ücretsiz');
INSERT INTO `db_aractipleri` VALUES (3, 'VIP');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_ayarlar`
-- 

CREATE TABLE `db_ayarlar` (
  `id` int(11) NOT NULL auto_increment,
  `area1name` varchar(100) NOT NULL,
  `area2name` varchar(100) NOT NULL,
  `area3name` varchar(100) NOT NULL,
  `resimyolu` varchar(2000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_ayarlar`
-- 

INSERT INTO `db_ayarlar` VALUES (1, '', '', '', 'E://Resimler/');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_blacklist`
-- 

CREATE TABLE `db_blacklist` (
  `id` int(11) NOT NULL auto_increment,
  `aracid` varchar(100) NOT NULL,
  `sebep` varchar(10000) NOT NULL,
  `eklenme` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_blacklist`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_calisma_saatlari`
-- 

CREATE TABLE `db_calisma_saatlari` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime default NULL,
  `pointID` int(3) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_calisma_saatlari`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_camgrup`
-- 

CREATE TABLE `db_camgrup` (
  `id` int(5) NOT NULL auto_increment,
  `grupname` varchar(1000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_camgrup`
-- 

INSERT INTO `db_camgrup` VALUES (1, 'Otopark-1');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_cihazlar`
-- 

CREATE TABLE `db_cihazlar` (
  `id` int(11) NOT NULL auto_increment,
  `kamera_ID` varchar(1000) NOT NULL,
  `sistem_ID` varchar(1000) NOT NULL,
  `role_ID` varchar(1000) NOT NULL,
  `kapi_ID` varchar(1000) NOT NULL,
  `cihaz_Yon` varchar(1000) NOT NULL,
  `cihaz_Durum` varchar(1000) NOT NULL,
  `cikisizin` int(1) NOT NULL,
  `camgrup` int(5) NOT NULL,
  `izindurum` int(9) NOT NULL,
  `cihaztipi` int(3) NOT NULL default '0',
  `ipAdres` varchar(20) default NULL,
  `port` int(7) NOT NULL default '80',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_cihazlar`
-- 

INSERT INTO `db_cihazlar` VALUES (1, '1', 'sistem', '1', '10000001', 'c', 'a', 0, 1, 0, 3, '192.168.1.201', 80);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_fiyatlar`
-- 

CREATE TABLE `db_fiyatlar` (
  `id` int(60) NOT NULL auto_increment,
  `baslangic` bigint(100) NOT NULL,
  `bitis` bigint(100) NOT NULL,
  `ucret` float NOT NULL,
  `sistemli` varchar(100) NOT NULL COMMENT 'e=> ''syraly artyyor demek''',
  `cesit` varchar(100) NOT NULL COMMENT '0->birimzamanücretsiz, 1->birimzaman dakika 2->birim zaman gün',
  `tolerans` varchar(100) NOT NULL,
  `tipID` int(100) NOT NULL default '0',
  `birimzaman` enum('d','g') NOT NULL COMMENT 'd=>dakika, g=> Gün',
  `carpan` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Tablo döküm verisi `db_fiyatlar`
-- 

INSERT INTO `db_fiyatlar` VALUES (1, 0, 60, 2.5, 'h', '', '', 1, 'd', 0);
INSERT INTO `db_fiyatlar` VALUES (2, 60, 300, 6.5, 'h', '', '', 1, 'd', 0);
INSERT INTO `db_fiyatlar` VALUES (3, 300, 1445, 10.5, 'h', '', '', 1, 'd', 0);
INSERT INTO `db_fiyatlar` VALUES (4, 0, 1999999, 0, 'h', '', '', 2, 'd', 0);
INSERT INTO `db_fiyatlar` VALUES (5, 1440, 199999999, 10, 'e', '', '', 1, 'd', 57);
INSERT INTO `db_fiyatlar` VALUES (6, 0, 60, 10, 'h', '', '', 3, 'd', 0);
INSERT INTO `db_fiyatlar` VALUES (7, 60, 9999999, 1.5, 'e', '', '', 3, 'd', 0);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_global_ayarlar`
-- 

CREATE TABLE `db_global_ayarlar` (
  `id` int(11) NOT NULL auto_increment,
  `on_zaman` time NOT NULL,
  `son_zaman` time NOT NULL,
  `haftaici` int(11) NOT NULL,
  `haftasonu` int(11) NOT NULL,
  `otomisafir` int(1) NOT NULL,
  `ekleizin` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_global_ayarlar`
-- 

INSERT INTO `db_global_ayarlar` VALUES (1, '05:12:00', '23:59:59', 1, 2, 2, 3);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_kameralar`
-- 

CREATE TABLE `db_kameralar` (
  `id` int(11) NOT NULL auto_increment,
  `kamera_ID` varchar(1000) NOT NULL,
  `sistem_ID` varchar(1000) NOT NULL,
  `role_ID` varchar(1000) NOT NULL,
  `kapi_ID` varchar(1000) NOT NULL,
  `kamera_Yon` varchar(1000) NOT NULL,
  `kamera_Durum` varchar(1000) NOT NULL,
  `cikisizin` int(1) NOT NULL,
  `camgrup` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Tablo döküm verisi `db_kameralar`
-- 

INSERT INTO `db_kameralar` VALUES (7, '1', 'sistem', '1', '1', 'c', 'a', 1, 1);
INSERT INTO `db_kameralar` VALUES (8, '2', 'sistem', '2', '2', 'g', 'a', 1, 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_loglar`
-- 

CREATE TABLE `db_loglar` (
  `id` bigint(255) NOT NULL auto_increment,
  `plaka` varchar(100) NOT NULL,
  `kayittarihi` datetime NOT NULL,
  `kameraid` varchar(100) NOT NULL,
  `sebep` varchar(1000) NOT NULL,
  `resimyolu` varchar(1000) NOT NULL,
  `kullanici` varchar(1000) NOT NULL,
  `yerdurum` int(1) NOT NULL,
  `area1` varchar(1000) NOT NULL,
  `area2` varchar(1000) NOT NULL,
  `area3` varchar(1000) NOT NULL,
  `aracdurum` int(1) NOT NULL,
  `aracKonum` varchar(1000) NOT NULL,
  `soncamgrupid` int(10) NOT NULL,
  `ucretdurumu` enum('e','h') NOT NULL,
  `sistemid` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_loglar`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_musteriler`
-- 

CREATE TABLE `db_musteriler` (
  `id` int(3) unsigned NOT NULL auto_increment,
  `kAdi` varchar(128) NOT NULL default '',
  `kSoyadi` varchar(128) NOT NULL default '',
  `kEvTel` varchar(24) NOT NULL default '',
  `kCepTel` varchar(24) NOT NULL default '',
  `kMail` varchar(200) NOT NULL default '',
  `kSifre` varchar(32) NOT NULL,
  `kSonIP` varchar(64) NOT NULL default '',
  `kSonGiris` datetime NOT NULL default '0000-00-00 00:00:00',
  `kDurum` enum('a','p','s') NOT NULL default 'a' COMMENT 'a=>aktif, p=>pasif, s=>silindi',
  `kKullaniciTur` varchar(10) NOT NULL,
  `keklenmetarihi` datetime NOT NULL,
  `abonelikbaslangic` datetime NOT NULL,
  `abonelikbitis` datetime NOT NULL,
  `abonelikdurum` enum('a','p') NOT NULL,
  `maxarac` int(10) NOT NULL,
  `uyeindirim` float NOT NULL default '0',
  `kredi` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_musteriler`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_odemeler`
-- 

CREATE TABLE `db_odemeler` (
  `id` int(9) NOT NULL auto_increment,
  `kullaniciid` int(9) NOT NULL,
  `borc` float NOT NULL,
  `odenen` float NOT NULL,
  `tarihzaman` datetime NOT NULL,
  `status` int(4) NOT NULL default '0',
  `plaka` text,
  `abonesure` int(6) NOT NULL default '0',
  `operatorid` int(5) NOT NULL default '1',
  `dosyaadi` text,
  `pointID` int(3) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_odemeler`
-- 

INSERT INTO `db_odemeler` VALUES (1, 0, 2, 2, '2017-09-26 16:17:33', 1, '34TY3462', 0, 20, NULL, 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_sistemler`
-- 

CREATE TABLE `db_sistemler` (
  `id` int(11) NOT NULL auto_increment,
  `sistemadi` varchar(1000) NOT NULL,
  `parola` varchar(1000) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- 
-- Tablo döküm verisi `db_sistemler`
-- 

INSERT INTO `db_sistemler` VALUES (17, 'sistem', '123123', 'E:\\Resimler\\');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_siteayar`
-- 

CREATE TABLE `db_siteayar` (
  `id` int(1) NOT NULL auto_increment,
  `baslik` varchar(1000) NOT NULL,
  `footer` varchar(1000) NOT NULL,
  `header` varchar(1000) NOT NULL,
  `headerimg` varchar(1000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Tablo döküm verisi `db_siteayar`
-- 

INSERT INTO `db_siteayar` VALUES (1, 'MASTERPTS OTOPARK SISTEMI', 'Copyright MASTERPTS', 'MASTERPTS OTOPARK', 'images/watermak.gif');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_super_users`
-- 

CREATE TABLE `db_super_users` (
  `id` int(11) NOT NULL auto_increment,
  `ad` varchar(100) NOT NULL,
  `soyad` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `yetki` int(2) NOT NULL,
  `eklenme` datetime NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `songiris` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- 
-- Tablo döküm verisi `db_super_users`
-- 

INSERT INTO `db_super_users` VALUES (16, 'Site', 'Yonetici', 'yonetici@localhost.com', 1, '2013-06-28 12:56:29', 'yonetici', '123123', '2017-09-26 16:08:40');
INSERT INTO `db_super_users` VALUES (17, 'site', 'Admin', 'admin@localhost.com', 2, '2013-06-28 12:56:29', 'admin', '123123', '2017-09-26 16:16:18');
INSERT INTO `db_super_users` VALUES (20, 'Gorevli1', 'Gorevli', '', 4, '2014-06-18 18:31:36', 'gorevli1', '1', '2015-07-23 19:29:41');
INSERT INTO `db_super_users` VALUES (21, 'Gorevli2', 'Gorevli', '', 4, '2015-02-04 12:34:21', 'gorevli2', '2', '2015-07-18 06:57:37');
INSERT INTO `db_super_users` VALUES (23, 'Gorevli3', 'Gorevli', '', 4, '2015-02-04 12:34:57', 'gorevli3', '3', '2015-09-07 15:31:59');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `db_yonetimlog`
-- 

CREATE TABLE `db_yonetimlog` (
  `id` bigint(30) NOT NULL auto_increment,
  `olay` varchar(500) NOT NULL,
  `eklenme` datetime NOT NULL,
  `kullanici` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Tablo döküm verisi `db_yonetimlog`
-- 

