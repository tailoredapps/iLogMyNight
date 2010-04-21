CREATE TABLE Drink(Name VARCHAR(100) NOT NULL PRIMARY KEY, preis REAL, letzterpreis REAL);

CREATE TABLE DrinkHistory(id integer NOT NULL PRIMARY KEY, drink_id VARCHAR(100) NOT NULL CONSTRAINT fk_drink_id REFERENCES Drink(Name), betrag REAL, timestamp TIMESTAMP);

INSERT INTO Drink VALUES('Bier',3.6,3.6);
INSERT INTO Drink VALUES('Wein',4,4);
INSERT INTO Drink VALUES('Coctail',8.6,8.6);

/*insert into DrinkHistory values(NULL,(Select id from Drink where name='Bier'), 8.8, '1999-12-12');*/
