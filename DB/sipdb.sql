-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sipdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sipdb` ;

-- -----------------------------------------------------
-- Schema sipdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sipdb` DEFAULT CHARACTER SET utf8 ;
USE `sipdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(50) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(9) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `address_id` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(50) NULL,
  `image` TEXT NULL,
  `about_me` TEXT NULL,
  `age` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brew_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brew_type` ;

CREATE TABLE IF NOT EXISTS `brew_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer` ;

CREATE TABLE IF NOT EXISTS `beer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `brew_type_id` INT NOT NULL,
  `origin_city` TEXT NULL,
  `origin_state` VARCHAR(45) NOT NULL,
  `abv` DOUBLE NOT NULL,
  `description` TEXT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_brew_type1_idx` (`brew_type_id` ASC),
  CONSTRAINT `fk_beer_brew_type1`
    FOREIGN KEY (`brew_type_id`)
    REFERENCES `brew_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_tasting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_tasting` ;

CREATE TABLE IF NOT EXISTS `beer_tasting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `notes` TEXT NULL,
  `price` DOUBLE NOT NULL,
  `rating` INT NULL,
  `photo` TEXT NULL,
  `date_sampled` DATE NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_user1_idx` (`user_id` ASC),
  INDEX `fk_beer_tasting_beer1_idx` (`beer_id` ASC),
  CONSTRAINT `fk_journal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_tasting_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine_color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine_color` ;

CREATE TABLE IF NOT EXISTS `wine_color` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(20) NULL,
  `color` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine_type` ;

CREATE TABLE IF NOT EXISTS `wine_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `wine_color_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_wine_type_wine_color1_idx` (`wine_color_id` ASC),
  CONSTRAINT `fk_wine_type_wine_color1`
    FOREIGN KEY (`wine_color_id`)
    REFERENCES `wine_color` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine` ;

CREATE TABLE IF NOT EXISTS `wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `wine_type_id` INT NOT NULL,
  `image_url` TEXT NULL,
  `vineyard_name` VARCHAR(45) NULL,
  `vineyard_location` VARCHAR(45) NULL,
  `vintage_year` INT NULL,
  `abv` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wine_red_wine1_idx` (`wine_type_id` ASC),
  CONSTRAINT `fk_wine_red_wine1`
    FOREIGN KEY (`wine_type_id`)
    REFERENCES `wine_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spirit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spirit_type` ;

CREATE TABLE IF NOT EXISTS `spirit_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spirit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spirit` ;

CREATE TABLE IF NOT EXISTS `spirit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `spirit_type_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image_url` TEXT NULL,
  `proof` INT NULL,
  `origin_country` VARCHAR(45) NULL,
  `origin_state_province` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_spirits_spirits_type1_idx` (`spirit_type_id` ASC),
  CONSTRAINT `fk_spirits_spirits_type1`
    FOREIGN KEY (`spirit_type_id`)
    REFERENCES `spirit_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_brewery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location_brewery` ;

CREATE TABLE IF NOT EXISTS `location_brewery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT NULL,
  `image_url` TEXT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_location_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine_tasting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine_tasting` ;

CREATE TABLE IF NOT EXISTS `wine_tasting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `notes` TEXT NULL,
  `price` DOUBLE NOT NULL,
  `rating` INT NULL,
  `photo` TEXT NULL,
  `date_sampled` DATE NULL,
  `wine_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_user1_idx` (`user_id` ASC),
  INDEX `fk_wine_tasting_wine1_idx` (`wine_id` ASC),
  CONSTRAINT `fk_journal_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wine_tasting_wine1`
    FOREIGN KEY (`wine_id`)
    REFERENCES `wine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spirit_tasting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spirit_tasting` ;

CREATE TABLE IF NOT EXISTS `spirit_tasting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `notes` TEXT NULL,
  `price` DOUBLE NOT NULL,
  `rating` INT NULL,
  `photo` TEXT NULL,
  `date_sampled` DATE NULL,
  `spirit_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_user1_idx` (`user_id` ASC),
  INDEX `fk_spirit_tasting_spirit1_idx` (`spirit_id` ASC),
  CONSTRAINT `fk_journal_user100`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spirit_tasting_spirit1`
    FOREIGN KEY (`spirit_id`)
    REFERENCES `spirit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drinking_buddy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinking_buddy` ;

CREATE TABLE IF NOT EXISTS `drinking_buddy` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `friend_id`),
  INDEX `fk_user_has_user_user2_idx` (`friend_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_brew_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_brew_type` ;

CREATE TABLE IF NOT EXISTS `favorite_brew_type` (
  `user_id` INT NOT NULL,
  `brew_type_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `brew_type_id`),
  INDEX `fk_user_has_brew_type_brew_type1_idx` (`brew_type_id` ASC),
  INDEX `fk_user_has_brew_type_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_brew_type_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_brew_type_brew_type1`
    FOREIGN KEY (`brew_type_id`)
    REFERENCES `brew_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_spirit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_spirit_type` ;

CREATE TABLE IF NOT EXISTS `favorite_spirit_type` (
  `user_id` INT NOT NULL,
  `spirit_type_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `spirit_type_id`),
  INDEX `fk_user_has_spirit_type_spirit_type1_idx` (`spirit_type_id` ASC),
  INDEX `fk_user_has_spirit_type_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_spirit_type_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_spirit_type_spirit_type1`
    FOREIGN KEY (`spirit_type_id`)
    REFERENCES `spirit_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_wine_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_wine_type` ;

CREATE TABLE IF NOT EXISTS `favorite_wine_type` (
  `user_id` INT NOT NULL,
  `wine_type_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `wine_type_id`),
  INDEX `fk_user_has_wine_type_wine_type1_idx` (`wine_type_id` ASC),
  INDEX `fk_user_has_wine_type_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_wine_type_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_wine_type_wine_type1`
    FOREIGN KEY (`wine_type_id`)
    REFERENCES `wine_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS sipper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'sipper'@'localhost' IDENTIFIED BY 'sipper';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'sipper'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '123 Main St', 'Cityville', 'Texas', NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '621 Broadway Rd', 'Hanover', 'Utah', NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (3, '836 2nd St', 'Denver', 'Colorado', NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (4, '740 G St', 'Philadelphia', 'Pennsylvania', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (1, 'admin', 1, 'admin', 'ADMIN', 1, NULL, NULL, NULL, NULL, 100);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (2, 'bobloblaw', 1, 'bobloblaw', 'user', 2, 'Bob', 'Loblaw', NULL, NULL, 52);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (3, 'alexanderhamilton', 1, 'Alexander', 'user', 2, 'Alexander', 'Hamilton', NULL, NULL, 35);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (4, 'johnadams', 1, 'johnadams', 'user', 2, 'John', 'Adams', NULL, NULL, 48);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (5, 'samadams', 1, 'samadams', 'user', 2, 'Sam', 'Adams', NULL, NULL, 26);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (6, 'skaterboy', 1, 'skaterboy', 'user', 2, 'Tony', 'Hawk', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8h_pXUkASbiTcQj488-GMJCtUaZvXwO0gQA&usqp=CAU', 'LIkes to skateboard, probably also likes beer', 28);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brew_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `brew_type` (`id`, `name`) VALUES (1, 'Pilsner');
INSERT INTO `brew_type` (`id`, `name`) VALUES (2, 'Lager');
INSERT INTO `brew_type` (`id`, `name`) VALUES (3, 'IPA');
INSERT INTO `brew_type` (`id`, `name`) VALUES (4, 'Pale Ale');
INSERT INTO `brew_type` (`id`, `name`) VALUES (5, 'Stout');
INSERT INTO `brew_type` (`id`, `name`) VALUES (6, 'Porter');
INSERT INTO `brew_type` (`id`, `name`) VALUES (7, 'Bock');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (1, 'Bud Light Lime', 2, NULL, 'Texas', 4.2, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (2, 'Bud Light', 2, NULL, 'Texas', 4.2, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (3, 'Coors Light', 2, NULL, 'Colorado', 4.2, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (4, 'Dogfish Head 60 Minute IPA', 3, 'Milton', 'Delaware', 6.0, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (5 , 'Karbach Hopadillo', 3, 'Houston', 'Texas', 6.60, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (6, 'New Belgium Voodoo Ranger Impeial IPA', 3, 'Fort Collins', 'Colorado', 9, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (7, 'Stone Delicious IPA', 3, NULL, 'California', 7.5, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (8, 'Stone Hazy IPA ', 3, NULL, 'California', 6.7, '', NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (9, 'Alaskan Pilsner', 1, 'Juneau', 'Alaska', 4.8, NULL, NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (10, 'Dogfish Head Shelter Pale', 4, NULL, 'Delaware', 5, NULL, NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (11, 'Bells Juicy Gossip', 4, 'Kalamazoo', 'Michigan', 4.7, NULL, NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (12, 'Guinness Draught', 5, NULL, 'Ireland', 4.2, NULL, NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (13, 'Real Ale Coffee Porter', 6, 'Blanco', 'Texas', 6.6, NULL, NULL);
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`) VALUES (14, 'Live Oak Primus', 7, 'Del Valle', 'Texas', 8, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_tasting`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (1, 1, NULL, 9, NULL, NULL, '2022-12-22', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wine_color`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `wine_color` (`id`, `description`, `color`) VALUES (1, 'Sweet', 'Red');
INSERT INTO `wine_color` (`id`, `description`, `color`) VALUES (2, 'Sweet', 'White');
INSERT INTO `wine_color` (`id`, `description`, `color`) VALUES (3, 'Dry', 'Red');
INSERT INTO `wine_color` (`id`, `description`, `color`) VALUES (4, 'Dry', 'White');

COMMIT;


-- -----------------------------------------------------
-- Data for table `wine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (1, 'Pinot Noir', NULL, 1);
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (2, 'Merlot', NULL, 1);
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (3, 'Cabernet Sauvignon\n', NULL, 3);
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (4, 'Chardonnay', NULL, 4);
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (5, 'Pinot Grigio', NULL, 4);
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_color_id`) VALUES (6, 'Moscato', NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wine`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (1, 'Coppola', NULL, 3, NULL, 'Coppola Vineyard', 'California', 2017, 13.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (2, 'Decoy', NULL, 2, NULL, 'Decoy', 'California', 2019, 13.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (3, 'Bearfoot', NULL, 1, NULL, 'Bearfoot', 'California', 2018, 13.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (4, 'Vonterra', NULL, 4, NULL, 'Copeland', 'California', 2020, 13.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (5, 'Bella Sera', NULL, 5, NULL, NULL, 'Italy', 2021, 11.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (6, 'Capa', NULL, 6, NULL, NULL, 'Spain', 2020, 11);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (7, 'Beringer Founder\'s Estate', NULL, 3, NULL, NULL, 'California', 2020, 13.8);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (8, 'Kendall Jackson Vintner\'s Reserve ', NULL, 4, NULL, 'Kendall-Jackson', 'California', 2021, 13.5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spirit_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `spirit_type` (`id`, `name`) VALUES (1, 'Whiskey');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (2, 'Bourbon');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (3 , 'Vodka');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (4, 'Gin');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (5, 'Rum');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (6, 'Tequila');
INSERT INTO `spirit_type` (`id`, `name`) VALUES (7, 'Scotch');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spirit`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (1, 3, 'Tito\'s', NULL, NULL, 80, 'United States', 'Texas');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (2, 1, 'Jack Daniel\'s', NULL, NULL, 80, 'United States', 'Tennessee');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (3, 2, 'Bulleit', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (4, 4, 'Hendrick\'s', NULL, NULL, 80, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (5, 5, 'Captain Morgan', NULL, NULL, 70, 'Jamaica', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (6, 6, 'Don Juilo', NULL, NULL, 80, 'Mexico', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (7, 7, 'Glenfiddich', NULL, NULL, 80, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (8, 3, 'Grey Goose', NULL, NULL, 80, 'France', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (9, 3, 'Smirnoff', NULL, NULL, 80, 'United States', 'Illinois');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (10, 3, 'Absolut', NULL, NULL, 80, 'Sweden', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (11, 3, 'Kettle One', NULL, NULL, 80, 'Netherlands', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (12, 4, 'Bombay Sapphire', NULL, NULL, 94, 'England', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (13, 4, 'Gordon\'s', NULL, NULL, 75, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (14, 4, 'Tanqueray', NULL, NULL, 94.6, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (15, 4, 'Beefeater', NULL, NULL, 80, 'England', 'London');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (16, 5, 'Bacardi', NULL, NULL, 80, 'Cuba', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (17, 5, 'Malibu', NULL, NULL, 42, 'Barbados', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (18, 5, 'Don Q', NULL, NULL, 80, 'United States', 'Puerto Rico');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (19, 5, 'Appleton', NULL, NULL, 80, 'Jamaica', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (20, 1, 'Makers Mark', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (21, 1, 'Jameson', NULL, NULL, 80, 'Ireland', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (22, 1, 'Evan Williams', NULL, NULL, 86, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (23, 1, 'Jim Bean', NULL, NULL, 80, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (24, 2, 'Buffalo Trace', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (25, 2, 'Angels Envy', NULL, NULL, 87, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (26, 2, 'Knob Creek', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (27, 2, 'Elijah Craig', NULL, NULL, 94, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (28, 6, 'Casamigos', NULL, NULL, 80, 'Mexico', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (29, 6, 'Epsolon', NULL, NULL, 80, 'Mexico', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (30, 6, 'Milagro', NULL, NULL, 80, 'Mexico', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (31, 6, 'Patron', NULL, NULL, 80, 'Mexico', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (32, 7, 'Glenlivet', NULL, NULL, 80, 'Scotland', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (33, 7, 'Macallon', NULL, NULL, 86, 'Scotland', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (34, 7, 'Dewars', NULL, NULL, 80, 'Scotland', 'NULL');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (35, 7, 'Johnnie Walker', NULL, NULL, 80, 'Scotland', 'NULL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_brewery`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `location_brewery` (`id`, `name`, `description`, `image_url`, `address_id`) VALUES (1, 'Bob\'s Brews', NULL, NULL, 1);
INSERT INTO `location_brewery` (`id`, `name`, `description`, `image_url`, `address_id`) VALUES (2, 'Casey\'s Brewery', NULL, NULL, 2);
INSERT INTO `location_brewery` (`id`, `name`, `description`, `image_url`, `address_id`) VALUES (3, 'The Revolution', NULL, NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wine_tasting`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (1, 1, NULL, 8, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spirit_tasting`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (1, 1, NULL, 10, NULL, NULL, '2022-12-23', 1);

COMMIT;

