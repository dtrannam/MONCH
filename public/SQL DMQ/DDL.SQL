-- DROP ON START UP
DROP TABLE Categories;
DROP TABLE Restaurants;
DROP TABLE Reviews;
DROP TABLE Users;
DROP TABLE Restaurants_has_Categories;

CREATE TABLE Categories
(   
    `categoryID`   int(11) NOT NULL AUTO_INCREMENT,
    `categoryName` varchar(255) DEFAULT NULL,
    PRIMARY KEY (categoryID)

);
-- Dumping data for table `Categories`
INSERT INTO Categories (`categoryID`, `categoryName`)
VALUES (1, 'American'),
       (2, 'Japanese'),
       (3, 'Romantic'),
       (4, 'Dessert');
----------------------------------------------------------
-- Table structure for table `Users`
CREATE TABLE Users
(
    `userID`       int(11) NOT NULL AUTO_INCREMENT,
    `userEmail`    varchar(45) NOT NULL,
    `userBirthday` date        NOT NULL,
    `userLocation` varchar(45) NOT NULL,
    PRIMARY KEY(userID)
);
-- Dumping data for table `Users`
INSERT INTO `Users` (`userEmail`, `userBirthday`, `userLocation`)
VALUES ('richie@lam.com', 0000-00-00, 'San Francisco'),
       ('nathan@perkins.com', 0000-00-00, 'San Francisco'),
       ('kevin@luk.com', 0000-00-00, 'Las Vegas');
----------------------------------------------------------
-- Table structure for table `Restaurants`
CREATE TABLE Restaurants
(
    `restaurantID`               int(11) NOT NULL AUTO_INCREMENT,
    `restaurantName`             varchar(45) NOT NULL,
    `restaurantAddress`          varchar(45) NOT NULL,
    `restaurantCity`             varchar(45) NOT NULL,
    `restaurantPriceRange`       int(11) NOT NULL,
    `restaurantHasNutritionInfo` tinyint(4) DEFAULT NULL,
    PRIMARY KEY (restaurantID)
);
-- Dumping data for table `Restaurants`
INSERT INTO Restaurants (`restaurantName`, `restaurantAddress`, `restaurantCity`,
                           `restaurantPriceRange`, `restaurantHasNutritionInfo`)
VALUES ('Hugos Cellar', '202 Fremont Street Experience', 'Las Vegas', 3, 0),
       ('Cheesecake Factory', '251 Geary St, San Francisco', 'San Francisco', 2, 1),
       ('Jjanga AYCE Sushi', '6125 S Fort Apache Rd', 'Las Vegas', 2, 0);
----------------------------------------------------------
-- Table structure for table `Reviews`
CREATE TABLE Reviews
(
    `reviewID`                  int(11) NOT NULL AUTO_INCREMENT,
    `reviewDate`                date     NOT NULL,
    `reviewStar`                int(11) NOT NULL,
    `reviewContent`             longtext NOT NULL,
    `userID`                   int(11) NOT NULL,
    `restaurantID`             int(11) NOT NULL,
    PRIMARY KEY (reviewID, userID, restaurantID),
	FOREIGN KEY (restaurantID) REFERENCES Restaurants(restaurantID) ON DELETE CASCADE,
	FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Dumping data for table `Reviews`
INSERT INTO Reviews (`reviewDate`, `reviewStar`, `reviewContent`, `userID`,
                       `restaurantID`)
VALUES (0000-00-00, 5, 'Wow, really good', 1, 1),
       (0000-00-00, 4, 'Great!', 2, 2),
       (0000-00-00, 1, 'Tastes like my dry elbow', 3, 2);

----------------------------------------------------------
-- Table structure for table `Restaurants_has_Categories`
CREATE TABLE Restaurants_has_Categories
(   `restaurantsHasCategoriesID` int(11) NOT NULL AUTO_INCREMENT,
    `restaurantID` 				int(11) NOT NULL,
    `categoryID`    			int(11) NOT NULL,
    Primary Key (restaurantsHasCategoriesID),
    FOREIGN KEY (restaurantID) REFERENCES Restaurants (restaurantID) ON DELETE CASCADE,
    FOREIGN KEY (categoryID) REFERENCES Categories (categoryID) ON DELETE CASCADE
);
-- Dumping data for table `Restaurants_has_Categories`
INSERT INTO Restaurants_has_Categories (`restaurantID`, `categoryID`)
VALUES (1, 1),
       (1, 2),
       (3, 1),
       (3, 3);