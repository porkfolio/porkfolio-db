-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

DROP TABLE IF EXISTS `porkfolio`.`recipeIngredient`;


DROP TABLE IF EXISTS `porkfolio`.`inventory`;


DROP TABLE IF EXISTS `porkfolio`.`recipe`;


DROP TABLE IF EXISTS `porkfolio`.`ingredient`;


DROP TABLE IF EXISTS `porkfolio`.`user`;



DROP SCHEMA IF EXISTS `porkfolio`;

CREATE SCHEMA IF NOT EXISTS `porkfolio`;


-- ************************************** `porkfolio`.`user`

CREATE TABLE IF NOT EXISTS `porkfolio`.`user`
(
 `userId`   integer NOT NULL AUTO_INCREMENT ,
 `userName` varchar(200) NOT NULL ,

PRIMARY KEY (`userId`)
);






-- ************************************** `porkfolio`.`recipe`

CREATE TABLE IF NOT EXISTS `porkfolio`.`recipe`
(
 `recipeId`   integer NOT NULL AUTO_INCREMENT ,
 `recipeName` varchar(200) NOT NULL ,
 `userId`     integer NOT NULL ,

PRIMARY KEY (`recipeId`),
KEY `fkIdx_35` (`userId`),
CONSTRAINT `FK_35` FOREIGN KEY `fkIdx_35` (`userId`) REFERENCES `porkfolio`.`user` (`userId`)
);






-- ************************************** `porkfolio`.`ingredient`

CREATE TABLE IF NOT EXISTS `porkfolio`.`ingredient`
(
 `ingredientId`   integer NOT NULL AUTO_INCREMENT ,
 `ingredientName` varchar(200) NOT NULL ,
 `userId`         integer NOT NULL ,

PRIMARY KEY (`ingredientId`),
KEY `fkIdx_76` (`userId`),
CONSTRAINT `FK_76` FOREIGN KEY `fkIdx_76` (`userId`) REFERENCES `porkfolio`.`user` (`userId`)
);






-- ************************************** `porkfolio`.`recipeIngredient`

CREATE TABLE IF NOT EXISTS `porkfolio`.`recipeIngredient`
(
 `recipeIngredientId` integer NOT NULL AUTO_INCREMENT ,
 `recipeId`           integer NOT NULL ,
 `ingredientId`       integer NOT NULL ,
 `quantity`           integer NOT NULL ,
 `unit`               varchar(45) NOT NULL ,

PRIMARY KEY (`recipeIngredientId`),
KEY `fkIdx_68` (`recipeId`),
CONSTRAINT `FK_68` FOREIGN KEY `fkIdx_68` (`recipeId`) REFERENCES `porkfolio`.`recipe` (`recipeId`),
KEY `fkIdx_71` (`ingredientId`),
CONSTRAINT `FK_71` FOREIGN KEY `fkIdx_71` (`ingredientId`) REFERENCES `porkfolio`.`ingredient` (`ingredientId`)
);






-- ************************************** `porkfolio`.`inventory`

CREATE TABLE IF NOT EXISTS `porkfolio`.`inventory`
(
 `inventoryId`  integer NOT NULL AUTO_INCREMENT ,
 `ingredientId` integer NOT NULL ,
 `expireDate`   date NOT NULL ,
 `purchaseDate` date NOT NULL ,
 `quantity`     integer NOT NULL ,
 `unit`         varchar(45) NOT NULL ,

PRIMARY KEY (`inventoryId`),
KEY `fkIdx_56` (`ingredientId`),
CONSTRAINT `FK_56` FOREIGN KEY `fkIdx_56` (`ingredientId`) REFERENCES `porkfolio`.`ingredient` (`ingredientId`)
);





