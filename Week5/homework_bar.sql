-- 1) List all the drink names
SELECT name FROM bar__drinks;

-- 2) list all non alcoholic drinks
SELECT name FROM bar__drinks WHERE alcoholic=FALSE;

-- 3) List all drinks and how many of them are in inventory
SELECT bar__drinks.name, bar__drinkInventories.inventory FROM bar__drinks JOIN bar__drinkInventories ON bar__drinks.id = bar__drinkInventories.drink;

-- 4) List all drinks that are in the inventory and how many of them are in the inventory
SELECT bar__drinks.name, bar__drinkInventories.inventory FROM bar__drinks 
JOIN bar__drinkInventories ON bar__drinks.id = bar__drinkInventories.drink WHERE bar__drinkInventories.inventory > 0;

-- 5) List all non alcoholic drinks that are in the inventory and how many of them are in the inventory
SELECT bar__drinks.name, bar__drinkInventories.inventory FROM bar__drinks 
JOIN bar__drinkInventories ON bar__drinks.id = bar__drinkInventories.drink
WHERE bar__drinks.alcoholic = FALSE;

-- 6) List all cocktails that are in the inventory and List all cocktails that are in stock
SELECT bar__drinks.name, bar__drinkInventories.inventory, bar__drinkTypes.name FROM bar__drinks 
JOIN bar__drinkInventories ON bar__drinks.id = bar__drinkInventories.drink 
JOIN bar__drinkTypes ON bar__drinkTypes.id = bar__drinks.id
WHERE bar__drinkTypes.name = 'Cocktail';

-- 7)  List all cocktails that are the inventory, but rename column to „Cocktail“
SELECT bar__drinks.name AS Cocktail FROM bar__drinks 
JOIN bar__drinkInventories ON bar__drinks.id = bar__drinkInventories.drink 
JOIN bar__drinkTypes ON bar__drinkTypes.id = bar__drinks.id
WHERE bar__drinkTypes.name = 'Cocktail' AND bar__drinkInventories.inventory > 0 ;

-- 8) List Tables that have ordered a cocktail that is in the inventory and what cocktail was ordered
SELECT bar__drinkOrders."table" FROM bar__drinkOrders 
WHERE bar__drinkOrders.drink = ( SELECT bar__drinkTypes.id FROM bar__drinkTypes, bar__drinkInventories 
WHERE name='Cocktail' AND bar__drinkInventories.inventory > 0);

-- 9) List all drinks ordered and the table they were ordered to. Mark drinks that were ordered by no one by NULL.
SELECT bar__drinks.name, bar__drinkOrders."table" FROM bar__drinks 
LEFT JOIN bar__drinkOrders ON bar__drinks.id = bar__drinkOrders.drink;

-- 10)  List all drinks that were ordered
SELECT bar__drinks.name FROM bar__drinks JOIN bar__drinkOrders ON bar__drinks.id = bar__drinkOrders.drink GROUP BY bar__drinks.name;

-- 11) List all drinks that were not ordered
SELECT bar__drinks.name FROM bar__drinks LEFT JOIN bar__drinkOrders ON bar__drinks.id = bar__drinkOrders.drink WHERE bar__drinkOrders."table" IS NULL;

-- 12) List all the beers that were not ordered
SELECT bar__drinks.name FROM bar__drinks
LEFT JOIN bar__drinkOrders On bar__drinks.id = bar__drinkOrders.drink WHERE bar__drinkOrders."table" IS NULL 
AND bar__drinks.type = (SELECT bar__drinkTypes.id FROM bar__drinkTypes WHERE bar__drinkTypes.name ='Beer');

-- 13) How many drinks were ordered for each type?
SELECT bar__drinkTypes.name, SUM(bar__drinkOrders.count) FROM bar__drinks 
JOIN bar__drinkOrders On bar__drinks.id = bar__drinkOrders.drink
JOIN bar__drinkTypes ON bar__drinks.type = bar__drinkTypes.id
GROUP BY bar__drinks.type;

-- 14) List all cocktails and beers
SELECT bar__drinks.name
	FROM bar__drinks
	JOIN bar__drinkTypes ON bar__drinks.type=bar__drinkTypes.id 
	WHERE bar__drinkTypes.name='Cocktail' OR bar__drinkTypes.name='Beer';