-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 08, 2020 at 04:24 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

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

-- --------------------------------------------------------

--
-- Table structure for table `izdavanje`
--

DROP TABLE IF EXISTS `izdavanje`;
CREATE TABLE IF NOT EXISTS `izdavanje` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datum_iznajmljivanja` date NOT NULL,
  `datum_vracanja` date DEFAULT NULL,
  `id_knjige` int(11) NOT NULL,
  `id_clana` int(11) NOT NULL,
  `id_radnika` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `izdavanje`
--

INSERT INTO `izdavanje` (`id`, `datum_iznajmljivanja`, `datum_vracanja`, `id_knjige`, `id_clana`, `id_radnika`) VALUES
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
-- Table structure for table `knjige`
--

DROP TABLE IF EXISTS `knjige`;
CREATE TABLE IF NOT EXISTS `knjige` (
  `ID_Knjige` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv_Knjige` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Ime_Prezime_Pisac` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Godina_Izdanja` int(11) NOT NULL,
  `Žanr` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Jezik` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Ukupna_Količina` int(11) NOT NULL,
  `Broj_Zaduženih` int(11) DEFAULT NULL,
  `Broj_Čitaone` int(11) NOT NULL,
  `Broj_Police` int(11) NOT NULL,
  PRIMARY KEY (`ID_Knjige`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `knjige`
--

INSERT INTO `knjige` (`ID_Knjige`, `Naziv_Knjige`, `Ime_Prezime_Pisac`, `Godina_Izdanja`, `Žanr`, `Jezik`, `Ukupna_Količina`, `Broj_Zaduženih`, `Broj_Čitaone`, `Broj_Police`) VALUES
(1, 'Ubistvo u \"Orient Expressu', 'Agatha Christie', 1966, 'Kriminalistički', 'Engleski', 100, NULL, 1, 1),
(2, 'Ožalošćena porodica', 'Branislav Nušić', 1934, 'Komedija', 'Srpski', 50, 1, 2, 2),
(3, 'Ježeva kućica', 'Branko Ćopić', 1949, 'Dječija literetura', 'Srpski', 200, NULL, 3, 3),
(4, 'Sofijin izbor', 'William Styron', 1979, 'Drama', 'Engleski', 100, NULL, 1, 4),
(5, 'Derviš i smrt', 'Meša Selimović', 1966, 'Novela', 'Bosanski', 200, 1, 2, 5),
(6, 'Četrdeset pravila ljubavi', 'Elif Shafak', 2009, 'Novela', 'Engleski', 100, NULL, 2, 5),
(7, 'Harry Potter (paket)', 'J.K.Rowling', 1997, 'Dječija literetura', 'Engleski', 100, 1, 3, 3),
(8, 'Suludo bogati Azijci', 'Kevin Kvan', 2019, 'Komedija', 'Engleski', 80, NULL, 2, 2),
(9, 'Zvonar crkve Notre-Dame', 'Victor Hugo', 1831, 'Drama', 'Francuski', 75, 1, 1, 4),
(10, 'Razgovori na Nilu', 'Nagib Mahfouz', 1966, 'Psihološki', 'Arapski', 30, NULL, 1, 6),
(11, 'Tvrđava', 'Meša Selimović', 1970, 'Psihološki ', 'Bosanski', 120, 1, 1, 6),
(12, 'Prohujalo sa vihorom', 'Margaret Mitchell', 1936, 'Romansa', 'Engleski', 95, NULL, 2, 7),
(13, 'Kad jaganjci utihnu', 'Thomas Harris', 1988, 'Triler', 'Engleski', 100, 1, 1, 8),
(14, 'Snijeg', 'Orhan Pamuk', 2002, 'Novela', 'Turski', 120, 1, 2, 5),
(15, 'Djevojka u vozu', 'Paula Hawking', 2015, 'Triler', 'Engleski', 65, 1, 1, 8),
(16, 'Bilježnica', 'Nikolas Sparks', 1996, 'Romansa', 'Engleski', 120, 1, 2, 7),
(17, 'Ringišpil', 'Jelena Bačić Alimpić', 2010, 'Romansa', 'Srpski', 65, 2, 2, 7),
(18, 'Razum i osjećajiu', 'Jane Austin', 1811, 'Romansa', 'Engleski', 95, 1, 2, 7),
(19, 'Nestala', 'Gillian Flynn', 2012, 'Triler', 'Engleski', 100, 1, 1, 8),
(20, 'Ana Karenjina', 'Lav Tolstoy', 1877, 'Novela', 'Ruski', 150, 1, 2, 5),
(21, 'Mali Princ', 'Antoine de Saint Exupery', 1943, 'Dječija literetura', 'Francuski', 300, 1, 3, 3),
(22, 'Nosač Samuel', 'Isak Samokovlija', 1946, 'Dječija literetura', 'Bosanski', 300, NULL, 3, 3),
(23, 'Gromovo đule', 'Skender Kulenović', 1975, 'Dječija literetura', 'Bosanski', 250, 2, 3, 3),
(24, 'Zelena milja', 'Stephen King', 1996, 'Horor', 'Engleski', 40, 1, 4, 9),
(25, 'Keri', 'Stephen King', 1974, 'Horor', 'Engleski', 50, NULL, 4, 9),
(26, 'Isijavanje', 'Stephen King', 1977, 'Horor', 'Engleski', 90, 2, 4, 9),
(27, 'Crveni zmaj', 'Thomas Harris', 1981, 'Triler', 'Engleski', 20, 1, 1, 8),
(28, 'Hanibal', 'Thomas Harris', 1999, 'Triler', 'Engleski', 10, NULL, 1, 8),
(29, 'Da Vinčijev Kod', 'Dan Brown', 2003, 'Misterija', 'Engleski', 60, 1, 4, 10),
(30, 'Anđeli i demoni', 'Dan Brown', 2000, 'Misterija', 'Engleski', 60, 1, 4, 10),
(31, 'Inferno', 'Dan Brown', 2013, 'Misterija', 'Engleski', 62, NULL, 4, 10),
(32, 'Zločin i kazna', 'Fyodor Dostoevsky', 1866, 'Psihološki', 'Ruski', 100, NULL, 5, 6),
(33, 'Braća Karmazovi', 'Fyodor Dostoevsky', 1880, 'Filozofski roman', 'Ruski', 80, 2, 5, 11),
(34, 'Idiot', 'Fyodor Dostoevsky', 1868, 'Filozofski roman', 'Ruski', 70, 1, 5, 11),
(35, 'Gospodar prstenova', 'J.J.R Tolkien', 1954, 'Fantastika', 'Engleski', 40, 1, 6, 12),
(36, 'Božanstvena komedija', 'Dante Alighieri', 1320, 'Poezija', 'Italijanski', 90, 1, 5, 13),
(37, 'Hamlet', 'William Shakespeare', 1601, 'Tragedija', 'Engleski', 77, 1, 5, 14),
(38, 'Jadnici', 'Victor Hugo', 1862, 'Tragedija', 'Francuski', 67, 2, 5, 14),
(39, 'Evgenij Onjegin', 'Aleksandr Pushkin', 1833, 'Roman', 'Ruski', 99, 2, 5, 15),
(40, 'Germinal', 'Emile Zola', 1885, 'Roman', 'Francuski', 110, 1, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `kvalifikacije_radnika`
--

DROP TABLE IF EXISTS `kvalifikacije_radnika`;
CREATE TABLE IF NOT EXISTS `kvalifikacije_radnika` (
  `id_kvalifikacije_radnika` int(11) NOT NULL,
  `stručna_sprema` enum('visoka stručna sprema','viša školska sprema','srednja stručna sprema','nekvalifikovani radnik') COLLATE utf8mb4_croatian_ci NOT NULL,
  `poznavanje_stranog_jezika` enum('ne','engleski','njemački','švedski','francuski','turski','engleski i njemački','engleski i turski','engleski i švedski','engleski i francuski','engleski, njemački i turski','engleski, njemački i francuski','engleski, njemački i švedski') COLLATE utf8mb4_croatian_ci NOT NULL,
  `poznavanje_rada_na_računaru` enum('da','ne') COLLATE utf8mb4_croatian_ci NOT NULL,
  `id_radnika` int(11) NOT NULL,
  PRIMARY KEY (`id_kvalifikacije_radnika`),
  KEY `id_radnika` (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `kvalifikacije_radnika`
--

INSERT INTO `kvalifikacije_radnika` (`id_kvalifikacije_radnika`, `stručna_sprema`, `poznavanje_stranog_jezika`, `poznavanje_rada_na_računaru`, `id_radnika`) VALUES
(1, 'viša školska sprema', 'engleski, njemački i francuski', 'da', 10),
(2, 'visoka stručna sprema', 'engleski, njemački i turski', 'da', 2),
(3, 'viša školska sprema', 'engleski i njemački', 'da', 7),
(4, 'srednja stručna sprema', 'engleski', 'ne', 1),
(5, 'visoka stručna sprema', 'engleski i turski', 'da', 9),
(6, 'visoka stručna sprema', 'engleski i njemački', 'da', 8),
(7, 'nekvalifikovani radnik', 'engleski', 'ne', 4),
(8, 'visoka stručna sprema', 'engleski i švedski', 'da', 6),
(9, 'viša školska sprema', 'njemački', 'da', 5),
(10, 'visoka stručna sprema', 'engleski, njemački i švedski', 'da', 3);

-- --------------------------------------------------------

--
-- Table structure for table `radnici`
--

DROP TABLE IF EXISTS `radnici`;
CREATE TABLE IF NOT EXISTS `radnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `spol` enum('m','ž') NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `datum_zaposlenja` date NOT NULL,
  `posao_koji_obavlja` enum('bibliotekar/ka','sekretar/ka','higijeničar/ka') NOT NULL,
  `email_adresa` varchar(30) NOT NULL,
  `broj_telefona` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `radnici`
--

INSERT INTO `radnici` (`id`, `ime`, `prezime`, `spol`, `datum_rodjenja`, `datum_zaposlenja`, `posao_koji_obavlja`, `email_adresa`, `broj_telefona`) VALUES
(1, 'Maja', 'Sekretarović', 'ž', '1987-03-25', '2019-07-20', 'sekretar/ka', 'amila.sekretarovic@gmail.com', 62546378),
(2, 'Mahir', 'Knjiga', 'm', '1985-09-12', '2018-05-05', 'bibliotekar/ka', 'knjiga_mahir@hotmail.com', 65382901),
(3, 'Samir', 'Samirović', 'm', '1990-12-09', '2019-12-12', 'sekretar/ka', 'samir.ovic@gmail.com', 63819767),
(4, 'Ajsel', 'Ajselović', 'ž', '1989-05-22', '2018-03-03', 'higijeničar/ka', 'ajsel.ovic@gmail.com', 64928376),
(5, 'Emina', 'Eminović', 'ž', '1990-07-06', '2018-10-10', 'bibliotekar/ka', 'eminovic89@hotmail.com', 62198735),
(6, 'Dajana', 'Dajić', 'ž', '1977-03-12', '2013-04-10', 'sekretar/ka', 'dajana.dajic@gmail.com', 603101922),
(7, 'Danijel', 'Danijelović', 'm', '1985-09-23', '2015-05-14', 'higijeničar/ka', 'danijel.dani@hotmail.com', 64938762),
(8, 'Naida', 'Emić', 'ž', '1989-08-20', '2017-07-10', 'bibliotekar/ka', 'emic_naida@gmail.com', 61029874),
(9, 'Faris', 'Farić', 'm', '1980-03-03', '2014-05-20', 'sekretar/ka', 'faris.faric@gmail.com', 64738294),
(10, 'Nejra', 'Nejrić', 'ž', '1976-07-19', '2010-05-06', 'bibliotekar/ka', 'nejric76@hotmail.com', 61928765);

-- --------------------------------------------------------

--
-- Table structure for table `radno_vrijeme_radnika`
--

DROP TABLE IF EXISTS `radno_vrijeme_radnika`;
CREATE TABLE IF NOT EXISTS `radno_vrijeme_radnika` (
  `id_radno_vrijeme_radnika` int(11) NOT NULL,
  `radni_dan` enum('ponedjeljak, srijeda i petak','utorak, četvrtak i subota') COLLATE utf8mb4_croatian_ci NOT NULL,
  `početak_radnog_vremena` time NOT NULL,
  `kraj_radnog_vremena` time NOT NULL,
  `id_radnika` int(11) NOT NULL,
  PRIMARY KEY (`id_radno_vrijeme_radnika`),
  KEY `id_radnika` (`id_radnika`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `radno_vrijeme_radnika`
--

INSERT INTO `radno_vrijeme_radnika` (`id_radno_vrijeme_radnika`, `radni_dan`, `početak_radnog_vremena`, `kraj_radnog_vremena`, `id_radnika`) VALUES
(1, 'ponedjeljak, srijeda i petak', '08:00:00', '16:00:00', 4),
(2, 'utorak, četvrtak i subota', '08:00:00', '16:00:00', 10),
(3, 'ponedjeljak, srijeda i petak', '08:00:00', '16:00:00', 6),
(4, 'utorak, četvrtak i subota', '16:00:00', '18:00:00', 3),
(5, 'ponedjeljak, srijeda i petak', '08:00:00', '16:00:00', 5),
(6, 'utorak, četvrtak i subota', '08:00:00', '16:00:00', 2),
(7, 'ponedjeljak, srijeda i petak', '16:00:00', '18:00:00', 1),
(8, 'utorak, četvrtak i subota', '08:00:00', '16:00:00', 9),
(9, 'ponedjeljak, srijeda i petak', '08:00:00', '16:00:00', 7),
(10, 'utorak, četvrtak i subota', '08:00:00', '16:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `članovi`
--

DROP TABLE IF EXISTS `članovi`;
CREATE TABLE IF NOT EXISTS `članovi` (
  `br_clanske_karte` int(15) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Ime` varchar(15) CHARACTER SET utf8 NOT NULL,
  `Prezime` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Grad` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Poštanski_broj` int(5) NOT NULL,
  `Adresa_stanovanja` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Telefonski_broj` int(20) NOT NULL,
  PRIMARY KEY (`br_clanske_karte`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `članovi`
--

INSERT INTO `članovi` (`br_clanske_karte`, `Ime`, `Prezime`, `Grad`, `Poštanski_broj`, `Adresa_stanovanja`, `Telefonski_broj`) VALUES
(1, 'Meho', 'Mehić', 'Sarajevo', 71000, 'Olimpijska 20', 61342165),
(2, 'Mirnesa', 'Nuhović', 'Sarajevo', 71000, 'Kralja Tvrtka 4', 62454845),
(3, 'Emina', 'Efendić', 'Sarajevo', 71000, 'Kolodvorska 5', 63458124),
(4, 'Meho', 'Mehović', 'Mostar', 88000, 'Zagrebacka 18', 61526372),
(5, 'Mersad', 'Homo', 'Mostar', 88000, 'Zagrebačka 9', 62567487),
(6, 'Ema', 'Medonjić', 'Banja Luka', 78000, '12 beba', 63567876),
(7, 'Mirnes', 'Mirvić', 'Travnik', 75000, 'Kalinska', 64154245),
(8, 'Mirnesa', 'Mivić', 'Travnik', 75000, 'Kalinska', 64152345),
(9, 'Nermina', 'Silajdžić', 'Sarajevo', 71000, 'Trg Barcelone 6', 61736467),
(10, 'Dženana', 'Lovrić', 'Sarajevo', 71000, 'Valtera Perića 8', 61767876),
(11, 'Tea', 'Draganović', 'Mostar', 88000, 'Kralja Tvrtka 24', 645675876),
(12, 'Eman', 'Srna', 'Banja Luka', 78000, 'Ulica hehe', 647367876),
(13, 'Dženan', 'Pindžo', 'Sarajevo', 71000, 'Kralja Tomislava 5', 62456873),
(14, 'Srđan', 'Manorić', 'Banja Luka', 78000, '12 Beba', 655678765),
(15, 'Esma', 'Pivić', 'Tuzla', 72270, 'Neka ulica', 63567654),
(16, 'Emira', 'Čavić', 'Sarajevo', 71000, 'Valtera Perića 9', 61245367),
(17, 'Neira', 'Samja', 'Sarajevo', 71000, 'Moj Dom', 61789675),
(18, 'Nejra', 'Pivić', 'Jajce', 70101, 'Ulica Jajca 34', 657898765),
(19, 'Larisa', 'Pirilić', 'Sarajevo', 71000, 'Ulica BiH 2', 61875696),
(20, 'Amina', 'Prezimenović', 'Tuzla', 72270, 'Ulica Karlovačka br. 1', 61767923),
(21, 'Saira', 'Džego', 'Sarajevo', 71000, 'Kralja Tvrtka 6', 61562836),
(22, 'Amra', 'Krdžalić', 'Banja Luka', 78000, 'Ulica u BL 7', 65278987),
(23, 'Amira', 'Medžić', 'Jajce', 70101, 'Ulica Jajca 12', 61524536),
(24, 'Ensad', 'Mirvić', 'Tuzla', 72270, 'Ulica u Tuzli', 64567987),
(25, 'Dajana', 'Delahmet', 'Sarajevo', 71000, 'Mulamustafe Bešeskije 8', 61278938),
(26, 'Nermin', 'Gidić', 'Gradiška', 78400, 'Nek ima i Gradiška', 61543654),
(27, 'Sanela', 'Džinić', 'Sarajevo', 71000, 'Mulamustafe Bašeskije 5', 61762537),
(28, 'Amila', 'Tirić', 'Sarajevo', 71000, 'Grbavička 7', 62567845),
(29, 'Engin', 'Čavić', 'Tuzla', 72270, 'Ulica u Tuzli 8', 61765434),
(30, 'Ajla', 'Pitić', 'Sarajevo', 71000, 'Valtera Perića 8', 63567654);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
