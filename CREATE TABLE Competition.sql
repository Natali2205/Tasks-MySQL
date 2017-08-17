CREATE TABLE `Competition`(
	`PK_competition_id` INT(9) NOT NULL AUTO_INCREMENT,
	`competition_name` varchar(255) NOT NULL,
	`world_record` INT(9) NOT NULL, 
	`set_date` INT(9) NOT NULL,
	PRIMARY KEY(`PK_competition_id`)
);

CREATE TABLE `Resultsports` (
    `FK_competition_id` INT(9) NOT NULL AUTO_INCREMENT,
    `sportsman_id` int(9) NOT NULL,
    `result` int(9) NOT NULL,
    `city` varchar(255),
    `hold_date` int(9) NOT NULL,
    PRIMARY KEY (`sportsman_id`),
    FOREIGN KEY (`FK_competition_id`) REFERENCES Competition (`PK_competition_id`)
    );

CREATE TABLE `Sportsman`(
	`sportsman_id` int(9) NOT NULL AUTO_INCREMENT, 
	`sportsman_name` varchar(255) NOT NULL,
	`rank` int(9) NOT NULL,
	`year_of_birth` int NOT NULL,
	`personal_record` int NOT NULL,
	`country` varchar(255) NOT NULL,
	FOREIGN KEY (`FK_sportsman_id`) REFERENCES `Resultsports`(`FK_sportsman_id`)
	);

INSERT INTO Competition
	(`competition_name` , `world_record` , `set_date` )
VALUES
	('run', '10.07', '1972-05-14'),
	('International run', '15','2015-02-12'),
	('run','9.86', '2010-05-12');

INSERT INTO `resultsport`
	(`sportsman_id`, `results`, `city`, `hold_date`)
VALUES
	('101', '13', 'Munich', '2014-06-13'),
	('102','10', 'United States', '2003-07-24'),
	('103','9','Moscov','2008-08-02');

INSERT INTO Sportsman( `sportsman_name`, `rank`, `year_of_birth` , `personal_record`, `country`)
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
WHERE year_of_birth='2000' AND rank NOT IN ('3', '7', '9');

SELECT 76*(65− 150) as test;

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

SELECT COUNT(competition_id)
FROM Competetions
WHERE set_date='12-05-2014';

SELECT MAX(result)
FROM Result
WHERE city='Moscov';

SELECT MIN(year_of_birth)
FROM Sportsman
WHERE rank='1';

SELECT sportsman_id
FROM Sportsman LEFT JOIN Competition
WHERE personal_record --set_date='2014-04-12';

