CREATE DATABASE IF NOT EXISTS Jaunty_Coffee;
USE jaunty_coffee;
CREATE TABLE IF NOT EXISTS `coffee_shop` (
	`shop_id` INT,
    `shop_name` VARCHAR(50),
    `city` VARCHAR(50),
    `state` CHAR(2),
    PRIMARY KEY (`shop_id`)
);
    INSERT INTO `coffee_shop` VALUES ('11','Jaunty Coffee','Atlanta','GA');
	INSERT INTO `coffee_shop` VALUES ('22','Jaunty Coffee','Savannah','GA');
	INSERT INTO `coffee_shop` VALUES ('33','Jaunty Coffee','Valdosta','GA');

CREATE TABLE IF NOT EXISTS `supplier` (
	`supplier_id` INT,
    `company_name` VARCHAR (50),
    `country` VARCHAR (30),
    `sales_contact_name` VARCHAR(60),
    `email` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`supplier_id`)
    );
	INSERT INTO `supplier` VALUES ('111','Supplier Coffee','United States','Patrick Green','patrick.green@suppliercoffee.com');
	INSERT INTO `supplier` VALUES ('222','Express Coffee','United States','Tina Turner','tina.turner@expresscoffee.com');
	INSERT INTO `supplier` VALUES ('333','Wholesale Coffee','United States','James Howard','james.howard@wholesalecoffee.com');
    
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` INT,
  `first_name` VARCHAR(30),
  `last_name` VARCHAR(30),
  `hire_date` DATE,
  `job_title` VARCHAR(30),
  `shop_id` INT,
    PRIMARY KEY (`employee_id`),
    FOREIGN KEY (`shop_id`) REFERENCES `coffee_shop` (`shop_id`) 
    );
    INSERT INTO `employee` VALUES ('1','Jake','Thompson','2018-10-1','IT Support', '11');
	INSERT INTO `employee` VALUES ('2','Kim','Johnson','2018-10-1','IT Support', '22');
	INSERT INTO `employee` VALUES ('3','Bobby','Samuel','2018-10-1','IT Support', '33');
    
CREATE TABLE IF NOT EXISTS `coffee` (
	`coffee_id` INT,
    `shop_id` INT,
    `supplier_id` INT,
    `coffee_name` VARCHAR(30),
    `price_per_pound` NUMERIC(5,2),
    PRIMARY KEY (`coffee_id`),
    FOREIGN KEY (`shop_id`) REFERENCES `coffee_shop` (`shop_id`),
	FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
    );
	INSERT INTO `coffee` VALUES ('1111','11','111','Jaunty Regular','1.99');
	INSERT INTO `coffee` VALUES ('2222','22','222','Jaunty Strong','2.49');
	INSERT INTO `coffee` VALUES ('3333','33','333','Jaunty Decaf','1.79');
    
CREATE VIEW `employee_view` AS
SELECT *
FROM `employee`;

CREATE VIEW `employee_full_name` AS
SELECT CONCAT_WS(' ', `first_name`, `last_name`)
FROM `employee`;

CREATE INDEX `coffee_index`
ON `coffee` (`coffee_name`);

SELECT *
FROM `coffee`
WHERE `shop_id` = '11';

SELECT *
FROM `coffee`
INNER JOIN `coffee_shop`
ON coffee.shop_id = coffee_shop.shop_id
INNER JOIN `employee`
ON coffee.shop_id = employee.shop_id;




