-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 09 jan 2023 om 11:49
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend_mvc`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auto`
--

DROP TABLE IF EXISTS `auto`;
CREATE TABLE IF NOT EXISTS `auto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(8) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `auto`
--

INSERT INTO `auto` (`Id`, `Kenteken`, `Type`, `InstructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CapitalCity` varchar(100) NOT NULL,
  `Continent` varchar(100) NOT NULL,
  `Population` int(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`) VALUES
(6, 'Nederland', 'Amsterdam', 'Europa', 17000000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@gmail.com', 'Groen'),
(2, 'Manhoi@gmail.com', 'Manhoi'),
(3, 'Zoyi@gmail.com', 'Zoyi'),
(4, 'berthold@gmail.com', 'Berthold'),
(5, 'denekamp@gmail.com', 'Denekamp');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `kilometerstand`
--

DROP TABLE IF EXISTS `kilometerstand`;
CREATE TABLE IF NOT EXISTS `kilometerstand` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `KmStand` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AutoId` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `kilometerstand`
--

INSERT INTO `kilometerstand` (`Id`, `AutoId`, `Datum`, `KmStand`) VALUES
(1, 4, '2022-12-05', 70788),
(2, 2, '2022-12-05', 12670),
(3, 1, '2022-12-06', 60345),
(4, 3, '2022-12-07', 21300),
(5, 1, '2022-12-07', 60900),
(6, 1, '2022-12-12', 487548),
(7, 1, '2022-12-12', 487548),
(8, 1, '2022-12-12', 487548);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling`
--

DROP TABLE IF EXISTS `leerling`;
CREATE TABLE IF NOT EXISTS `leerling` (
  `Id` int(11) NOT NULL,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling`
--

INSERT INTO `leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `les`
--

DROP TABLE IF EXISTS `les`;
CREATE TABLE IF NOT EXISTS `les` (
  `Id` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `LeerlingId` int(11) NOT NULL,
  `instructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Instructeur` (`instructeurId`),
  KEY `LeerlingId` (`LeerlingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `les`
--

INSERT INTO `les` (`Id`, `Datum`, `LeerlingId`, `instructeurId`) VALUES
(45, '2022-05-20', 3, 1),
(46, '2022-05-20', 6, 3),
(47, '2022-05-21', 4, 2),
(48, '2022-05-21', 6, 3),
(49, '2022-05-22', 3, 1),
(50, '2022-05-28', 4, 2),
(51, '2022-06-01', 3, 2),
(52, '2022-06-12', 3, 1),
(53, '2022-06-22', 3, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mankement`
--

DROP TABLE IF EXISTS `mankement`;
CREATE TABLE IF NOT EXISTS `mankement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `Mankement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AutoId` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `mankement`
--

INSERT INTO `mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES
(1, 4, '2023-01-04', 'Profiel rechterband minder dan 2mm'),
(2, 2, '2023-01-02', 'Rechter achterlicht kapot'),
(3, 1, '2023-01-02', 'Spiegel links afgebroken'),
(4, 2, '2023-01-06', 'Bumper rechtsachter ingedeukt'),
(5, 2, '2023-01-08', 'Radio kapot'),
(6, NULL, '2023-01-09', 'fbvc'),
(7, NULL, '2023-01-09', 'fff'),
(8, NULL, '2023-01-09', 'dcsjnvf'),
(9, NULL, '2023-01-09', 'dcsjnvf'),
(10, NULL, '2023-01-09', 'dcsjnvf'),
(11, NULL, '2023-01-09', 'ff'),
(12, NULL, '2023-01-09', 'fdf3'),
(13, NULL, '2023-01-09', 'testttt3'),
(14, NULL, '2023-01-09', 'fdjngd1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderwerp`
--

DROP TABLE IF EXISTS `onderwerp`;
CREATE TABLE IF NOT EXISTS `onderwerp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LesId` int(11) NOT NULL,
  `Onderwerp` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesId` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2363 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `onderwerp`
--

INSERT INTO `onderwerp` (`Id`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Invoegen snelweg'),
(2347, 50, 'Achteruit rijden'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'Invoegen snelweg'),
(2350, 52, 'File parkeren'),
(2351, 45, 'dfffsfda'),
(2352, 53, 'edfdffd'),
(2353, 53, 'cvgcv'),
(2354, 53, ''),
(2355, 53, 'dsdfsfds'),
(2356, 53, ''),
(2357, 53, ''),
(2358, 53, ''),
(2360, 53, 'dsffdsdfs'),
(2361, 53, 'ddddddd'),
(2362, 45, 'Banaan');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opmerking`
--

DROP TABLE IF EXISTS `opmerking`;
CREATE TABLE IF NOT EXISTS `opmerking` (
  `Id` int(11) NOT NULL,
  `LesId` int(11) NOT NULL,
  `Opmerking` varchar(70) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Les` (`LesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `opmerking`
--

INSERT INTO `opmerking` (`Id`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 45, 'Langzamer doorrijden bij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'Richtingaanwijzer aan');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `InstructeurId` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur` (`Id`);

--
-- Beperkingen voor tabel `kilometerstand`
--
ALTER TABLE `kilometerstand`
  ADD CONSTRAINT `kilometerstand_ibfk_1` FOREIGN KEY (`AutoId`) REFERENCES `auto` (`Id`);

--
-- Beperkingen voor tabel `les`
--
ALTER TABLE `les`
  ADD CONSTRAINT `LeerlingId` FOREIGN KEY (`LeerlingId`) REFERENCES `leerling` (`Id`);

--
-- Beperkingen voor tabel `mankement`
--
ALTER TABLE `mankement`
  ADD CONSTRAINT `AutoId` FOREIGN KEY (`AutoId`) REFERENCES `auto` (`Id`);

--
-- Beperkingen voor tabel `onderwerp`
--
ALTER TABLE `onderwerp`
  ADD CONSTRAINT `LesId` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);

--
-- Beperkingen voor tabel `opmerking`
--
ALTER TABLE `opmerking`
  ADD CONSTRAINT `Les` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
