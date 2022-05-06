-- phpMyAdmin SQL Dump
-- version 5.1.3-2.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2022 at 12:14 AM
-- Server version: 10.6.7-MariaDB-log
-- PHP Version: 7.4.28

SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_lukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories`
(
    `categoryID`   int(11) NOT NULL,
    `categoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`categoryID`, `categoryName`)
VALUES (1, ''American''),
       (2, ''Japanese''),
       (3, ''Romantic''),
       (4, ''Dessert'');

-- --------------------------------------------------------

--
-- Table structure for table `Restaurants`
--

CREATE TABLE `Restaurants`
(
    `restaurantID`               int(11) NOT NULL,
    `restaurantName`             varchar(45) NOT NULL,
    `restaurantAddress`          varchar(45) NOT NULL,
    `restaurantCity`             varchar(45) NOT NULL,
    `restaurantPriceRange`       int(11) NOT NULL,
    `restaurantHasNutritionInfo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Restaurants`
--

INSERT INTO `Restaurants` (`restaurantID`, `restaurantName`, `restaurantAddress`, `restaurantCity`,
                           `restaurantPriceRange`, `restaurantHasNutritionInfo`)
VALUES (1, ''Hugo\''s Cellar'', ''202 Fremont Street Experience'', ''Las Vegas'', 3, 0),
       (2, ''Cheesecake Factory'', ''251 Geary St, San Francisco'', ''San Francisco'', 2, 1),
       (3, ''Jjanga AYCE Sushi'', ''6125 S Fort Apache Rd'', ''Las Vegas'', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Restaurants_has_Categories`
--

CREATE TABLE `Restaurants_has_Categories`
(
    `Restaurants_restaurantID` int(11) NOT NULL,
    `Categories_categoryID`    int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Restaurants_has_Categories`
--

INSERT INTO `Restaurants_has_Categories` (`Restaurants_restaurantID`, `Categories_categoryID`)
VALUES (1, 1),
       (1, 2),
       (3, 1),
       (3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews`
(
    `reviewID`                 int(11) NOT NULL,
    `reviewDate`               date     NOT NULL,
    `reviewStar`               int(11) NOT NULL,
    `reviewContent`            longtext NOT NULL,
    `Users_userID`             int(11) NOT NULL,
    `Restaurants_restaurantID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`reviewID`, `reviewDate`, `reviewStar`, `reviewContent`, `Users_userID`,
                       `Restaurants_restaurantID`)
VALUES (1, ''2012 - 01 - 01 '', 5, ''Wow, really good'', 1, 1),
       (2, ''2020 - 06 - 01 '', 4, ''Great!'', 2, 2),
       (3, ''2018 - 01 - 09 '', 1, ''Tastes like my dry elbow'', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users`
(
    `userID`       int(11) NOT NULL,
    `userEmail`    varchar(45) NOT NULL,
    `userBirthday` date        NOT NULL,
    `userLocation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `userEmail`, `userBirthday`, `userLocation`)
VALUES (1, ''richie@lam.com'', ''0000 - 00 - 00 '', ''San Francisco''),
       (2, ''nathan@perkins.com'', ''0000 - 00 - 00 '', ''San Francisco''),
       (3, ''kevin@luk.com'', ''0000 - 00 - 00 '', ''Las Vegas'');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
    ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `Restaurants`
--
ALTER TABLE `Restaurants`
    ADD PRIMARY KEY (`restaurantID`);

--
-- Indexes for table `Restaurants_has_Categories`
--
ALTER TABLE `Restaurants_has_Categories`
    ADD PRIMARY KEY (`Restaurants_restaurantID`, `Categories_categoryID`),
  ADD KEY `fk_Restaurants_has_Categories_Categories1_idx` (`Categories_categoryID`),
  ADD KEY `fk_Restaurants_has_Categories_Restaurants1_idx` (`Restaurants_restaurantID`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
    ADD PRIMARY KEY (`reviewID`, `Users_userID`, `Restaurants_restaurantID`),
  ADD KEY `fk_Reviews_Users1_idx` (`Users_userID`),
  ADD KEY `fk_Reviews_Restaurants2_idx` (`Restaurants_restaurantID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
    ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
    MODIFY `categoryID` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Restaurants`
--
ALTER TABLE `Restaurants`
    MODIFY `restaurantID` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
    MODIFY `userID` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Restaurants_has_Categories`
--
ALTER TABLE `Restaurants_has_Categories`
    ADD CONSTRAINT `fk_Restaurants_has_Categories_Categories1` FOREIGN KEY (`Categories_categoryID`) REFERENCES `Categories` (`categoryID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Restaurants_has_Categories_Restaurants1` FOREIGN KEY (`Restaurants_restaurantID`) REFERENCES `Restaurants` (`restaurantID`) ON
DELETE
CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
    ADD CONSTRAINT `fk_Reviews_Restaurants2` FOREIGN KEY (`Restaurants_restaurantID`) REFERENCES `Restaurants` (`restaurantID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reviews_Users1` FOREIGN KEY (`Users_userID`) REFERENCES `Users` (`userID`) ON
DELETE
CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;