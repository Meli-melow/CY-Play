-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 avr. 2024 à 19:18
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cy_play`
--

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `imagelink` varchar(255),
  `stock` int NOT NULL,
  `review` decimal(3,2) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `nbofachat` int NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `fournisseur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `stock`, `review`, `price`, `nbofachat`, `categorie`, `fournisseur`,`imagelink`) VALUES
(1, 'Aerocool APNX FP1-140 (Noir)', 'Le ventilateur de boitier Aerocool APNX FP1 est une série de ventilateurs professionnels conçus pour améliorer votre grandement le refroidissement de votre boitier. Son efficacité trouve son origine dans son épaisseur de 30 mm et ses pales hautes performances.', 50, 4.50, 12.95, 30, 'Ventilateur boîtier', 'AEROCOOL','/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_1.jpg'),
(2, 'Aerocool Astro 12', 'Aerocool propose avec l\'Astro 12 un ventilateur efficace pour votre boîtier, grâce à son diamètre de 120 mm avec des pales incurvées ainsi que des patins anti-vibrations. Avec son éclairage ARGB, accédez à 16,8 millions de couleurs à l\'aide des cartes mères RGB compatibles.', 80, 5.00, 12.95, 30, 'Ventilateur boîtier', 'AEROCOOL','/src/pictures/Products/Aerocool Astro 12/ventilateur7_1.jpg'),
(3, 'Aerocool Astro 12 Pro Pack de 3', 'Aerocool propose avec l\'Astro 12 Pro un kit de 3 ventilateurs efficaces pour votre boîtier, avec des pales incurvées ainsi que des patins anti-vibrations. En vous appuyant sur l\'éclairage ARGB, accédez à 16,8 millions de couleurs à l\'aide des cartes mères RGB compatibles pour de splendides effets !', 35, 5.00, 49.95, 15, 'Ventilateur boîtier', 'AEROCOOL','/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_3.jpg'),
(4, 'Aerocool Cosmo 12', 'Le Ventilateur de 120 mm Cosmo 12 d\'Aerocool est un ventilateur de boitier LED RGB efficace et esthétiquement plaisant grâce à son rétroéclairage LED RGB fixe. Livré avec un câble adaptateur à 4 broches Molex il se connecte facilement à n\'importe quel PC.', 40, 4.00, 6.90, 15, 'Ventilateur boîtier', 'AEROCOOL','/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_1.jpg'),
(5, 'Aerocool Duo 12 Pro Pack de 3', 'Aerocool propose un kit de 3 ventilateurs Duo 12 Pro. Ces ventilateurs sont efficaces pour votre boîtier, avec leurs pales incurvées ainsi que leurs patins anti-vibrations. En vous appuyant sur l\'éclairage ARGB, accédez à 16,8 millions de couleurs à l\'aide des cartes mères RGB compatibles...', 50, 4.50, 39.95, 16, 'Ventilateur boîtier', 'AEROCOOL','/src/pictures/Products/Aerocool Duo 12 Pro Pack de 3/ventilateur10_1.jpg'),
(6, 'Arctic Liquid Freezer II 240 ARGB', 'Avec le kit de refroidissement à eau pour CPU tout-en-un Liquid Freezer II 240 ARGB, Arctic met tout son savoir-faire au service du gaming grâce à une pompe de refroidissement compacte contrôlée par PWM. Grâce à ce système, elle ne fonctionne pas à pleine charge tout le temps...', 40, 4.00, 119.95, 20, 'Ventilateur Watercooling', 'Arctic','/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_1.jpg'),
(7, 'Arctic Liquid Freezer II 280', 'Avec le kit de refroidissement à eau pour CPU tout-en-un Liquid Freezer II 280, Arctic met tout son savoir-faire au service du gaming grâce à une pompe de refroidissement compacte contrôlée par PWM et deux ventilateurs de 140 mm à roulement hydrodynamique.', 40, 4.50, 124.95, 20, 'Ventilateur Watercooling', 'Arctic','/src/pictures/Products/Arctic Liquid Freezer II 280/ventilateur12_1.jpg'),
(8, 'Arctic Liquid Freezer II 280 ARGB', 'Avec le kit de refroidissement à eau pour CPU tout-en-un Liquid Freezer II 280 ARGB, ARCTIC met tout son savoir-faire au service du gaming grâce à une pompe de refroidissement compacte contrôlée par PWM. Grâce à ce système, elle ne fonctionne pas à pleine charge tout le temps...', 75, 4.50, 149.95, 25, 'Ventilateur Watercooling', 'Arctic','/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_1.jpg'),
(9, 'Arctic Liquid Freezer II 420 ARGB', 'Avec le kit de refroidissement à eau pour CPU tout-en-un Liquid Freezer II 420 ARGB, Arctic met tout son savoir-faire au service du gaming grâce à une pompe de refroidissement compacte contrôlée par PWM et trois ventilateurs RGB de 140 mm à roulement hydrodynamique.', 40, 4.70, 179.95, 20, 'Ventilateur Watercooling', 'Arctic','/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_1.jpg'),
(10, 'Arctic Liquid Freezer III 240', 'Avec le kit de refroidissement à eau pour CPU tout-en-un Liquid Freezer III, Arctic met tout son savoir-faire au service du gaming grâce à une pompe améliorée spécialement développée en interne et contrôlée par PWM. Grâce à ce système, elle ne fonctionne pas à pleine charge tout le temps.', 40, 4.30, 109.95, 10, 'Ventilateur Watercooling', 'Arctic','/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_1.jpg'),
(11, 'be quiet! Dark Rock 4', 'Le Dark Rock 4 de Be Quiet! est la nouvelle itération du constructeur Allemande de son fer de lance en matière de ventirad. Au menu de cette nouvelle version, plus de performances, un montage facilité tout cela dans un silence de fonctionnement toujours aussi impeccable avec un SilentWings 135mm.', 40, 4.70, 79.95, 15, 'Ventilateur processeur', 'be quiet!','/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_1.jpg'),
(12, 'be quiet! Dark Rock Elite', 'Le ventirad be quiet! Dark Rock Elite offre des performances de refroidissement de pointe et un fonctionnement très silencieux, que ce soit pour les systèmes overclockés et les stations de travail professionnelles. Le Dark Rock Elite s\'adresse aux utilisateurs les plus exigeants.', 50, 4.00, 124.95, 20, 'Ventilateur processeur', 'be quiet!','/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_1.jpg'),
(13, 'be quiet! Dark Rock Pro 5', 'Le ventirad be quiet! Dark Rock Pro 5 offre d\'excellentes performances de refroidissement et un fonctionnement très silencieux que ce soit pour les systèmes overclockés et les stations de travail professionnelles.50', 50, 5.00, 102.95, 30, 'Ventilateur processeur', 'be quiet!','/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_1.jpg'),
(14, 'be quiet! Dark Rock Slim', 'Le Dark Rock Slim de be quiet! offre des performances de refroidissement exceptionnellement élevées de 180 W TDP et un fonctionnement quasi inaudible. Il est donc idéal pour toutes les configurations haut de gamme qui présentent un espace limité.', 45, 4.50, 67.95, 25, 'Ventilateur processeur', 'be quiet!', '/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_1.jpg'),
(15, 'be quiet! Dark Rock TF 2', 'Dans la continuité du ventirad Dark Rock TF de bequiet! le Dark Rock TF 2 est un modèle Top-Flow compatible avec les plateformes Intel 1150/1151/1155/1200/2011(-3)/2066 et AMD AM3 (+) / AM4. Il convient tout particulièrement PC Gaming nécessitant un ventirad efficace pour un encombrement réduit.', 45, 3.80, 102.95, 12, 'Ventilateur processeur', 'be quiet!', '/src/pictures/Products/be quiet! Dark Rock TF 2/ventilateur5_1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
CREATE TABLE IF NOT EXISTS `productimages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `productimages`
--

INSERT INTO `productimages` (`id`, `product_id`, `image_url`) VALUES
(1, 1, "/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_1.jpg"),
(2, 1, "/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_2.jpg"),
(3, 1, "/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_3.jpg"),
(4, 1, "/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_4.jpg"),
(5, 1, "/src/pictures/Products/Aerocool APNX FP1-140 (Noir)/ventilateur6_5.jpg"),
(6, 2, "/src/pictures/Products/Aerocool Astro 12/ventilateur7_1.jpg"),
(7, 2, "/src/pictures/Products/Aerocool Astro 12/ventilateur7_2.jpg"),
(8, 2, "/src/pictures/Products/Aerocool Astro 12/ventilateur7_3.jpg"),
(9, 2, "/src/pictures/Products/Aerocool Astro 12/ventilateur7_4.jpg"),
(10, 2, "/src/pictures/Products/Aerocool Astro 12/ventilateur7_5.jpg"),
(11, 3, "/src/pictures/Products/Aerocool Astro 12 Pro Pack de 3/ventilateur8_1.jpg"),
(12, 3, "/src/pictures/Products/Aerocool Astro 12 Pro Pack de 3/ventilateur8_2.jpg"),
(13, 4, "/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_1.jpg"),
(14, 4, "/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_2.jpg"),
(15, 4, "/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_3.jpg"),
(16, 4, "/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_4.jpg"),
(17, 4, "/src/pictures/Products/Aerocool Cosmo 12/ventilateur9_5.jpg"),
(18, 5, "/src/pictures/Products/Aerocool Duo 12 Pro Pack de 3/ventilateur10_1.jpg"),
(19, 5, "/src/pictures/Products/Aerocool Duo 12 Pro Pack de 3/ventilateur10_2.jpg"),
(20, 5, "/src/pictures/Products/Aerocool Duo 12 Pro Pack de 3/ventilateur10_3.jpg"),
(21, 5, "/src/pictures/Products/Aerocool Duo 12 Pro Pack de 3/ventilateur10_4.jpg"),
(22, 6, "/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_1.jpg"),
(23, 6, "/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_2.jpg"),
(24, 6, "/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_3.jpg"),
(25, 6, "/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_4.jpg"),
(26, 6, "/src/pictures/Products/Arctic Liquid Freezer II 240 ARGB/ventilateur11_5.jpg"),
(27, 7, "/src/pictures/Products/Arctic Liquid Freezer II 280/ventilateur12_1.jpg"),
(28, 7, "/src/pictures/Products/Arctic Liquid Freezer II 280/ventilateur12_2.jpg"),
(29, 7, "/src/pictures/Products/Arctic Liquid Freezer II 280/ventilateur12_3.jpg"),
(30, 7, "/src/pictures/Products/Arctic Liquid Freezer II 280/ventilateur12_4.jpg"),
(31, 8, "/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_1.jpg"),
(32, 8, "/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_2.jpg"),
(33, 8, "/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_3.jpg"),
(34, 8, "/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_4.jpg"),
(35, 8, "/src/pictures/Products/Arctic Liquid Freezer II 280 ARGB/ventilateur13_5.jpg"),
(36, 9, "/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_1.jpg"),
(37, 9, "/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_2.jpg"),
(38, 9, "/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_3.jpg"),
(39, 9, "/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_4.jpg"),
(40, 9, "/src/pictures/Products/Arctic Liquid Freezer II 420 ARGB/ventilateur14_5.jpg"),
(41, 10, "/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_1.jpg"),
(42, 10, "/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_2.jpg"),
(43, 10, "/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_3.jpg"),
(44, 10, "/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_4.jpg"),
(45, 10, "/src/pictures/Products/Arctic Liquid Freezer III 240/ventilateur15_5.jpg"),
(46, 11, "/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_1.jpg"),
(47, 11, "/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_2.jpg"),
(48, 11, "/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_3.jpg"),
(49, 11, "/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_4.jpg"),
(50, 11, "/src/pictures/Products/be quiet! Dark Rock 4/ventilateur1_5.jpg"),
(51, 12, "/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_1.jpg"),
(52, 12, "/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_2.jpg"),
(53, 12, "/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_3.jpg"),
(54, 12, "/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_4.jpg"),
(55, 12, "/src/pictures/Products/be quiet! Dark Rock Elite/ventilateur2_5.jpg"),
(56, 13, "/src/pictures/Products/be quiet! Dark Rock Pro 5/ventilateur3_1.jpg"),
(57, 13, "/src/pictures/Products/be quiet! Dark Rock Pro 5/ventilateur3_2.jpg"),
(58, 13, "/src/pictures/Products/be quiet! Dark Rock Pro 5/ventilateur3_3.jpg"),
(59, 13, "/src/pictures/Products/be quiet! Dark Rock Pro 5/ventilateur3_4.jpg"),
(60, 14, "/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_1.jpg"),
(61, 14, "/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_2.jpg"),
(62, 14, "/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_3.jpg"),
(63, 14, "/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_4.jpg"),
(64, 14, "/src/pictures/Products/be quiet! Dark Rock Slim/ventilateur4_5.jpg"),
(65, 15, "/src/pictures/Products/be quiet! Dark Rock TF 2/ventilateur5_1.jpg"),
(66, 15, "/src/pictures/Products/be quiet! Dark Rock TF 2/ventilateur5_2.jpg"),
(67, 15, "/src/pictures/Products/be quiet! Dark Rock TF 2/ventilateur5_3.jpg"),
(68, 15, "/src/pictures/Products/be quiet! Dark Rock TF 2/ventilateur5_4.jpg");

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
