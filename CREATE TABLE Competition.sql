CREATE TABLE Competition(
competition_id int,
 competition_name varchar(255),
  world_record int, 
set_date int,
);


CREATE TABLE Result(
competition_id int,
 sportsman_id int, 
 result int, 
 city varchar(255),
 hold_date int,
);

CREATE TABLE Sportsman(
sportsman_id int, 
sportsman_name varchar(255),
rank int,
year_of_birth int,
 personal_record int, 
 country varchar(255)
);

INSERT INTO Competition(competition_id , competition_name , world_record , set_date )
VALUES
('01','run', '10.07', 14-05-1972),
('02','International run', '15','12-02-2015'),
('04','run','9.86', '12-05-2010');

INSERT INTO Result(competition_id, sportsman_id, result int, city, hold_date)
VALUES
('01', '1002', '13',' 'Munich', '13 June 2014'),
('02','0101','10', 'United States', '24 August 2003'),
('03','0103','9','Moscov','2 September 2008);

INSERT INTO Sportsman( sportsman_id int, sportsman_name int, rank int, year_of_birth int, personal_record, country varchar)
VALUES
('1002','Valeriy Borzov','1','1949', '10.14','Ukraine'),
('1001','Steve Williams','3','1953','15','United States'),
('1003','Maurice Greene','1','1990', '25', 'Russia');

SELECT*FROM Sportsman;

SELECT competition_name, world_record 
FROM Competition;

SELECT sportsman_name
FROM Sportsman
WHERE year_of_birth='1990';

SELECT competition_name, world_record,
FROM Competetions
WHERE set_date ='12-05-2010' OR set_date ='15-05-2010';

SELECT hold_date 
FROM Result
WHERE city='Moscov' AND result='10';

SELECT sportsman_name
FROM Sportsman
WHERE personal_record <>'25';

SELECT competition_name
FROM Competition
WHERE world_record='15' AND set_date <>'12-02-2015';

SELECT city
FROM Result
WHERE result IN ('13', '25', '17', '9');

SELECT sportsman_name
FROM Sportsman
WHERE year_of_birth int='2000' AND rank NOT IN ('3', '7', '9');

SELECT 76*(65−150);

SELECT hold_date
FROM Result
WHERE LEFT(City, 1)='М';

SELECT hold_date 
FROM Sportsman
 WHERE sportsman_name like 'С%' AND year_of_birth NOT LIKE '%6';
 
 SELECT competition_name
 FROM Competetions
 WHERE competition_name like '%международные%' desc;
 
 SELECT year_of_birth
 FROM Sportsman
 GROUP BY year_of_birth
 FROM `table` GROUP BY name


