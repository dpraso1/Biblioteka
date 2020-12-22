-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2020 at 08:50 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteka`
--
CREATE DATABASE IF NOT EXISTS `biblioteka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteka`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `izdaj_knjigu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `izdaj_knjigu` (IN `id_knjige1` INT, IN `id_clana1` INT, IN `id_radnika1` INT, IN `datum_izdavanja1` DATE)  BEGIN 
declare ukupna_kolicina1 int default 0;
set ukupna_kolicina1 = (select ukupna_kolicina from knjige where id_knjige=id_knjige1 );

    insert into izdavanje( datum_iznajmljivanja, id_knjige, id_clana, id_radnika) 
    values ( datum_izdavanja1, id_knjige1, id_clana1, id_radnika1) ;
    
    update knjige 
    set ukupna_kolicina=(ukupna_kolicina1-1)
    where id_knjige = id_knjige1;

END$$

DROP PROCEDURE IF EXISTS `vrati_knjigu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vrati_knjigu` (IN `naziv_knjige1` VARCHAR(40), IN `id_clana1` INT, IN `datum_vracanja1` DATE, IN `datum_izdavanja1` DATE)  BEGIN 
declare ukupna_kolicina1 int  default 0;
declare id_knjige1 int  default 0;
set id_knjige1 = (select id_knjige from knjige where naziv_knjige = naziv_knjige1);
set ukupna_kolicina1 = (select ukupna_kolicina from knjige where id_knjige = id_knjige1);

update knjige
set ukupna_kolicina=(ukupna_kolicina1 + 1)
where id_knjige=id_knjige1;

update izdavanje
set datum_vracanja = datum_vracanja1
where id_knjige = id_knjige1 and id_clana = id_clana1 and datum_iznajmljivanja = datum_izdavanja1;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `autor_knjige`
--

DROP TABLE IF EXISTS `autor_knjige`;
CREATE TABLE IF NOT EXISTS `autor_knjige` (
  `id` int(11) NOT NULL,
  `ime_i_prezime_autora` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `autor_knjige`
--

INSERT INTO `autor_knjige` (`id`, `ime_i_prezime_autora`) VALUES
(1, 'Agatha Christie'),
(2, 'Branislav Nušić'),
(3, 'Branko Ćopić'),
(4, 'William Styron'),
(5, 'Meša Selimović'),
(6, 'Elif Shafak'),
(7, 'J.K.Rowling'),
(8, 'Kevin Kvan'),
(9, 'Victor Hugo'),
(10, 'Nagib Mahfouz'),
(11, 'Margaret Mitchell'),
(12, 'Thomas Harris'),
(13, 'Orhan Pamuk'),
(14, 'Paula Hawking'),
(15, 'Nikolas Sparks'),
(16, 'Jelena Bačić Alimpić'),
(17, 'Jane Austin'),
(18, 'Gillian Flynn'),
(19, 'Lav Tolstoy'),
(20, 'Antoine de Saint Exupery'),
(21, 'Isak Samokovlija'),
(22, 'Skender Kulenović'),
(23, 'Stephen King'),
(24, 'Dan Brown'),
(25, 'Fyodor Dostoevsky'),
(26, 'J.J.R Tolkien'),
(27, 'Dante Alighieri'),
(28, 'William Shakespeare'),
(29, 'Aleksandr Pushkin'),
(30, 'Emile Zola');

-- --------------------------------------------------------

--
-- Table structure for table `clanovi`
--

DROP TABLE IF EXISTS `clanovi`;
CREATE TABLE IF NOT EXISTS `clanovi` (
  `id_clana` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(15) CHARACTER SET utf8 NOT NULL,
  `prezime` varchar(20) CHARACTER SET utf8 NOT NULL,
  `grad` int(11) NOT NULL,
  `postanski_broj` int(5) NOT NULL,
  `adresa_stanovanja` varchar(30) CHARACTER SET utf8 NOT NULL,
  `telefonski_broj` int(20) NOT NULL,
  PRIMARY KEY (`id_clana`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clanovi`
--

INSERT INTO `clanovi` (`id_clana`, `ime`, `prezime`, `grad`, `postanski_broj`, `adresa_stanovanja`, `telefonski_broj`) VALUES
(1, 'Meho', 'Mehić', 1, 71000, 'Olimpijska 20', 61342165),
(2, 'Mirnesa', 'Nuhović', 1, 71000, 'Kralja Tvrtka 4', 62454845),
(3, 'Emina', 'Efendić', 1, 71000, 'Kolodvorska 5', 63458124),
(4, 'Meho', 'Mehović', 4, 88000, 'Zagrebačka 18', 61526372),
(5, 'Mersad', 'Homo', 4, 88000, 'Zagrebačka 9', 62567487),
(6, 'Ema', 'Medonjić', 3, 78000, '12 beba', 63567876),
(7, 'Mirnes', 'Mirvić', 5, 75000, 'Kalinska', 64154245),
(8, 'Mirnesa', 'Mivić', 5, 75000, 'Kalinska', 64152345),
(9, 'Nermina', 'Silajdžić', 1, 71000, 'Trg Barcelone 6', 61736467),
(10, 'Dženana', 'Lovrić', 1, 71000, 'Valtera Perića 8', 61767876),
(11, 'Tea', 'Draganović', 4, 88000, 'Kralja Tvrtka 24', 645675876),
(12, 'Eman', 'Srna', 3, 78000, 'Ulica hehe', 647367876),
(13, 'Dženan', 'Pindžo', 1, 71000, 'Kralja Tomislava 5', 62456873),
(14, 'Srđan', 'Manorić', 3, 78000, '12 Beba', 655678765),
(15, 'Esma', 'Pivić', 2, 72270, 'Neka ulica', 63567654),
(16, 'Emira', 'Čavić', 1, 71000, 'Valtera Perića 9', 61245367),
(17, 'Neira', 'Samja', 1, 71000, 'Moj Dom', 61789675),
(18, 'Nejra', 'Pivić', 6, 70101, 'Ulica Jajca 34', 657898765),
(19, 'Larisa', 'Pirilić', 1, 71000, 'Ulica BiH 2', 61875696),
(20, 'Amina', 'Prezimenović', 2, 72270, 'Ulica Karlovačka br. 1', 61767923),
(21, 'Saira', 'Džego', 1, 71000, 'Kralja Tvrtka 6', 61562836),
(22, 'Amra', 'Krdžalić', 3, 78000, 'Ulica u BL 7', 65278987),
(23, 'Amira', 'Medžić', 6, 70101, 'Ulica Jajca 12', 61524536),
(24, 'Ensad', 'Mirvić', 2, 72270, 'Ulica u Tuzli', 64567987),
(25, 'Dajana', 'Delahmet', 1, 71000, 'Mulamustafe Bešeskije 8', 61278938),
(26, 'Nermin', 'Gidić', 7, 78400, 'Nek ima i Gradiška', 61543654),
(27, 'Sanela', 'Džinić', 1, 71000, 'Mulamustafe Bašeskije 5', 61762537),
(28, 'Amila', 'Tirić', 1, 71000, 'Grbavička 7', 62567845),
(29, 'Engin', 'Čavić', 2, 72270, 'Ulica u Tuzli 8', 61765434),
(30, 'Ajla', 'Pitić', 1, 71000, 'Valtera Perića 8', 63567654);

-- --------------------------------------------------------

--
-- Stand-in structure for view `djecija_literatura`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `djecija_literatura`;
CREATE TABLE IF NOT EXISTS `djecija_literatura` (
`id_knjige` int(11)
,`naziv_knjige` varchar(30)
,`autor` int(11)
,`ukupna_kolicina` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `grad`
--

DROP TABLE IF EXISTS `grad`;
CREATE TABLE IF NOT EXISTS `grad` (
  `id` int(11) NOT NULL,
  `ime_grada` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grad`
--

INSERT INTO `grad` (`id`, `ime_grada`) VALUES
(1, 'Sarajevo'),
(2, 'Tuzla'),
(3, 'Banja Luka'),
(4, 'Mostar'),
(5, 'Travnik'),
(6, 'Jajce'),
(7, 'Gradiška');

-- --------------------------------------------------------

--
-- Table structure for table `izdavanje`
--

DROP TABLE IF EXISTS `izdavanje`;
CREATE TABLE IF NOT EXISTS `izdavanje` (
  `id_izdavanja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datum_iznajmljivanja` date NOT NULL,
  `datum_vracanja` date DEFAULT NULL,
  `id_knjige` int(11) NOT NULL,
  `id_clana` int(11) NOT NULL,
  `id_radnika` int(11) NOT NULL,
  PRIMARY KEY (`id_izdavanja`),
  KEY `id_knjige` (`id_knjige`),
  KEY `id_clana` (`id_clana`),
  KEY `id_radnika` (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `izdavanje`
--

INSERT INTO `izdavanje` (`id_izdavanja`, `datum_iznajmljivanja`, `datum_vracanja`, `id_knjige`, `id_clana`, `id_radnika`) VALUES
(1, '2020-11-01', '2020-11-05', 16, 1, 2),
(2, '2020-11-01', '2020-11-06', 39, 2, 2),
(3, '2020-11-01', '2020-11-06', 17, 3, 2),
(4, '2020-11-02', '2020-11-06', 29, 4, 5),
(5, '2020-11-02', '2020-11-06', 36, 4, 5),
(6, '2020-11-03', '2020-11-07', 26, 5, 8),
(7, '2020-11-04', '2020-11-08', 19, 6, 5),
(8, '2020-11-05', NULL, 7, 7, 2),
(9, '2020-11-05', NULL, 2, 7, 2),
(10, '2020-11-05', NULL, 11, 8, 8),
(11, '2020-11-05', NULL, 17, 8, 8),
(12, '2020-11-06', NULL, 37, 9, 5),
(26, '2020-11-09', NULL, 34, 16, 5),
(27, '2020-11-10', NULL, 40, 17, 2),
(28, '2020-11-10', NULL, 24, 17, 2),
(16, '2020-11-07', NULL, 23, 11, 8),
(17, '2020-11-07', NULL, 35, 12, 8),
(18, '2020-11-07', NULL, 23, 12, 8),
(19, '2020-11-07', NULL, 5, 13, 10),
(20, '2020-11-07', NULL, 30, 13, 10),
(21, '2020-11-09', NULL, 27, 13, 5),
(22, '2020-11-09', NULL, 9, 14, 5),
(23, '2020-11-09', NULL, 21, 15, 5),
(24, '2020-11-09', NULL, 33, 15, 5),
(25, '2020-11-09', NULL, 38, 16, 5),
(29, '2020-11-10', NULL, 26, 19, 2),
(30, '2020-11-10', NULL, 18, 20, 10),
(31, '2020-11-10', NULL, 20, 21, 10),
(32, '2020-11-10', NULL, 14, 25, 2),
(33, '2020-11-10', NULL, 13, 25, 2),
(34, '2020-11-11', NULL, 15, 24, 5),
(35, '2020-11-11', NULL, 33, 23, 5),
(36, '2020-11-11', NULL, 38, 22, 5),
(37, '2020-11-11', NULL, 39, 21, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `izdavanje_info`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `izdavanje_info`;
CREATE TABLE IF NOT EXISTS `izdavanje_info` (
`Naziv_knjige` varchar(30)
,`autor` int(11)
,`broj_knjiga` int(11)
,`datum_iznajmljivanja` date
,`datum_vracanja` date
,`id_clana` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `jezik_knjige`
--

DROP TABLE IF EXISTS `jezik_knjige`;
CREATE TABLE IF NOT EXISTS `jezik_knjige` (
  `id` int(11) NOT NULL,
  `jezik` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jezik_knjige`
--

INSERT INTO `jezik_knjige` (`id`, `jezik`) VALUES
(1, 'Engleski'),
(2, 'Srpski'),
(3, 'Bosanski'),
(4, 'Francuski'),
(5, 'Arapski'),
(6, 'Turski'),
(7, 'Ruski'),
(8, 'Italijanski');

-- --------------------------------------------------------

--
-- Table structure for table `knjige`
--

DROP TABLE IF EXISTS `knjige`;
CREATE TABLE IF NOT EXISTS `knjige` (
  `id_knjige` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_knjige` varchar(30) CHARACTER SET utf8 NOT NULL,
  `autor` int(11) NOT NULL,
  `godina_izdanja` int(11) NOT NULL,
  `zanr` int(11) NOT NULL,
  `jezik` int(11) NOT NULL,
  `ukupna_kolicina` int(11) NOT NULL,
  `broj_zaduzenih` int(11) DEFAULT NULL,
  `broj_citaone` int(11) NOT NULL,
  `broj_police` int(11) NOT NULL,
  PRIMARY KEY (`id_knjige`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `knjige`
--

INSERT INTO `knjige` (`id_knjige`, `naziv_knjige`, `autor`, `godina_izdanja`, `zanr`, `jezik`, `ukupna_kolicina`, `broj_zaduzenih`, `broj_citaone`, `broj_police`) VALUES
(1, 'Ubistvo u \"Orient Expressu', 1, 1966, 1, 1, 100, 3, 1, 1),
(2, 'Ožalošćena porodica', 2, 1934, 2, 2, 50, 1, 2, 2),
(3, 'Ježeva kućica', 3, 1949, 3, 2, 200, 2, 3, 3),
(4, 'Sofijin izbor', 4, 1979, 4, 1, 100, 2, 1, 4),
(5, 'Derviš i smrt', 5, 1966, 5, 3, 200, 2, 2, 5),
(6, 'Četrdeset pravila ljubavi', 6, 2009, 5, 1, 100, 1, 2, 5),
(7, 'Harry Potter (paket)', 7, 1997, 3, 1, 100, 1, 3, 3),
(8, 'Suludo bogati Azijci', 8, 2019, 2, 1, 80, 1, 2, 2),
(9, 'Zvonar crkve Notre-Dame', 9, 1831, 4, 4, 75, 3, 1, 4),
(10, 'Razgovori na Nilu', 10, 1966, 6, 5, 30, 3, 1, 6),
(11, 'Tvrđava', 5, 1970, 6, 3, 120, 1, 1, 6),
(12, 'Prohujalo sa vihorom', 11, 1936, 7, 1, 95, 2, 2, 7),
(13, 'Kad jaganjci utihnu', 12, 1988, 8, 1, 100, 2, 1, 8),
(14, 'Snijeg', 13, 2002, 5, 6, 120, 1, 2, 5),
(15, 'Djevojka u vozu', 14, 2015, 8, 1, 65, 2, 1, 8),
(16, 'Bilježnica', 15, 1996, 7, 1, 120, 2, 2, 7),
(17, 'Ringišpil', 16, 2010, 7, 2, 65, 3, 2, 7),
(18, 'Razum i osjećajiu', 17, 1811, 7, 1, 95, 2, 2, 7),
(19, 'Nestala', 18, 2012, 8, 1, 100, 1, 1, 8),
(20, 'Ana Karenjina', 19, 1877, 5, 8, 150, 3, 2, 5),
(21, 'Mali Princ', 20, 1943, 3, 4, 300, 3, 3, 3),
(22, 'Nosač Samuel', 21, 1946, 3, 3, 300, 3, 3, 3),
(23, 'Gromovo đule', 22, 1975, 3, 3, 250, 1, 3, 3),
(24, 'Zelena milja', 23, 1996, 9, 1, 40, 1, 4, 9),
(25, 'Keri', 23, 1974, 9, 1, 50, 2, 4, 9),
(26, 'Isijavanje', 23, 1977, 9, 1, 90, 1, 4, 9),
(27, 'Crveni zmaj', 12, 1981, 8, 1, 20, 2, 1, 8),
(28, 'Hanibal', 12, 1999, 8, 1, 7, 2, 1, 8),
(29, 'Da Vinčijev Kod', 24, 2003, 10, 1, 60, 1, 4, 10),
(30, 'Anđeli i demoni', 24, 2000, 10, 1, 60, 1, 4, 10),
(31, 'Inferno', 24, 2013, 10, 1, 62, 1, 4, 10),
(32, 'Zločin i kazna', 25, 1866, 6, 8, 100, 1, 5, 6),
(33, 'Braća Karmazovi', 25, 1880, 11, 8, 80, 2, 5, 11),
(34, 'Idiot', 25, 1868, 11, 8, 70, 1, 5, 11),
(35, 'Gospodar prstenova', 26, 1954, 12, 1, 40, 2, 6, 12),
(36, 'Božanstvena komedija', 27, 1320, 13, 7, 90, 1, 5, 13),
(37, 'Hamlet', 28, 1601, 14, 1, 77, 1, 5, 14),
(38, 'Jadnici', 9, 1862, 14, 4, 67, 1, 5, 14),
(39, 'Evgenij Onjegin', 29, 1833, 15, 8, 99, 1, 5, 15),
(40, 'Germinal', 30, 1885, 15, 4, 110, 2, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `kvalifikacije_radnika`
--

DROP TABLE IF EXISTS `kvalifikacije_radnika`;
CREATE TABLE IF NOT EXISTS `kvalifikacije_radnika` (
  `id_radnika` int(11) NOT NULL,
  `id_kvalifikacije_radnika` int(11) NOT NULL,
  `strucna_sprema` int(11) NOT NULL,
  `poznavanje_stranog_jezika` int(11) NOT NULL,
  `poznavanje_rada_na_računaru` int(11) NOT NULL,
  PRIMARY KEY (`id_kvalifikacije_radnika`),
  KEY `id_radnika` (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `kvalifikacije_radnika`
--

INSERT INTO `kvalifikacije_radnika` (`id_radnika`, `id_kvalifikacije_radnika`, `strucna_sprema`, `poznavanje_stranog_jezika`, `poznavanje_rada_na_računaru`) VALUES
(10, 1, 2, 5, 1),
(2, 2, 1, 6, 1),
(7, 3, 2, 4, 1),
(1, 4, 3, 1, 2),
(9, 5, 1, 6, 1),
(8, 6, 1, 8, 1),
(4, 7, 4, 6, 2),
(6, 8, 1, 2, 1),
(5, 9, 2, 3, 1),
(3, 10, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posao_radnika`
--

DROP TABLE IF EXISTS `posao_radnika`;
CREATE TABLE IF NOT EXISTS `posao_radnika` (
  `id` int(11) NOT NULL,
  `posao_koji_obavlja` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posao_radnika`
--

INSERT INTO `posao_radnika` (`id`, `posao_koji_obavlja`) VALUES
(1, '\'bibliotekar/ka\''),
(2, '\'sekretar/ka\''),
(3, '\'higijenicar/ka\'');

-- --------------------------------------------------------

--
-- Table structure for table `poznavanje_rada_na_racunaru`
--

DROP TABLE IF EXISTS `poznavanje_rada_na_racunaru`;
CREATE TABLE IF NOT EXISTS `poznavanje_rada_na_racunaru` (
  `id` int(11) NOT NULL,
  `poznavanje_rada_na_racunaru` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poznavanje_rada_na_racunaru`
--

INSERT INTO `poznavanje_rada_na_racunaru` (`id`, `poznavanje_rada_na_racunaru`) VALUES
(1, '\'da\''),
(2, '\'ne\'');

-- --------------------------------------------------------

--
-- Table structure for table `poznavanje_stranog_jezika`
--

DROP TABLE IF EXISTS `poznavanje_stranog_jezika`;
CREATE TABLE IF NOT EXISTS `poznavanje_stranog_jezika` (
  `id` int(11) NOT NULL,
  `poznavanje_stranog_jezika` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poznavanje_stranog_jezika`
--

INSERT INTO `poznavanje_stranog_jezika` (`id`, `poznavanje_stranog_jezika`) VALUES
(1, 'engleski'),
(2, 'njemacki'),
(3, 'turski'),
(4, 'francuski'),
(5, 'svedski'),
(6, 'engleski i njemacki'),
(7, 'engleski i turski'),
(8, 'engleski i francuski'),
(9, 'engleski i svedski');

-- --------------------------------------------------------

--
-- Table structure for table `radnici`
--

DROP TABLE IF EXISTS `radnici`;
CREATE TABLE IF NOT EXISTS `radnici` (
  `id_radnika` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `spol` int(11) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `datum_zaposlenja` date NOT NULL,
  `posao_koji_obavlja` int(11) NOT NULL,
  `email_adresa` varchar(30) NOT NULL,
  `broj_telefona` int(11) NOT NULL,
  PRIMARY KEY (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `radnici`
--

INSERT INTO `radnici` (`id_radnika`, `ime`, `prezime`, `spol`, `datum_rodjenja`, `datum_zaposlenja`, `posao_koji_obavlja`, `email_adresa`, `broj_telefona`) VALUES
(1, 'Maja', 'Sekretarović', 2, '1987-03-25', '2019-07-20', 2, 'amila.sekretarovic@gmail.com', 62546378),
(2, 'Mahir', 'Knjiga', 1, '1985-09-12', '2018-05-05', 1, 'knjiga_mahir@hotmail.com', 65382901),
(3, 'Samir', 'Samirović', 1, '1990-12-09', '2019-12-12', 2, 'samir.ovic@gmail.com', 63819767),
(4, 'Ajsel', 'Ajselović', 2, '1989-05-22', '2018-03-03', 3, 'ajsel.ovic@gmail.com', 64928376),
(5, 'Emina', 'Eminović', 2, '1990-07-06', '2018-10-10', 1, 'eminovic89@hotmail.com', 62198735),
(6, 'Dajana', 'Dajić', 2, '1977-03-12', '2013-04-10', 2, 'dajana.dajic@gmail.com', 603101922),
(7, 'Danijel', 'Danijelović', 1, '1985-09-23', '2015-05-14', 3, 'danijel.dani@hotmail.com', 64938762),
(8, 'Naida', 'Emić', 2, '1989-08-20', '2017-07-10', 1, 'emic_naida@gmail.com', 61029874),
(9, 'Faris', 'Farić', 1, '1980-03-03', '2014-05-20', 2, 'faris.faric@gmail.com', 64738294),
(10, 'Nejra', 'Nejrić', 2, '1976-07-19', '2010-05-06', 1, 'nejric76@hotmail.com', 61928765);

-- --------------------------------------------------------

--
-- Stand-in structure for view `radnici_info`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `radnici_info`;
CREATE TABLE IF NOT EXISTS `radnici_info` (
`id_radnika` int(11)
,`prezime` varchar(20)
,`ime` varchar(20)
,`posao_koji_obavlja` int(11)
,`radni_dan` int(11)
,`pocetak_radnog_vremena` time
,`kraj_radnog_vremena` time
);

-- --------------------------------------------------------

--
-- Table structure for table `radni_dan`
--

DROP TABLE IF EXISTS `radni_dan`;
CREATE TABLE IF NOT EXISTS `radni_dan` (
  `id` int(11) NOT NULL,
  `radni_dan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `radni_dan`
--

INSERT INTO `radni_dan` (`id`, `radni_dan`) VALUES
(1, 'ponedjeljak, srijeda, petak'),
(2, 'utorak, cetvrtak, subota');

-- --------------------------------------------------------

--
-- Table structure for table `radno_vrijeme_radnika`
--

DROP TABLE IF EXISTS `radno_vrijeme_radnika`;
CREATE TABLE IF NOT EXISTS `radno_vrijeme_radnika` (
  `id_radno_vrijeme_radnika` int(11) NOT NULL,
  `radni_dan` int(11) NOT NULL,
  `pocetak_radnog_vremena` time NOT NULL,
  `kraj_radnog_vremena` time NOT NULL,
  `id_radnika` int(11) NOT NULL,
  PRIMARY KEY (`id_radno_vrijeme_radnika`),
  KEY `id_radnika` (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `radno_vrijeme_radnika`
--

INSERT INTO `radno_vrijeme_radnika` (`id_radno_vrijeme_radnika`, `radni_dan`, `pocetak_radnog_vremena`, `kraj_radnog_vremena`, `id_radnika`) VALUES
(1, 1, '08:00:00', '16:00:00', 4),
(2, 2, '08:00:00', '16:00:00', 10),
(3, 1, '08:00:00', '16:00:00', 6),
(4, 2, '16:00:00', '18:00:00', 3),
(5, 1, '08:00:00', '16:00:00', 5),
(6, 2, '08:00:00', '16:00:00', 2),
(7, 1, '16:00:00', '18:00:00', 1),
(8, 2, '08:00:00', '16:00:00', 9),
(9, 1, '08:00:00', '16:00:00', 7),
(10, 2, '08:00:00', '16:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `spol`
--

DROP TABLE IF EXISTS `spol`;
CREATE TABLE IF NOT EXISTS `spol` (
  `id` int(11) NOT NULL,
  `spol` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spol`
--

INSERT INTO `spol` (`id`, `spol`) VALUES
(1, 'musko'),
(2, 'zensko');

-- --------------------------------------------------------

--
-- Table structure for table `strucna_sprema_radnika`
--

DROP TABLE IF EXISTS `strucna_sprema_radnika`;
CREATE TABLE IF NOT EXISTS `strucna_sprema_radnika` (
  `id` int(11) NOT NULL,
  `strucna_sprema` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `strucna_sprema_radnika`
--

INSERT INTO `strucna_sprema_radnika` (`id`, `strucna_sprema`) VALUES
(1, 'visoka strucna sprema'),
(2, 'visa skolska sprema'),
(3, 'srednja strucna sprema'),
(4, 'nekvalifikovani radnik');

-- --------------------------------------------------------

--
-- Table structure for table `zanr_knjige`
--

DROP TABLE IF EXISTS `zanr_knjige`;
CREATE TABLE IF NOT EXISTS `zanr_knjige` (
  `id` int(11) NOT NULL,
  `zanr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zanr_knjige`
--

INSERT INTO `zanr_knjige` (`id`, `zanr`) VALUES
(1, 'Kriminalistički'),
(2, 'Komedija'),
(3, 'Dječija literatura'),
(4, 'Drama'),
(5, 'Novela'),
(6, 'Psihološki'),
(7, 'Romansa'),
(8, 'Triler'),
(9, 'Horor'),
(10, 'Misterija'),
(11, 'Filozofski roman'),
(12, 'Fantastika'),
(13, 'Poezija'),
(14, 'Tragedija'),
(15, 'Roman');

-- --------------------------------------------------------

--
-- Structure for view `djecija_literatura`
--
DROP TABLE IF EXISTS `djecija_literatura`;

DROP VIEW IF EXISTS `djecija_literatura`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `djecija_literatura`  AS  select `knjige`.`id_knjige` AS `id_knjige`,`knjige`.`naziv_knjige` AS `naziv_knjige`,`knjige`.`autor` AS `autor`,`knjige`.`ukupna_kolicina` AS `ukupna_kolicina` from `knjige` where (`knjige`.`zanr` = 'Dječija literatura') ;

-- --------------------------------------------------------

--
-- Structure for view `izdavanje_info`
--
DROP TABLE IF EXISTS `izdavanje_info`;

DROP VIEW IF EXISTS `izdavanje_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `izdavanje_info`  AS  select `k`.`naziv_knjige` AS `Naziv_knjige`,`k`.`autor` AS `autor`,`k`.`ukupna_kolicina` AS `broj_knjiga`,`i`.`datum_iznajmljivanja` AS `datum_iznajmljivanja`,`i`.`datum_vracanja` AS `datum_vracanja`,`c`.`id_clana` AS `id_clana` from ((`izdavanje` `i` join `knjige` `k` on((`i`.`id_knjige` = `k`.`id_knjige`))) join `clanovi` `c` on((`i`.`id_clana` = `c`.`id_clana`))) ;

-- --------------------------------------------------------

--
-- Structure for view `radnici_info`
--
DROP TABLE IF EXISTS `radnici_info`;

DROP VIEW IF EXISTS `radnici_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `radnici_info`  AS  select `r1`.`id_radnika` AS `id_radnika`,`r1`.`prezime` AS `prezime`,`r1`.`ime` AS `ime`,`r1`.`posao_koji_obavlja` AS `posao_koji_obavlja`,`r2`.`radni_dan` AS `radni_dan`,`r2`.`pocetak_radnog_vremena` AS `pocetak_radnog_vremena`,`r2`.`kraj_radnog_vremena` AS `kraj_radnog_vremena` from (`radnici` `r1` join `radno_vrijeme_radnika` `r2` on((`r1`.`id_radnika` = `r2`.`id_radnika`))) order by `r1`.`prezime` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
