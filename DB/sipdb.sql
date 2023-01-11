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
  `enabled` TINYINT NULL DEFAULT 1,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL DEFAULT 'user',
  `address_id` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(50) NULL,
  `image` TEXT NULL,
  `about_me` TEXT NULL,
  `over_twenty_one` TINYINT NOT NULL,
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
  `brewing_company` VARCHAR(100) NULL,
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
-- Table `wine_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine_type` ;

CREATE TABLE IF NOT EXISTS `wine_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `wine_scale` VARCHAR(10) NULL,
  `wine_color` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine` ;

CREATE TABLE IF NOT EXISTS `wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
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
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (1, 'admin', 1, 'admin', 'ADMIN', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (2, 'bobloblaw', 1, 'bobloblaw', 'user', 2, 'Bob', 'Loblaw', 'https://media.licdn.com/dms/image/C4D03AQF9dPQ32e4R4Q/profile-displayphoto-shrink_800_800/0/1517505558841?e=2147483647&v=beta&t=4zRpUnhJtDrTYbOxmel7rr9uHApLUQHbKMyg72JJ4vE', 'Bluth family attorney -- \"You don\'t need double talk; you need Bob Loblaw.\"', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (3, 'alexanderhamilton', 1, 'alexander', 'user', 2, 'Alexander', 'Hamilton', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5CzE69ALQdfl8w717R_Fr5NM8kZbuZ5MONA&usqp=CAU', 'One of the founding fathers of the United States. Fought in the American Revolutionary War, helped draft the Constitution, served as the first secretary of treasury. Recent Broadway Star. ', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (4, 'johnadams', 1, 'johnadams', 'user', 2, 'John', 'Adams', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK0SzlrdfPim6uAwgdXVuc-wjFxhKBE-jbUA&usqp=CAU', 'Second President of the United States. Wrote thousands of love letters to his wife. Avid lover of frisbee golf. ', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (5, 'samadams', 1, 'samadams', 'user', 2, 'Sam', 'Adams', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIWBv6WTjpG4lCtswdSbzMEHs2ROnWMSWbMA&usqp=CAU', 'Founder of \"The Sons of Liberty.\" First to propose a Continental Congress. Makes a pretty ok beer.', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (6, 'skaterboy', 1, 'skaterboy', 'user', 2, 'Tony', 'Hawk', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8h_pXUkASbiTcQj488-GMJCtUaZvXwO0gQA&usqp=CAU', 'LIkes to skateboard, probably also likes beer', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (7, 'lauren', 1, 'lauren', 'ADMIN', NULL, 'Lauren', 'Ackley', 'https://i.imgur.com/VwIqFYH.jpg', 'Likes merlot wine, and cats', 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (8, 'Boozer21', 1, 'hello', 'ADMIN', NULL, 'Casey', 'Froehlich', NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (9, 'Beast', 1, 'east', 'ADMIN', NULL, 'Lowell', 'Belany', NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (10, 'john', 1, 'john', 'ADMIN', NULL, 'John', 'Nichols', NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (11, 'disabled', 0, 'disabled', 'user', NULL, 'Disabled', 'Person', NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`, `address_id`, `first_name`, `last_name`, `image`, `about_me`, `over_twenty_one`) VALUES (12, 'under21', 1, 'under21', 'user', NULL, 'Test', 'Test', NULL, NULL, 0);

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
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (1, 'Bud Light Lime', 2, NULL, 'Texas', 4.2, 'This is an American style light lager that combines the superior drinkability of Bud Light with a splash of 100% lime flavor. It has a delicate malt sweetness, a clean, crisp finish and the taste of fresh-squeezed lime for ultimate refreshment.', NULL, 'Anheuser-Busch');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (2, 'Bud Light', 2, NULL, 'Texas', 4.2, 'Bud Light is a light-bodied beer featuring a fresh, clean taste with a subtle hop aroma, delicate malt sweetness and a crisp finish that delivers the ultimate refreshment.', NULL, 'Anheuser-Busch');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (3, 'Coors Light', 2, NULL, 'Colorado', 4.2, 'Coors Light is a natural light lager beer that delivers Rocky Mountain cold refreshment.', NULL, 'Molson Coors');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (4, 'Dogfish Head 60 Minute IPA', 3, 'Milton', 'Delaware', 6.0, 'This quintessential American IPA is brewed with Warrior, Amarillo & \'Mystery Hop X.\' It is a powerful East Coast I.P.A. with a lot of citrusy hop character with hints of floral and orange.', NULL, 'Dogfish Head Brewery');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (5 , 'Karbach Hopadillo', 3, 'Houston', 'Texas', 6.60, 'Pours a deep amber orange with a thick, creamy white head and big aromas of grapefruit, pine and some sweet breadiness. Citrus flavor followed by pine, caramel malts and a bit of bread. Finishes with a hoppy citrus kick.', NULL, 'Karbach Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (6, 'New Belgium Voodoo Ranger Impeial IPA', 3, 'Fort Collins', 'Colorado', 9, 'Bursting with tropical aromas and juicy fruit flavors from Mosaic and Amarillo hops, this golden IPA is perfectly bitter with a refreshing finish.', NULL, 'New Belgium Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (7, 'Stone Delicious IPA', 3, NULL, 'California', 7.5, 'Enjoy all of the bitter, piney & citrusy flavors of an IPA without the gluten. This beer offers a delightful blend of hop flavors balanced by subtle hints of sweet malts.', NULL, 'Stone Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (8, 'Stone Hazy IPA ', 3, NULL, 'California', 6.7, 'Blooming with bold, juicy flavors. This amazingly hazy IPA features El Dorado & Azacca hops which bring tons of citrus & fruit elements while intense Sabro hops highlight the tropical notes of this beer.', NULL, 'Stone Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (9, 'Alaskan Pilsner', 1, 'Juneau', 'Alaska', 4.8, 'Clean and crisp, Alaskan Pilsner is golden straw in color with a fluffy white head. Its slight malty sweetness finishes with a moderate bitterness that doesn’t linger. This artful balance makes each sip better than the last.', NULL, 'Alaskan Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (10, 'Dogfish Head Shelter Pale', 4, NULL, 'Delaware', 5, 'This is the original Dogfish Head brew and it\'s highly drinkable beer. Shelter Pale Ale is brewed with a premium barley and whole-leaf Glacial & Warrior hops. It has a fine malt backbone and a slightly nutty flavor. A versatile, quaffable beer.', NULL, 'Dogfish Head Brewery');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (11, 'Bell\'s Juicy Gossip', 4, 'Kalamazoo', 'Michigan', 4.7, NULL, NULL, 'Bell\'s Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (12, 'Guinness Draught', 5, NULL, 'Ireland', 4.2, NULL, NULL, 'Guinness');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (13, 'Real Ale Coffee Porter', 6, 'Blanco', 'Texas', 6.6, NULL, NULL, 'Real Ale Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (14, 'Live Oak Primus', 7, 'Del Valle', 'Texas', 8, NULL, NULL, 'Live Oak Brewing Company');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `description`, `image_url`, `brewing_company`) VALUES (15, 'Lost IPA', 3, 'Berlin', 'Maryland', 7.2, 'West coast style IPA. Clean and dry with hops prevalent in the aroma and flavor. We were lost...and now we are in love.', NULL, 'Burley Oak Brewing Company');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_tasting`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (1, 1, NULL, 9, 1, NULL, '2022-12-22', 1);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (2, 2, 'Fancy, hoppy', 4, 8, NULL, '2023-01-03', 5);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (3, 2, 'Very bad, not my favorite', 5, 2, NULL, '2022-08-12', 1);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (4, 3, 'Too sweet', 7, 3, NULL, '2022-10-01', 11);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (5, 3, 'Amazing, my favorite', 5, 9, NULL, '2022-06-23', 14);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (6, 4, NULL, 6, 2, NULL, '2022-11-30', 6);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (7, 5, NULL, 12, 3, NULL, '2022-05-30', 8);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (8, 6, NULL, 13, 4, NULL, '2022-12-08', 9);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (9, 8, 'Hoppy, bright, juicy', 7, 7, NULL, '2017-07-26', 4);
INSERT INTO `beer_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `beer_id`) VALUES (10, 8, 'Beach beers! Top 5 favorite IPAs', 6, 9, 'data:image/jpeg;base64,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', '2018-08-10', 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (1, 'Pinot Noir', NULL, 'Dry', 'Red');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (2, 'Merlot', NULL, 'Dry', 'Red');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (3, 'Cabernet Sauvignon\n', NULL, 'Dry', 'Red');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (4, 'Chardonnay', NULL, 'Dry', 'White');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (5, 'Pinot Grigio', NULL, 'Semi-Sweet', 'White');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (6, 'Moscato', NULL, 'Sweet', 'White');
INSERT INTO `wine_type` (`id`, `name`, `description`, `wine_scale`, `wine_color`) VALUES (7, 'Rosé', NULL, 'Dry', 'Pink');

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
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (9, 'Gerard Bertrand Cote des Roses', NULL, 7, NULL, 'Languedoc', 'Grance', 2019, 13);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (10, 'Rev', 'Multi-vintage and multi-vineyard blend of 35% Cabernet Frac, 25% Cabernet Sauvignon, 25% Chambourcin, and 15% Petit Verdot. Aged in oak barrels for up to 36 months.', 2, NULL, 'Old Westminster Winery', 'Maryland', 2018, 13.5);
INSERT INTO `wine` (`id`, `name`, `description`, `wine_type_id`, `image_url`, `vineyard_name`, `vineyard_location`, `vintage_year`, `abv`) VALUES (11, 'Rebel Red', 'Sweet concord blend is our most popular red wine. The taste resembles that of a freshly picked grape.', 1, NULL, 'Adams County Winery', 'Gettysbury, PA', 2018, 12);

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
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (21, 1, 'Jameson', NULL, NULL, 80, 'Ireland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (22, 1, 'Evan Williams', NULL, NULL, 86, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (23, 1, 'Jim Bean', NULL, NULL, 80, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (24, 2, 'Buffalo Trace', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (25, 2, 'Angels Envy', NULL, NULL, 87, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (26, 2, 'Knob Creek', NULL, NULL, 90, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (27, 2, 'Elijah Craig', NULL, NULL, 94, 'United States', 'Kentucky');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (28, 6, 'Casamigos', NULL, NULL, 80, 'Mexico', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (29, 6, 'Epsolon', NULL, NULL, 80, 'Mexico', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (30, 6, 'Milagro', NULL, NULL, 80, 'Mexico', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (31, 6, 'Patron', NULL, NULL, 80, 'Mexico', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (32, 7, 'Glenlivet', NULL, NULL, 80, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (33, 7, 'Macallon', NULL, NULL, 86, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (34, 7, 'Dewars', NULL, NULL, 80, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (35, 7, 'Johnnie Walker', NULL, NULL, 80, 'Scotland', NULL);
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (36, 1, 'Dad\'s Hat Rye', 'Our classic rye recipe features only rye grain and malt to deliver a pure expression of Pennsylvania Rye Whiskey. Barrel aging for least six months in charred, new oak quarter casks allows the genuine rye flavor to evolve quickly. As a result, the small batch whiskey is ensured of reaching the right balance of complexity and smoothness. The final product is a very smooth spirit that delivers the up-front spice that rye is known for while finishing with a full, round mouthfeel.', NULL, 80, 'United States', 'Pennsylvania');
INSERT INTO `spirit` (`id`, `spirit_type_id`, `name`, `description`, `image_url`, `proof`, `origin_country`, `origin_state_province`) VALUES (37, 1, 'McLaughlin Devil\'s Juice #5', 'You have never tasted anything like our Devil\'s Juice #5. It starts with our artisan whiskey aged in a used bourbon barrel and flavored with toasted hickory wood. It\'s flavor intensity is off the charts and hits you like a punch in the face. If bourbon is a 7 out of 10 on a flavor intensity scale, Devil\'s Juice #5 is a 28. Not for the faint hearted but it is a favorite of seasoned whiskey drinkers. Distilled from grain.', NULL, 120, 'United States', 'Pennsylvania');

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
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (1, 1, NULL, 8, 8, NULL, '2022-12-25', 1);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (2, 5, NULL, 4, 7, NULL, '2022-12-15', 3);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (3, 4, NULL, 8, 9, NULL, '2022-02-18', 8);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (4, 5, NULL, 12, 5, NULL, '2022-07-06', 7);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (5, 6, NULL, 8, 4, NULL, '2022-11-14', 2);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (6, 2, NULL, 10, 9, NULL, '2022-11-09', 3);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (7, 3, NULL, 11, 10, NULL, '2022-05-12', 4);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (8, 7, 'My absolute favorite wine from when I worked at a bar!', 12, 10, NULL, '2021-08-21', 8);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (9, 8, 'Sampled in green house and Lindsay\'s birthday!', 10, 7, 'https://www.wine-searcher.com/images/labels/82/49/11178249.jpg?width=260&height=260&fit=bounds&canvas=260,260', '2023-01-07', 10);
INSERT INTO `wine_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `wine_id`) VALUES (10, 8, 'Spooky Wine!', 8, 7, 'data:image/jpeg;base64,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', '2018-08-31', 11);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spirit_tasting`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (1, 1, NULL, 10, 3, NULL, '2022-12-23', 1);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (2, 4, 'Excellent', 12, 9, NULL, '2022-12-29', 20);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (3, 4, 'Too sweet, kind of watery', 5, 3, NULL, '2022-12-26', 17);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (4, 5, NULL, 8, 7, NULL, '2022-10-15', 23);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (5, 2, NULL, 7, 4, NULL, '2018-09-18', 8);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (6, 3, NULL, 6, 8, NULL, '2022-05-19', 15);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (7, 2, NULL, 9, 7, NULL, '2023-01-02', 16);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (8, 6, NULL, 6.89, 9, NULL, '2022-03-06', 5);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (9, 3, NULL, 13, 6, NULL, '2022-09-13', 20);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (10, 5, NULL, 10, 7, NULL, '2022-07-15', 29);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (11, 8, 'Christmas gift from Cory & Julie', 11, 8, 'https://dadshatrye.com/wp-content/uploads/clsc-overhead-2020.png', '2022-12-25', 36);
INSERT INTO `spirit_tasting` (`id`, `user_id`, `notes`, `price`, `rating`, `photo`, `date_sampled`, `spirit_id`) VALUES (12, 8, 'Sampled at Strip District in Pittsburgh visiting Ian.', 15, 9, 'data:image/jpeg;base64,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', '2022-08-16', 37);

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
-- Data for table `drinking_buddy`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (2, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (3, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (5, 2);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (1, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (2, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (2, 5);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (2, 6);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 2);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 5);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 6);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 7);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 9);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 2);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 5);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 6);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 8);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 9);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 2);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 5);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 6);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 7);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 8);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (9, 10);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 2);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 3);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 4);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 5);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 6);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 7);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 8);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (10, 9);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (7, 10);
INSERT INTO `drinking_buddy` (`user_id`, `friend_id`) VALUES (8, 10);

COMMIT;

