-- TABLES

-- Create a table locations with columns locationId, locationName
CREATE TABLE freightCompany__locations (
    locationId int PRIMARY KEY,
    locationName varchar(50)
);

-- Create a table containers with columns containerId, weight, value, origin, destination
CREATE TABLE freightCompany__containers (
    containerId int PRIMARY KEY,
    weight int,
    value int,
    origin int,
    destination int,
    FOREIGN KEY (origin) REFERENCES freightCompany__locations(locationId),
    FOREIGN KEY (destination) REFERENCES freightCompany__locations(locationId)
);

-- Create a table ships with columns shipId, weightCapacity, containerCapacity
CREATE TABLE freightCompany__ships (
    shipId int PRIMARY KEY,
    weightCapacity int,
    containerCapacity int
);

-- Create a table shipAtLocation with columns shipId, locationId
CREATE TABLE freightCompany__shipAtLocation (
    shipId int,
    locationId int,
    FOREIGN KEY (shipId) REFERENCES freightCompany__ships(shipId),
    FOREIGN KEY (locationId) REFERENCES freightCompany__locations(locationId)
);

-- Create a table shipGoingToDestination width columns shipId, locationId
CREATE TABLE freightCompany__shipGoingToDestination (
    shipId int,
    locationId int,
    FOREIGN KEY (shipId) REFERENCES freightCompany__ships(shipId),
    FOREIGN KEY (locationId) REFERENCES freightCompany__locations(locationId)
);

-- Create a table containerOnShip with columns containerId, shipId
CREATE TABLE freightCompany__containerOnShip (
    containerId int,
    shipId int,
    FOREIGN KEY (containerId) REFERENCES freightCompany__containers(containerId),
    FOREIGN KEY (shipId) REFERENCES freightCompany__containers(containerId)
);

-- SHIP DATA

-- Insert the locations Rotterdam, Miami and Hamburg
INSERT INTO freightCompany__locations VALUES (1,'Rotterdam'), (2,'Miami'),(3,'Hamburg');

-- Insert Ships with following data:
-- Weight capacity: 1000, container capacity 100
-- Weight capacity: 10, container capacity 2
-- Weight capacity: 200, container capacity 2
-- Weight capacity: 100, container capacity 10
-- Weight capacity: 100, container capacity 10
-- Weight capacity: 300, container capacity 10

INSERT INTO freightCompany__ships VALUES 
    (1,1000,100),(2,10,2),(3,200,2),(4,100,10),(5,100,10),(6,300,10);

--  Assign the first two ships to be in Rotterdam, the second two to be in Miami, and the last two to be in Hamburg
INSERT INTO freightCompany_shipAtLocation VALUES
    (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);

-- CONTAINER DATA

-- Add containers with the following data:
-- Weight: 1, value: 10, from Rotterdam to Miami
-- Weight: 10, value: 20, from Rotterdam to Hamburg
-- Weight: 10, value: 10, from Miami to Rotterdam
-- Weight: 50, value: 40, from Miami to Hamburg
-- Weight: 30, value: 10, from Hamburg to Rotterdam 
-- Weight: 20, value: 1000, from Hamburg to Miami

INSERT INTO freightCompany__containers(weight, value, origin, destination)
	VALUES
	(1,10,(SELECT locationId FROM freightCompany__locations WHERE locationName='Rotterdam'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Miami')),
	(10,20,(SELECT locationId FROM freightCompany__locations WHERE locationName='Rotterdam'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Hamburg')),
	(10,10,(SELECT locationId FROM freightCompany__locations WHERE locationName='Miami'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Rotterdam')),
	(50,40,(SELECT locationId FROM freightCompany__locations WHERE locationName='Miami'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Hamburg')),
	(30,10,(SELECT locationId FROM freightCompany__locations WHERE locationName='Hamburg'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Rotterdam')),
	(20,1000,(SELECT locationId FROM freightCompany__locations WHERE locationName='Hamburg'),(SELECT locationId FROM freightCompany__locations WHERE locationName='Miami'));
-- Assign each container to a ship (1 -> 1, 2 -> 2,…6 -> 6)
INSERT INTO freightCompany__containerOnShip VALUES 
 (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

--