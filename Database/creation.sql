DROP DATABASE IF EXISTS MealPlanning;

CREATE DATABASE MealPlanning;

USE MealPlanning;

CREATE TABLE IF NOT EXISTS Cookbook (
    CookbookName varchar(200) not null,
    IsBook bool not null,
    Website varchar(200),
    PRIMARY KEY (CookbookName)
);

CREATE TABLE IF NOT EXISTS Recipe (
    RecipeName varchar(100) not null,
    CookbookName varchar(200) not null,
    TotalServings int,
    PRIMARY KEY (RecipeName),
    FOREIGN KEY (CookbookName) REFERENCES Cookbook (CookbookName) on update cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS Ingredients (
    Id int not null auto_increment,
    IngredientName varchar(100) not null,
    IngredientType varchar(100),
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Meal (
    RecipeName varchar(100) not null,
    IngredientId int not null,
    PRIMARY KEY (RecipeName, IngredientId),
    FOREIGN KEY (RecipeName) REFERENCES Recipe (RecipeName) on update cascade on delete cascade,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) on update cascade on delete cascade
);

-- Insert Cookbooks
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet", true);
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet Dinner", true);
INSERT INTO Cookbook (CookbookName, IsBook, Website) VALUES ("Domesticate Me", false, "http://domesticate-me.com");
INSERT INTO Cookbook (CookbookName, IsBook, Website) VALUES ("Delish", false, "http://delish.com");
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Perfect Scoop", true);

-- Insert Recipes
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Fajitas", "Dude Diet", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stir Fry", "Dude Diet Dinner", 3);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stuffing", "Domesticate Me", 8);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Chicken Stew", "Dude Diet", 4);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Philly Style Vanilla Ice Cream", "Perfect Scoop", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Philly Style Chocolate Ice Cream", "Perfect Scoop", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Beef Stew", "Delish", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Chili Mac", "Delish", 4);

-- Insert Ingredients
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Red Pepper", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Green Pepper", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Yellow Onion", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Chicken", "meat");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Enchillada Sauce", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Shredded Cheese", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Garlic", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Soy Sauce", "condiment");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Butter", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Sausage", "meat");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Golden Delicious Apple", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Tyme", "spice");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Chicken broth", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Stale bread crumbs", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Whole Milk", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Heavy Cream", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Sugar", "spice");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Vanilla Extract", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Vanilla Bean", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Beef Chuck", "meat");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Carrots", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Potatoe", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Celery", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Beef Broth", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("tomatoe paste", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Worcestershire sauce", "condiment");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Dutch chocolate", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Elbow Macaroni", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Chili Powder", "spice");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Red Kidney Beans", "pantry");

-- Insert Meals
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 2);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 5);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 6);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 2);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 7);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 8);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 9);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 10);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 11);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 12);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 13);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 14);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 14);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 13);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Vanilla Ice Cream", 15);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Vanilla Ice Cream", 16);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Vanilla Ice Cream", 17);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Vanilla Ice Cream", 18);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Vanilla Ice Cream", 19);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 20);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 21);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 22);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 23);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 24);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 25);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 26);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Beef Stew", 7);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Chocolate Ice Cream", 15);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Chocolate Ice Cream", 16);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Chocolate Ice Cream", 17);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Chocolate Ice Cream", 18);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Philly Style Chocolate Ice Cream", 27);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 26);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 25);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 7);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 6);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 2);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 28);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 29);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chili Mac", 30);
