USE MealPlanning;


DROP PROCEDURE IF EXISTS getRecipes;
DELIMITER $$
CREATE PROCEDURE getRecipes(cookbook_name varchar(200))
BEGIN
    SELECT RecipeName FROM Recipe WHERE CookbookName = cookbook_name;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getRecipesByServingCount
DELIMITER $$
CREATE PROCEDURE getRecipesByServingCount(serving_count int)
BEGIN
    SELECT RecipeName FROM Recipe where TotalServings >= serving_count;
END $$
DELIMITER ;

call getRecipesByServingCount(3)

16:27:26	CREATE PROCEDURE getRecipesByServingCount(serving_count int) BEGIN     SELECT RecipeName FROM Recipe where TotalServings >= serving_count; END	Error Code: 1304. PROCEDURE getRecipesByServingCount already exists	0.00024 sec
