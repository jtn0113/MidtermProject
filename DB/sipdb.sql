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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
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
  `price` DOUBLE NOT NULL,
  `rating` DOUBLE NULL,
  `photo` TEXT NULL,
  `date_sampled` DATE NOT NULL,
  `notes` TEXT NULL,
  `location_sampled` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_brew_type1_idx` (`brew_type_id` ASC),
  CONSTRAINT `fk_beer_brew_type1`
    FOREIGN KEY (`brew_type_id`)
    REFERENCES `brew_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal` ;

CREATE TABLE IF NOT EXISTS `journal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_journal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `white_wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `white_wine` ;

CREATE TABLE IF NOT EXISTS `white_wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `red_wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `red_wine` ;

CREATE TABLE IF NOT EXISTS `red_wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wine` ;

CREATE TABLE IF NOT EXISTS `wine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `white_wine_id` INT NOT NULL,
  `red_wine_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wine_white_wine1_idx` (`white_wine_id` ASC),
  INDEX `fk_wine_red_wine1_idx` (`red_wine_id` ASC),
  CONSTRAINT `fk_wine_white_wine1`
    FOREIGN KEY (`white_wine_id`)
    REFERENCES `white_wine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wine_red_wine1`
    FOREIGN KEY (`red_wine_id`)
    REFERENCES `red_wine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spirits_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spirits_type` ;

CREATE TABLE IF NOT EXISTS `spirits_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spirits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spirits` ;

CREATE TABLE IF NOT EXISTS `spirits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `spirits_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC),
  INDEX `fk_spirits_spirits_type1_idx` (`spirits_type_id` ASC),
  CONSTRAINT `fk_spirits_spirits_type1`
    FOREIGN KEY (`spirits_type_id`)
    REFERENCES `spirits_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal_drink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_drink` ;

CREATE TABLE IF NOT EXISTS `journal_drink` (
  `journal_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`journal_id`, `beer_id`),
  INDEX `fk_journal_has_beer_beer1_idx` (`beer_id` ASC),
  INDEX `fk_journal_has_beer_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_journal_has_beer_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_journal_has_beer_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal_has_wine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_has_wine` ;

CREATE TABLE IF NOT EXISTS `journal_has_wine` (
  `journal_id` INT NOT NULL,
  `wine_id` INT NOT NULL,
  PRIMARY KEY (`journal_id`, `wine_id`),
  INDEX `fk_journal_has_wine_wine1_idx` (`wine_id` ASC),
  INDEX `fk_journal_has_wine_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_journal_has_wine_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_journal_has_wine_wine1`
    FOREIGN KEY (`wine_id`)
    REFERENCES `wine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal_has_spirits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_has_spirits` ;

CREATE TABLE IF NOT EXISTS `journal_has_spirits` (
  `journal_id` INT NOT NULL,
  `spirits_id` INT NOT NULL,
  PRIMARY KEY (`journal_id`, `spirits_id`),
  INDEX `fk_journal_has_spirits_spirits1_idx` (`spirits_id` ASC),
  INDEX `fk_journal_has_spirits_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_journal_has_spirits_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_journal_has_spirits_spirits1`
    FOREIGN KEY (`spirits_id`)
    REFERENCES `spirits` (`id`)
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `user` (`id`, `username`, `enabled`, `password`, `role`) VALUES (1, 'admin', 1, 'admin', 'ADMIN');

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
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (1, 'Bud Light Lime', 2, NULL, 'Texas', 4.2, 4, NULL, NULL, '2022-12-21', NULL, 'Texas');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (2, 'Bud Light', 2, NULL, 'Texas', 4.2, 4, NULL, NULL, '2022-12-21', NULL, 'Texas');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (3, 'Coors Light', 2, NULL, 'Colorado', 4.2, 3.85, NULL, NULL, '2022-12-21', NULL, 'Colorado');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (4, 'Dogfish Head 60 Minute IPA', 3, 'Milton', 'Delaware', 6.0, 5, NULL, NULL, '2001-09-15', NULL, 'Delaware');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (5 , 'Karbach Hopadillo', 3, 'Houston', 'Texas', 6.60, 7, NULL, NULL, '2005-09-08', NULL, 'Texas');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (6, 'New Belgium Voodoo Ranger Impeial IPA', 3, 'Fort Collins', 'Colorado', 9, 6, 10, NULL, '2022-12-21', NULL, 'Pennsylvania');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (7, 'Stone Delicious IPA', 3, NULL, 'California', 7.5, 8, NULL, NULL, '2022-12-21', NULL, 'California');
INSERT INTO `beer` (`id`, `name`, `brew_type_id`, `origin_city`, `origin_state`, `abv`, `price`, `rating`, `photo`, `date_sampled`, `notes`, `location_sampled`) VALUES (8, 'Stone Hazy IPA ', 3, NULL, 'California', 6.7, 10, NULL, NULL, '2022-12-19', NULL, 'California');

COMMIT;


-- -----------------------------------------------------
-- Data for table `white_wine`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `white_wine` (`id`, `name`) VALUES (1, 'Chardonnay');
INSERT INTO `white_wine` (`id`, `name`) VALUES (2, 'Riesling');
INSERT INTO `white_wine` (`id`, `name`) VALUES (3, 'Pinot Grigio');
INSERT INTO `white_wine` (`id`, `name`) VALUES (4, 'Sauvignon Blanc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `red_wine`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `red_wine` (`id`, `name`) VALUES (1, 'Pinot Noir');
INSERT INTO `red_wine` (`id`, `name`) VALUES (2, 'Cabernet Sauvignon');
INSERT INTO `red_wine` (`id`, `name`) VALUES (3, 'Merlot');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spirits_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `sipdb`;
INSERT INTO `spirits_type` (`id`, `name`) VALUES (1, 'Whiskey');
INSERT INTO `spirits_type` (`id`, `name`) VALUES (2, 'Bourbon');
INSERT INTO `spirits_type` (`id`, `name`) VALUES (3 , 'Vodka');
INSERT INTO `spirits_type` (`id`, `name`) VALUES (4, 'Gin');
INSERT INTO `spirits_type` (`id`, `name`) VALUES (5, 'Rum');
INSERT INTO `spirits_type` (`id`, `name`) VALUES (6, 'Tequila');

COMMIT;

