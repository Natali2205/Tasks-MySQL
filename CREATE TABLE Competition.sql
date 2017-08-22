Drop table if exists `Competition`;
CREATE TABLE `Competition`(
	`competition_id` INT(9) NOT NULL AUTO_INCREMENT,
	`competition_name` VARCHAR(255) NOT NULL,
	`world_record` INT(9) NOT NULL, 
	`set_date` DATETIME(6) NOT NULL,
	PRIMARY KEY(`competition_id`)
);
Drop table if exists `Resultsports`;
CREATE TABLE `Resultsports` (
    `result_id` INT(9) NOT NULL AUTO_INCREMENT,
    `sportsman_id` INT(9) NOT NULL,
    `competition_id` INT(9) NOT NULL,
    `results` INT(9) NOT NULL,
    `city` VARCHAR(255),
    `hold_date` DATETIME(6) NOT NULL,
    PRIMARY KEY (`result_id`)
    );
Drop table if exists `Sportsman`;
CREATE TABLE `Sportsman`(
	`sportsman_id` INT(9) NOT NULL AUTO_INCREMENT, 
	`sportsman_name` VARCHAR(255) NOT NULL,
	`rank` INT(9) NOT NULL,
	`year_of_birth` DATETIME(6) NOT NULL,
	`personal_record` INT(9) NOT NULL,
	`country` VARCHAR (255) NOT NULL,
    PRIMARY KEY (`sportsman_id`)
	);

INSERT INTO `Competition`
	(`competition_name` , `world_record` , `set_date` )
VALUES
	('run', '10.07', '1972-05-14'),
	('International run', '15','2016-02-12'),
	('run','9.86', '2010-05-12'),
	('International run', '12','2014-04-12'),
	('Regional run','13', '2000-05-12');

INSERT INTO `Resultsports`
	(`sportsman_id`,`competition_id`, `results`, `city`, `hold_date`)
VALUES
	('1', '13','1', 'Munich', '2014-06-13'),
	('2','10','2', 'United States', '2003-07-24'),
	('3','9','13','Moscov','2008-08-02'),
	('4','10','10', 'Moscov', '2010-05-12');

INSERT INTO `Sportsman`( `sportsman_name`, `rank`, `year_of_birth` , `personal_record`, `country`)
VALUES
('Valeriy Borzov','1','1949-09-15', '10.14','Ukraine'),
('Steve Williams','3','2000-04-12','15','United States'),
('Maurice Greene','1','1990-02-10', '25', 'Russia'),
('Claus Bill','3','2014-04-12', '25', 'Russia'),
('Pavel Ivanov','2','2010-05-15','12','United States');


SELECT*FROM `Sportsman`;

SELECT `competition_name`, `world_record` 
FROM `Competition`;

SELECT `sportsman_name`
FROM `Sportsman`
WHERE `year_of_birth` LIKE '1990%';

SELECT `competition_name`, `world_record`
FROM `Competition`
WHERE `set_date` ='2010-05-12' OR `set_date` ='2010-05-15';

SELECT `hold_date`
FROM `Resultsports`
WHERE `city`='Moscov' AND `results`='10';

SELECT `sportsman_name`
FROM `Sportsman`
WHERE `personal_record` <>'25';

SELECT `competition_name`
FROM `Competition`
WHERE `world_record`='15' AND `set_date` <>'2015-02-12';

SELECT `city`
FROM `Resultsports`
WHERE `results` IN ('13', '25', '17', '9');

SELECT `sportsman_name`
FROM `Sportsman`
WHERE `year_of_birth` LIKE '2000%' AND `rank` NOT IN ('3', '7', '9');

SELECT 76*(65− 150) AS `test`;

SELECT `hold_date`
FROM `Resultsports`
LEFT JOIN `Sportsman` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`
WHERE `city` LIKE '[M]%';

SELECT `hold_date`
FROM `Resultsports`
LEFT JOIN `Sportsman` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`
WHERE `sportsman_name` LIKE 'С%' AND `year_of_birth` NOT LIKE '%6';
 
SELECT `competition_name`
FROM `Competition`
WHERE `competition_name` LIKE '%International%' ;
 
SELECT DISTINCT `year_of_birth`
FROM `Sportsman`
GROUP BY `year_of_birth`;


SELECT COUNT(  `competition_id` ) 
FROM  `Competition` 
WHERE  `set_date` =  '2010-05-12';

SELECT MAX(`results`)
FROM `Resultsports`
WHERE `city`='Moscov';

SELECT MIN(`year_of_birth`)
FROM `Sportsman`
WHERE `rank`='1';


SELECT `sportsman_name`
FROM `Sportsman`
WHERE `personal_record` IN (SELECT `world_record`
							FROM `Competition`
							WHERE `set_date`='2014-04-12');
							
SELECT `competition_name`
FROM `Competition`
WHERE `set_date` IN (SELECT `hold_date`
							FROM `Resultsports`
							WHERE `city`='Moscov');

SELECT `year_of_birth`
FROM `Sportsman`
WHERE `personal_record`> (SELECT AVG(`results`) FROM `Resultsports`
       WHERE `city`='Moscov');							
					
SELECT `sportsman_name`
FROM `Sportsman`
WHERE `year_of_birth` IN (SELECT `set_date`
							FROM `Competition`
							WHERE `world_record`='12');					
							

SELECT CONCAT("спортсмен ", `sportsman_name`),CONCAT(" показав результат ", `results`), CONCAT("в місті ", `city`)	
FROM `Sportsman`
INNER JOIN `Resultsports` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`;



--27--
SELECT `sportsman_name`
FROM `Sportsman`
WHERE `rank`<(SELECT AVG(`rank`) FROM `Sportsman` WHERE `year_of_birth`='2000');
--тут повертає 0 рядків, хоч є 2000 рік і розряд вищий--
--28--						
SELECT *FROM ((`Sportsman`
INNER JOIN `Resultsports` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`)
INNER JOIN `Competition` ON `Competition`.`competition_id`=`Resultsports`.`competition_id`)
WHERE `personal_record`=`world_record`;
--0--
--29--
SELECT COUNT(`sportsman_name`)
FROM ((`Sportsman`
INNER JOIN `Resultsports` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`)
INNER JOIN `Competition` ON `Competition`.`competition_id`=`Resultsports`.`competition_id`)
WHERE `sportsman_name` LIKE '%Ivanov' AND `competition_name` LIKE 'Regional%';		
--0--

--30--
SELECT `city`
FROM `Resultsports`
LEFT JOIN `Competition` ON `Competition`.`competition_id`=`Resultsports`.`competition_id`
WHERE `world_record`=`results`;
--0--			
--31--
SELECT MIN(`rank`)
FROM `Sportsman`
--..--
--32--
--33--
SELECT `Sportsman_id`
FROM `Sportsman`
LEFT JOIN `Resultsports` ON `Sportsman`.`competition_id`=`Resultsports`.`competition_id`
WHERE (SELECT MAX(COUNT(`competition_id`)));
--..--

--34--
UPDATE   ((`Sportsman`
INNER JOIN `Resultsports` ON `Sportsman`.`sportsman_id`=`Resultsports`.`sportsman_id`)
INNER JOIN `Competition` ON `Competition`.`competition_id`=`Resultsports`.`competition_id`)
SET `rank`='1'
WHERE `personal_record`=`world_record`;

SELECT  DATEDIFF(year,`year_of_birth`,GETDATE()) as age
FROM `Sportsman`
LEFT JOIN `Resultsports` ON `Sportsman`.`competition_id`=`Resultsports`.`competition_id`
WHERE `city`='Moscov';
