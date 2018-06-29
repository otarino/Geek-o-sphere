-- MySQL Script generated by MySQL Workbench
-- mer. 30 mai 2018 17:56:17 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema geek-o-sphere
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema geek-o-sphere
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `geek-o-sphere` DEFAULT CHARACTER SET utf8 ;
USE `geek-o-sphere` ;

-- -----------------------------------------------------
-- Table `geek-o-sphere`.`points_de_livraison`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek-o-sphere`.`points_de_livraison` (
	  `idPdLs` INT(3) NOT NULL AUTO_INCREMENT,
	  `nom` VARCHAR(35) NULL,
	  `adresse` VARCHAR(45) NULL,
	  `ville` VARCHAR(25) NULL,
	  `codePostal` CHAR(5) NULL,
	  PRIMARY KEY (`idPdLs`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
-- Table `geek-o-sphere`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek-o-sphere`.`clients` (
	  `idClients` INT(3) NOT NULL AUTO_INCREMENT,
	  `nom` VARCHAR(30) NULL,
	  `prenom` VARCHAR(30) NULL,
	  `pseudo` VARCHAR(45) NULL,
	  `credit` DECIMAL(9,2) NULL,
	  `idPdLs` INT(3) NOT NULL,
	  `mdp` VARCHAR(80) NULL,
	  PRIMARY KEY (`idClients`, `idPdLs`),
	  INDEX `fk_clients_PdLs_idx` (`idPdLs` ASC),
	  CONSTRAINT `fk_clients_PdLs`
	    FOREIGN KEY (`idPdLs`)
	    REFERENCES `geek-o-sphere`.`points_de_livraison` (`idPdLs`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
-- Table `geek-o-sphere`.`magasins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek-o-sphere`.`magasins` (
	  `idMagasins` INT(3) NOT NULL AUTO_INCREMENT,
	  `nom` VARCHAR(45) NULL,
	  `adresse` VARCHAR(45) NULL,
	  `ville` VARCHAR(25) NULL,
	  `codePostal` CHAR(5) NULL,
	  `image` VARCHAR(45) NULL,
	  PRIMARY KEY (`idMagasins`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
-- Table `geek-o-sphere`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek-o-sphere`.`articles` (
	  `idArticles` INT(3) NOT NULL AUTO_INCREMENT,
	  `categorie` VARCHAR(12) NULL,
	  `nom` VARCHAR(100) NULL,
	  `description` VARCHAR(140) NULL,
	  `image` VARCHAR(45) NULL,
	  `quantite` INT(4) NULL,
	  `idMagasins` INT(3) NOT NULL,
	  `prix` DECIMAL(6,2) NULL,
	  `sous_categorie` VARCHAR(50) NULL,
	  PRIMARY KEY (`idArticles`, `idMagasins`),
	  INDEX `fk_articles_Magasins1_idx` (`idMagasins` ASC),
	  CONSTRAINT `fk_articles_Magasins1`
	    FOREIGN KEY (`idMagasins`)
	    REFERENCES `geek-o-sphere`.`magasins` (`idMagasins`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
-- Table `geek-o-sphere`.`achats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek-o-sphere`.`achats` (
	  `idAchats` INT(3) NOT NULL AUTO_INCREMENT,
	  `etat` ENUM('Panier', 'En cours', 'Livré') NULL,
	  `date` DATE NULL,
	  `time` TIME NULL,
	  `idClients` INT(3) NOT NULL,
	  `idArticles` INT(3) NOT NULL,
	  `quantite` INT(5) NOT NULL,
	  `idMagasins` INT(3) NOT NULL DEFAULT '1', 
	  PRIMARY KEY (`idAchats`, `idClients`, `idArticles`),
	  INDEX `fk_achats_clients1_idx` (`idClients` ASC),
	  INDEX `fk_achats_articles1_idx` (`idArticles` ASC), 
	  INDEX `fk_achats_magasins1_idx` (`idMagasins` ASC), 
	  CONSTRAINT `fk_achats_clients1`
	    FOREIGN KEY (`idClients`)
	    REFERENCES `geek-o-sphere`.`clients` (`idClients`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_achats_articles1`
	    FOREIGN KEY (`idArticles`)
	    REFERENCES `geek-o-sphere`.`articles` (`idArticles`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_achats_magasins1`
	    FOREIGN KEY (`idMagasins`)
	    REFERENCES `geek-o-sphere`.`magasins` (`idMagasins`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	SET SQL_MODE=@OLD_SQL_MODE;
	SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
	SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

	-- -----------------------------------------------------
-- Data for table `geek-o-sphere`.`points_de_livraison`
-- -----------------------------------------------------
START TRANSACTION;
USE `geek-o-sphere`;
INSERT INTO `geek-o-sphere`.`points_de_livraison` (`idPdLs`, `nom`, `adresse`, `ville`, `codePostal`) VALUES (1, 'Auchan', '3 place diderot', 'Montereau', '77130');
INSERT INTO `geek-o-sphere`.`points_de_livraison` (`idPdLs`, `nom`, `adresse`, `ville`, `codePostal`) VALUES (2, 'Orange', '13 avenue Foch', 'Avon', '77210');
INSERT INTO `geek-o-sphere`.`points_de_livraison` (`idPdLs`, `nom`, `adresse`, `ville`, `codePostal`) VALUES (3, 'Carrefour', '4 place des Lilas', 'Nulpart', '78200');
INSERT INTO `geek-o-sphere`.`points_de_livraison` (`idPdLs`, `nom`, `adresse`, `ville`, `codePostal`) VALUES (4, 'Castorama', '43 boulevard Mozart', 'Paris', '83201');
INSERT INTO `geek-o-sphere`.`points_de_livraison` (`idPdLs`, `nom`, `adresse`, `ville`, `codePostal`) VALUES (5, 'Bricomarché', '9 rue Aristote', 'Hyrule', '75970');

COMMIT;


-- -----------------------------------------------------
-- Data for table `geek-o-sphere`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `geek-o-sphere`;
INSERT INTO `geek-o-sphere`.`clients` (`idClients`, `nom`, `prenom`, `pseudo`, `credit`, `idPdLs`, `mdp`) VALUES (1, 'Jean', 'Michel', 'Jeanmich', 500, 1, '69bf63a19ac8e883053327817eb46c33447b3ab7');
INSERT INTO `geek-o-sphere`.`clients` (`idClients`, `nom`, `prenom`, `pseudo`, `credit`, `idPdLs`, `mdp`) VALUES (2, 'Dupont', 'Paul', 'Pauldup', 1000, 2, 'cf0c564b1cc7f3e740d192425d78ab72ed5d4b5c');
INSERT INTO `geek-o-sphere`.`clients` (`idClients`, `nom`, `prenom`, `pseudo`, `credit`, `idPdLs`, `mdp`) VALUES (3, 'Michel', 'Denis', 'Michde', 1500, 3, 'acca15c86762ee7d82f65dfe14879194182605d0');
INSERT INTO `geek-o-sphere`.`clients` (`idClients`, `nom`, `prenom`, `pseudo`, `credit`, `idPdLs`, `mdp`) VALUES (4, 'Delc', 'Chris', 'otarino', 800, 4, 'a609bb8ab05a0d13db9eb1d0d3b1383d1703c17d');
INSERT INTO `geek-o-sphere`.`clients` (`idClients`, `nom`, `prenom`, `pseudo`, `credit`, `idPdLs`, `mdp`) VALUES (5, 'Lass', 'Anthony', 'Legolas', 100, 5, '95392b329ae4fb442c15fa2dbb503982bdabe359');

COMMIT;


-- -----------------------------------------------------
-- Data for table `geek-o-sphere`.`magasins`
-- -----------------------------------------------------
START TRANSACTION;
USE `geek-o-sphere`;
INSERT INTO `geek-o-sphere`.`magasins` (`idMagasins`, `nom`, `adresse`, `ville`, `codePostal`, `image`) VALUES (1, 'Razer', '3 rue des moulins', 'Montereau', '77130', 'razer.png');
INSERT INTO `geek-o-sphere`.`magasins` (`idMagasins`, `nom`, `adresse`, `ville`, `codePostal`, `image`) VALUES (2, 'Logitech', '4 avenue mou', 'Paris', '93300', 'logitech.png');
INSERT INTO `geek-o-sphere`.`magasins` (`idMagasins`, `nom`, `adresse`, `ville`, `codePostal`, `image`) VALUES (3, 'Corsair', '39 rue jean', 'Avon', '77210', 'corsair.png');
INSERT INTO `geek-o-sphere`.`magasins` (`idMagasins`, `nom`, `adresse`, `ville`, `codePostal`, `image`) VALUES (4, 'Wish', '45 rue nulpart', 'nulpart', '51000', 'wish.png');
INSERT INTO `geek-o-sphere`.`magasins` (`idMagasins`, `nom`, `adresse`, `ville`, `codePostal`, `image`) VALUES (5, 'msi', '9 rue des tempêtes', 'Hyrule', '77130', 'msi.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `geek-o-sphere`.`articles`      `geek-o-sphere`.`articles`
-- -----------------------------------------------------
START TRANSACTION;
USE `geek-o-sphere`;
INSERT INTO `geek-o-sphere`.`articles` (`idArticles`, `categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES (1, 'Informatique', 'Razer deathadder elite', 'Souris gaming de la marque razer, une des meilleurs du marché si ce n\'est la meilleure.Equipé dela technologie chroma elle permet une person', 'deathadder_elite.png', 30, 1, 79.99, 'Souris');
INSERT INTO `geek-o-sphere`.`articles` (`idArticles`, `categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES (2, 'Informatique', 'Logitech 3000', 'Clavier Logitech de moyenne gamme.Bon produit pour ce prix.', 'logitech_73BF.png', 150, 2, 29.99, 'Clavier');
INSERT INTO `geek-o-sphere`.`articles` (`idArticles`, `categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES (3, 'High-tech', 'Hand spinner dorée', 'N\'achetez pas, vraiment...', 'hand_spinner_dorée.png', 100, 3, 20.00, 'Divers');
INSERT INTO `geek-o-sphere`.`articles` (`idArticles`, `categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES (4, 'Informatique', 'Msi revolution 4', 'Ordinateur portable gaming de haute gamme fait tourner la plupart des jeux récents', 'msi_revolution_4.png', 32, 4, 999.99, 'Ordinateur portable');
INSERT INTO `geek-o-sphere`.`articles` (`idArticles`, `categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES (5, 'Informatique', 'Barette de RAM 8Go corsair', 'Barette de mémoire vive de 8Go de la marque Corsair', 'ram8go_corsair.png', 100, 2, 32, 'Hardware');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'LEMFO LEM5 pro montre intelligente', 'Objet neuf et intact, n\'ayant jamais servi, non ouvert, vendu dans son emballage d\'origine', 's-l225.jpg', 85, 1, 109.99, 'Montre');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Samsung Galaxy S9+', 'Objet neuf et intact, n\'ayant jamais servi, non ouvert, vendu dans son emballage d\'origine', 's-l2251.jpg', 150, 2, 692.20, 'Téléphone');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Samsung Galaxy S8+', 'Objet neuf et intact, n\'ayant jamais servi, non ouvert, vendu dans son emballage d\'origine', 's-l2252.jpg', 100, 3, 20.00, 'Téléphone');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'Clé USB 16GB Kingston 16 GB USB 3.0 - DTIG4/16GB', 'Clé USB de très bonne qualité', 's-l2255.jpg', 32, 4, 999.99, 'Clé USB');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'Kingston 8Go 16Go 32Go 64Go 128Go', 'Clé USB de moins bonne qualité', 's-l2256.jpg', 100, 2, 32, 'Clé USB');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Matériel de radiocommunication', 'Permet de communiquer à distance', 's-l2253.jpg', 30, 1, 79.99, 'Communication');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Radios CB', 'Sert à écouter la radio ou des communications à distance', 's-l2254.jpg', 150, 2, 29.99, 'Communication');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'TOSHIBA MQ01ABD100 1To 1 To Disque Dur internes 2,5', 'Disque dur de 1To pour ordinateur fixe', 's-l2257.jpg', 100, 3, 20.00, 'Disque Dur');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'Toshiba Canvio Basics Disque dur externe 2.5 portable 1 To USB 3.0', 'Disque dur de moyenne qualité', 's-l2258.jpg', 32, 4, 999.99, 'Disque Dur');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'Dell OptiPlex All In One PC i5', 'Ordinateur Dell avec un processeur I5', 's-l2259.jpg', 100, 2, 252.35, 'Ordinateur fixe');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Official Genuine Stealth xBox One', 'Casque audio pour XBOX ONE', 's-l22510.jpg', 30, 1, 79.99, 'Casque audio');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Deluxe Pro Headset', 'Casque audio pour ordinateur portable', 's-l22511.jpg', 150, 2, 29.99, 'Casque audio');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'WINDOWS 7 FULL DELL COMPUTER DESKTOP PC', 'Ordinateur fixe de la marque DELL', 's-l22512.jpg', 100, 3, 44.76, 'Ordinateur fixe');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Nikon D850 Digital SLR Camera', 'Appareil photo standart de la marque Nikon', 's-l22513.jpg', 32, 4, 999.99, 'Appareil photo');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Nikon D7500 Digital SLR Camera Body Only Kit Box', 'Appareil photo standart de la marque Nikon', 's-l22514.jpg', 100, 2, 32, 'Appareil photo');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('High-tech', 'Canon EOS 750D DSLR Camera + EF-S 18-55mm', 'Appareil photo standart de la marque Canon', 's-l22515.jpg', 30, 1, 79.99, 'Appareil photo');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'HP Spectre x2 Pro', 'Ordinateur portable HP récent', 's-l22516.jpg', 32, 4, 999.99, 'Ordinateur portable');
INSERT INTO `geek-o-sphere`.`articles` (`categorie`, `nom`, `description`, `image`, `quantite`, `idMagasins`, `prix`, `sous_categorie`) VALUES ('Informatique', 'PC Hybride Blanc Lenovo Yoga 300-11 IBY', 'Ordinateur portable Lenovo récent', 's-l22517.jpg', 100, 2, 32, 'Ordinateur portable');

COMMIT;


-- -----------------------------------------------------
-- Data for table `geek-o-sphere`.`achats`
-- -----------------------------------------------------
START TRANSACTION;
USE `geek-o-sphere`;
INSERT INTO `geek-o-sphere`.`achats` (`idAchats`, `etat`, `date`, `time`, `idClients`, `idArticles`, `quantite`, `idMagasins`) VALUES (1, 'En cours', '2018/05/16', '13:04', 4, 3, 1, 1);
INSERT INTO `geek-o-sphere`.`achats` (`idAchats`, `etat`, `date`, `time`, `idClients`, `idArticles`, `quantite`, `idMagasins`) VALUES (2, 'Livré', '2018/05/03', '19:14', 3, 4, 2, 2);
INSERT INTO `geek-o-sphere`.`achats` (`idAchats`, `etat`, `date`, `time`, `idClients`, `idArticles`, `quantite`, `idMagasins`) VALUES (3, 'En cours', '2018/05/09', '07:45', 2, 5, 3, 3);
INSERT INTO `geek-o-sphere`.`achats` (`idAchats`, `etat`, `date`, `time`, `idClients`, `idArticles`, `quantite`, `idMagasins`) VALUES (4, 'Panier', '2018/04/30', '15:34', 5, 3, 4, 4);
INSERT INTO `geek-o-sphere`.`achats` (`idAchats`, `etat`, `date`, `time`, `idClients`, `idArticles`, `quantite`, `idMagasins`) VALUES (5, 'En cours', '2018/05/22', '14:40', 1, 2, 5, 5);

COMMIT;


