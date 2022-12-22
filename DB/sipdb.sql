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
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `age`) VALUES (6, 'skaterboy', 1, 'skaterboy', 'user', 2, 'Tony', 'Hawk', 'data:image/jpeg;base64,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', 'LIkes to skateboard, probably also likes beer', 28);

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

