--Airport Exercise
--Lecture 2
--creating table from the diagram
CREATE TABLE airport__airline (name varchar(50) PRIMARY KEY, signature varchar(50));
CREATE TABLE airport__airport (name varchar(50) PRIMARY KEY);
CREATE TABLE airport__terminal (name varchar(50) PRIMARY KEY);
CREATE TABLE airport__checkInCounter (number integer PRIMARY KEY);
CREATE TABLE airport__outgoingFlight (flightNo integer PRIMARY KEY, boardingTime datetime, departureTime datetime, destiny varchar(50), gate varchar(50));
CREATE TABLE airport__incomingFlight (flightNo integer PRIMARY KEY , arrivalTime datetime);
CREATE TABLE airport__airlineWorkOnAirport (airlineName varchar(50), airportName varchar(50));
CREATE TABLE airport__airlineHasIncomingFlight (airlineName varchar(50), incomingFlightFlightNo integer);
CREATE TABLE airport__airlineHasOutgoingFlight (airlineName varchar(50), outgoingFlightNo integer);
CREATE TABLE airport__outgoingFlightAssignedToCheckInCounter (outgoingFlightNo integer, checkInCounterNumber integer);
CREATE TABLE airport__airportHasTerminal (airportName varchar(50), terminalName varchar(50));
CREATE TABLE airport__terminalHasCheckInCounter (terminalName varchar(50), checkInCounterNumber integer);





