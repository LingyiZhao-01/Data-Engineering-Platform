create database lego_final_normalized;
use lego_final_normalized;

CREATE TABLE themes (
theme_id INT NOT NULL,
theme_name VARCHAR(255) NULL,
parent_id VARCHAR(255) NULL,
	PRIMARY KEY (`theme_id`)
);

CREATE TABLE sets (
set_id INT NOT NULL,
name VARCHAR(255) NULL,
year VARCHAR(255) NULL,
theme_id INT NULL,
num_parts VARCHAR(255) NULL,
	PRIMARY KEY (set_id),
    FOREIGN KEY (`theme_id`)
    REFERENCES `lego_final_normalized`.`themes` (`theme_id`)
);

CREATE TABLE inventory (
inventory_id INT NOT NULL,
version VARCHAR(255) NULL,
set_num INT NULL,
PRIMARY KEY (`inventory_id`),
    FOREIGN KEY (`set_num`)
    REFERENCES `lego_final_normalized`.`sets` (`set_id`)
);

CREATE TABLE inventory_sets (
inventory_id INT NULL,
set_id INT NULL,
quantity VARCHAR(255) NULL,
	FOREIGN KEY (`inventory_id`)
    REFERENCES `lego_final_normalized`.`inventory` (`inventory_id`),
	FOREIGN KEY (`set_id`)
    REFERENCES `lego_final_normalized`.`sets` (`set_id`)
);

CREATE TABLE part_category (
category_id INT NOT NULL,
category_name VARCHAR(255) NULL,
PRIMARY KEY (`category_id`)
);


CREATE TABLE parts (
part_id VARCHAR(255) NOT NULL,
part_name VARCHAR(255) NULL,
category_id INT NULL,
	PRIMARY KEY (`part_id`),
	FOREIGN KEY (`category_id`)
    REFERENCES `lego_final_normalized`.`part_category` (`category_id`)
);


CREATE TABLE colors (
color_id INT NOT NULL,
color_name VARCHAR(255) NULL,
rgb VARCHAR(255) NULL,
is_trans VARCHAR(255) NULL,
	PRIMARY KEY (`color_id`)
);

CREATE TABLE inventory_parts (
inventory_id INT NOT NULL,
part_id VARCHAR(255) NULL,
color_id INT NULL,
quantity VARCHAR(255) NULL,
is_spare VARCHAR(255) NULL,
    FOREIGN KEY (`color_id`)
    REFERENCES `lego_final_normalized`.`colors` (`color_id`),
    FOREIGN KEY (`inventory_id`)
    REFERENCES `lego_final_normalized`.`inventory` (`inventory_id`),
    FOREIGN KEY (`part_id`)
    REFERENCES `lego_final_normalized`.`parts` (`part_id`)
);

CREATE TABLE country (
country_id INT NOT NULL,
country_name VARCHAR(255) NULL,
primary key (`country_id`)
);

CREATE TABLE age_info (
age_range_id INT NOT NULL,
age_range VARCHAR(255) NULL,
primary key (`age_range_id`)
);

CREATE TABLE review_difficulty_info (
review_difficulty_id INT NOT NULL,
review_difficulty VARCHAR(255) NULL,
primary key (`review_difficulty_id`)
);

CREATE TABLE lego_sets (
age_range_id INT NULL,
list_price VARCHAR(255) NULL,
piece_count INT NULL,
prod_desc VARCHAR(255) NULL,
set_id INT NULL,
review_difficulty_id INT NULL,
set_name VARCHAR(255) NULL,
star_rating VARCHAR(255) NULL,
theme_id INT NULL,
country_id INT NULL,
    FOREIGN KEY (`set_id`)
    REFERENCES `lego_final_normalized`.`sets` (`set_id`),
    FOREIGN KEY (`theme_id`)
    REFERENCEs `lego_final_normalized`.`themes` (`theme_id`),
    FOREIGN KEY (`country_id`)
    REFERENCEs `lego_final_normalized`.`country` (`country_id`),
    FOREIGN KEY (`age_range_id`)
    REFERENCEs `lego_final_normalized`.`age_info` (`age_range_id`),
    FOREIGN KEY (`review_difficulty_id`)
    REFERENCES `lego_final_normalized`.`review_difficulty_info`(`review_difficulty_id`)
);




