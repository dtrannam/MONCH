-- User Pages -- 1x SELECT/1x INSERT/1x DELETE
Select * from Users

INSERT INTO Users (userEmail, userBirthday, userLocation)
VALUES (:userEmail, :userBirthday, :userLocation)

DELETE FROM Users where id = :userID


-- Categories Pages 
Select * from Categories;

INSERT INTO Categories (categoryID, categoryName)
VALUES (:categoryID, :categoryName)

-- Reviews Page 1x SELECT/1x DYNAMIC SELECT/1X DELETE/1X INSERT
Select * from Reviews 
INNER JOIN USER ON Reviews.userID = user.userID;

SELECT * FROM Reviews where Restaurants_restaurantID LIKE ":Restaurants_restaurantID"

Insert INTO Reviews (reviewDate, reviewStar, reviewContent, Users_userID, Restaurants_restaurantID)
VALUES (:reviewDate, :reviewStar, :reviewContent, :Users_userID, :Restaurants_restaurantID)

DELETE FROM Reviews where id = :reviewID

-- Restaurants 1X SELECT/1X DELETE/1X INSERT/1X UPDATE 
Select * from Restaurants 
LEFT JOIN coupons.couponID = Restaurants.couponID ;

Insert INTO Restaurants (restaurantName, restaurantAddress, restaurantCity, restaurantPriceRange, restaurantHasNutritionInfo)
VALUES (:restaurantName, :restaurantAddress, :restaurantCity, :restaurantPriceRange, :restaurantHasNutritionInfo)

UPDATE Restaurants set couponID=:couponID WHERE Restaurant=:Restaurant

-- Restaurants_has_Categories
Select restaurantName, categoryName from Restaurants_has_Categories
INNER JOIN Restaurants ON Restaurants = Restaurants_has_Categories.Restaurants_restaurantID 
INNER JOIN Categories ON Restaurants_has_Categories.categoryID = Categories.categoryID;

Insert INTO Restaurants_has_Categories (Restaurants_restaurantID, Categories_categoryID)
VALUES (:Restaurants_restaurantID, Categories_categoryID)

DELETE FROM Restaurants_has_Categories where 
Restaurants_restaurantID = :Restaurants_restaurantID and Categories_categoryID = :Categories_categoryID