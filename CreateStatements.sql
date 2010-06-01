CREATE TABLE Drink(Name VARCHAR(100) NOT NULL PRIMARY KEY, Typ VARCHAR(100), preis REAL, letzterpreis REAL);

CREATE TABLE DrinkHistory(id integer NOT NULL PRIMARY KEY, drink_id VARCHAR(100) NOT NULL CONSTRAINT fk_drink_id REFERENCES Drink(Name), betrag REAL, timestamp TIMESTAMP);

INSERT INTO Drink VALUES('Gro§es Bier','Bier',3.6,3.6);
INSERT INTO Drink VALUES('Kleines Bier','Bier',3.6,3.6);
INSERT INTO Drink VALUES('Bock Bier','Bier',3.6,3.6);
INSERT INTO Drink VALUES('Rotwein Achterl','Wein',4,4);
INSERT INTO Drink VALUES('Mojito','Cocktail',8.6,8.6);
INSERT INTO Drink VALUES('LongIsland','Cocktail',8.6,8.6);
INSERT INTO Drink VALUES('Caipirinha','Cocktail',8.6,8.6);
INSERT INTO Drink VALUES('Cola','Anti',2.6,2.6);
INSERT INTO Drink VALUES('Vodka','Shot',5.0,5.0);

/*insert into DrinkHistory values(NULL,(Select id from Drink where name='Bier'), 8.8, '1999-12-12');*/
