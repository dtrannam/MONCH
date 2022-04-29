-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs340_lukk
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cs340_lukk` ;

-- -----------------------------------------------------
-- Schema cs340_lukk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs340_lukk` DEFAULT CHARACTER SET utf8 ;
USE `cs340_lukk` ;

-- -----------------------------------------------------
-- Table `cs340_lukk`.`Users`
-- -----------------------------------------------------
CREATE OR REPLACE TABLE `cs340_lukk`.`Users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `userEmail` VARCHAR(45) NOT NULL,
  `userBirthday` DATETIME NOT NULL,
  `userLocation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `cs340_lukk`.`Users`
-- -----------------------------------------------------

Insert into `cs340_lukk`.`Users` (userEmail, userBirthday, userLocation) VALUES
("richie@lam.com", 1996-10-10, "San Francisco"),
("nathan@perkins.com", 1800-06-05, "San Francisco"),
("kevin@luk.com", 1994-08-04, "Las Vegas");


-- -----------------------------------------------------
-- Table `cs340_lukk`.`Restaurants`
-- -----------------------------------------------------
CREATE OR REPLACE TABLE `cs340_lukk`.`Restaurants` (
  `restaurantID` INT NOT NULL AUTO_INCREMENT,
  `categoriesID` INT NULL,
  `restaurantName` VARCHAR(45) NOT NULL,
  `restaurantAddress` VARCHAR(45) NOT NULL,
  `restaurantCity` VARCHAR(45) NOT NULL,
  `restaurantPriceRange` INT NOT NULL,
  `restaurantHasNutritionInfo` TINYINT NULL,
  PRIMARY KEY (`restaurantID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `cs340_lukk`.`Restaurants`
-- -----------------------------------------------------

Insert into `cs340_lukk`.`Restaurants` (restaurantName, restaurantAddress, restaurantCity, restaurantPriceRange, restaurantHasNutritionInfo) VALUES
("Hugo's Cellar", "202 Fremont Street Experience", "Las Vegas", 3, False),
("Cheesecake Factory", "251 Geary St, San Francisco", "San Francisco", 2, True),
("Jjanga AYCE Sushi", "6125 S Fort Apache Rd", "Las Vegas", 2, False);


-- -----------------------------------------------------
-- Table `cs340_lukk`.`Reviews`
-- -----------------------------------------------------
CREATE OR REPLACE TABLE `cs340_lukk`.`Reviews` (
  `reviewID` INT NOT NULL,
  `reviewDate` DATETIME NOT NULL,
  `reviewStar` INT NOT NULL,
  `reviewContent` LONGTEXT NOT NULL,
  `Users_userID1` INT NOT NULL,
  `restaurantID` INT NOT NULL,
  `Restaurants_restaurantID1` INT NOT NULL,
  PRIMARY KEY (`reviewID`, `Users_userID1`, `Restaurants_restaurantID1`),
  INDEX `fk_Reviews_Users1_idx` (`Users_userID1` ASC) VISIBLE,
  INDEX `fk_Reviews_Restaurants2_idx` (`Restaurants_restaurantID1` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_userID1`)
    REFERENCES `cs340_lukk`.`Users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Restaurants2`
    FOREIGN KEY (`Restaurants_restaurantID1`)
    REFERENCES `cs340_lukk`.`Restaurants` (`restaurantID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `cs340_lukk`.`Reviews`
-- -----------------------------------------------------

Insert into `cs340_lukk`.`Reviews` (userID, reviewDate, reviewContent, restaurantID, reviewStar) VALUES
(1, 2012-01-01, "Wow, really good", 1, 5),
(2, 2022-05-04, "Great!", 2, 4),
(3, 2004-01-03, "Tastes like my dry elbow", 2, 1);


-- -----------------------------------------------------
-- Table `cs340_lukk`.`Categories`
-- -----------------------------------------------------
CREATE OR REPLACE TABLE `cs340_lukk`.`Categories` (
  `categoryID` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(255) NULL,
  PRIMARY KEY (`categoryID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `cs340_lukk`.`Categories`
-- -----------------------------------------------------

Insert into `cs340_lukk`.`Categories` (categoryID, categoryName) VALUES
(1, "American"),
(2, "Japanese"),
(3, "Romantic"),
(4, "Dessert");

-- -----------------------------------------------------
-- Table `cs340_lukk`.`Restaurants_has_Categories`
-- -----------------------------------------------------
CREATE OR REPLACE TABLE `cs340_lukk`.`Restaurants_has_Categories` (
  `Restaurants_restaurantID` INT NOT NULL,
  `Categories_categoryID` INT NOT NULL,
  PRIMARY KEY (`Restaurants_restaurantID`, `Categories_categoryID`),
  INDEX `fk_Restaurants_has_Categories_Categories1_idx` (`Categories_categoryID` ASC) VISIBLE,
  INDEX `fk_Restaurants_has_Categories_Restaurants1_idx` (`Restaurants_restaurantID` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurants_has_Categories_Restaurants1`
    FOREIGN KEY (`Restaurants_restaurantID`)
    REFERENCES `cs340_lukk`.`Restaurants` (`restaurantID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurants_has_Categories_Categories1`
    FOREIGN KEY (`Categories_categoryID`)
    REFERENCES `cs340_lukk`.`Categories` (`categoryID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

Insert into `cs340_lukk`.`Restaurants_has_Categories` (Restaurants_restaurantID, Categories_categoryID) VALUES
(1, 1),
(3, 1),
(1, 2),
(3, 3);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
