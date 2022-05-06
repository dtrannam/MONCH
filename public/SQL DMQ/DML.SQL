-- User Pages
Select * from Users

INSERT INTO Users (userEmail, userBirthday, userLocation)
VALUES (:userEmail, :userBirthday, :userLocation)

DELETE FROM Users where id = :userID

UPDATE Users set userEmail = :userEmail, userBirthday=:userBirthday, userLocation=:userLocation
WHERE id = :userID

-- Categories Pages
Select * from Categories;

INSERT INTO Categories (categoryID, categoryName)
VALUES (:categoryID, :categoryName)

-- Reviews Page
Select * from Reviews;

Insert INTO Reviews (reviewDate, reviewStar, reviewContent, Users_userID, Restaurants_restaurantID)
VALUES (:reviewDate, :reviewStar, :reviewContent, :Users_userID, :Restaurants_restaurantID)

-- Restaurants
Select * from Restaurants;

Insert INTO Restaurants (restaurantName, restaurantAddress, restaurantCity, restaurantPriceRange, restaurantHasNutritionInfo)
VALUES (:restaurantName, :restaurantAddress, :restaurantCity, :restaurantPriceRange, :restaurantHasNutritionInfo)

-- Restaurants_has_Categories
Select * from Restaurants_has_Categories;

Insert INTO Restaurants_has_Categories (Restaurants_restaurantID, Categories_categoryID)
VALUES (:Restaurants_restaurantID, Categories_categoryID)

DELETE FROM Restaurants_has_Categories where 
Restaurants_restaurantID = :Restaurants_restaurantID and Categories_categoryID = :Categories_categoryID