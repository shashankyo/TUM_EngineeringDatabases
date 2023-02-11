CREATE TABLE bar__drinkTypes(
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100)
);

INSERT INTO bar__drinkTypes(name)
	VALUES('Juice'),('Beer'),('Rum'),('Whiskey'),('Cocktail');

CREATE TABLE bar__drinks(
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  type int,
  alcoholic boolean,
  FOREIGN KEY (type) REFERENCES bar__drinkTypes(id)
);

INSERT INTO bar__drinks 
	VALUES(default,'Orange Juice',1,FALSE),
		  (default,'Apple Juice',1,FALSE),
		  (default,'Augustiner Hell',2,TRUE),
		  (default,'Flötzinger Pils',2,TRUE),
		  (default,'El Dorado 15',3,TRUE),
		  (default,'Laphroaig 10',4,TRUE),
		  (default,'Virgin Colada',5,FALSE),
		  (default,'Pina Colada',5,TRUE);
  
CREATE TABLE bar__drinkInventories(
  drink int UNIQUE,
  inventory int,
  FOREIGN KEY (drink) REFERENCES bar__drinks(id)
);

INSERT INTO bar__drinkInventories
	VALUES (1,10),(2,0),(3,10),(4,2),(5,4),(6,5),(7,1),(8,3);

# because table and count is not a Text string but a SQL keywords we use `attribute` here
CREATE TABLE bar__drinkOrders(
  `table` int,
  drink int,
  `count` int,
  FOREIGN KEY (drink) REFERENCES bar__drinks(id)
);

INSERT INTO bar__drinkOrders VALUES(1,1,1);
INSERT INTO bar__drinkOrders VALUES(1,4,1);
INSERT INTO bar__drinkOrders VALUES(2,5,2);
INSERT INTO bar__drinkOrders VALUES(2,6,2);
INSERT INTO bar__drinkOrders VALUES(3,7,1);
INSERT INTO bar__drinkOrders VALUES(4,5,1);
INSERT INTO bar__drinkOrders VALUES(4,7,2);
