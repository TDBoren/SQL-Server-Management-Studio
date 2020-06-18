/* ASSIGNMENT 7*/

CREATE DATABASE db_Indy;
GO

USE db_Indy;
GO

CREATE TABLE tbl_drivers (
	fName VARCHAR(50) NOT NULL,
	lName VARCHAR(50) NOT NULL,
	car_number INT PRIMARY KEY NOT NULL
);

CREATE TABLE tbl_schedule (
	position_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	race_name VARCHAR(50),
	schedule VARCHAR(50),
	car_number INT NOT NULL CONSTRAINT fk_car_number FOREIGN KEY REFERENCES tbl_drivers(car_number) ON UPDATE CASCADE ON DELETE CASCADE,	
);

INSERT INTO tbl_drivers
	(fName, lName, car_number)
	VALUES
	('Marco', 'Andretti', 98),
	('Oliver', 'Askew', 7),
	('Sebastian', 'Bourdais', 4),
	('Ed', 'Carpenter', 20),
	('Max', 'Chilton', 59),
	('Conor', 'Daly', 47),
	('Scott', 'Dixon', 9),
	('Marcus', 'Ericsson', 8),
	('Santino', 'Ferucci', 19),
	('Ben', 'Hanley', 81),
	('Jack', 'Harvey', 60),
	('Colton', 'Herta', 88),
	('Ryan', 'Hunter-Reay', 28),
	('Tony', 'Kanaan', 41),
	('Sage', 'Karam', 24),
	('Dalton', 'Kellett', 14),
	('Charlie', 'Kimball', 44),
	('Josef', 'Newgarden', 2),
	('Pato', 'OWard', 5),
	('Felipe', 'Nasr', 31),
	('Simon', 'Pagenaud', 22),
	('Alex', 'Palou', 18),
	('Will', 'Power', 12),
	('Graham', 'Rahal', 15),
	('Felix', 'Rosenqvist', 10),
	('Alex', 'Rossi', 27),
	('Takuma', 'Sato', 30),
	('Zach', 'Veach', 26),
	('Rinus', 'Veekay', 21)
;

INSERT INTO tbl_schedule
	(race_name, schedule, car_number)
	VALUES
	
	('Indianapolis 500', 'Aug 12-23, 2020', 98),
	('Indianapolis 500', 'Aug 12-23, 2020', 7),
	('Indianapolis 500', 'Aug 12-23, 2020', 4),
	('Indianapolis 500', 'Aug 12-23, 2020', 20),
	('Indianapolis 500', 'Aug 12-23, 2020', 59),
	('Indianapolis 500', 'Aug 12-23, 2020', 47),
	('Indianapolis 500', 'Aug 12-23, 2020', 9),
	('Indianapolis 500', 'Aug 12-23, 2020', 8),
	('Indianapolis 500', 'Aug 12-23, 2020', 19),
	('Indianapolis 500', 'Aug 12-23, 2020', 81),
	('Indianapolis 500', 'Aug 12-23, 2020', 60),
	('Indianapolis 500', 'Aug 12-23, 2020', 88),
	('Indianapolis 500', 'Aug 12-23, 2020', 28),
	('Indianapolis 500', 'Aug 12-23, 2020', 41),
	('Indianapolis 500', 'Aug 12-23, 2020', 24),
	('Indianapolis 500', 'Aug 12-23, 2020', 14),
	('Indianapolis 500', 'Aug 12-23, 2020', 44),
	('Indianapolis 500', 'Aug 12-23, 2020', 2),
	('Indianapolis 500', 'Aug 12-23, 2020', 5),
	('Indianapolis 500', 'Aug 12-23, 2020', 31),
	('Indianapolis 500', 'Aug 12-23, 2020', 22),
	('Indianapolis 500', 'Aug 12-23, 2020', 18),
	('Indianapolis 500', 'Aug 12-23, 2020', 12),
	('Indianapolis 500', 'Aug 12-23, 2020', 15),
	('Indianapolis 500', 'Aug 12-23, 2020', 10),
	('Indianapolis 500', 'Aug 12-23, 2020', 27),
	('Indianapolis 500', 'Aug 12-23, 2020', 30),
	('Indianapolis 500', 'Aug 12-23, 2020', 26),
	('Indianapolis 500', 'Aug 12-23, 2020', 21)
;

SELECT * FROM tbl_schedule
			INNER JOIN tbl_drivers ON tbl_schedule.car_number = tbl_drivers.car_number
;
