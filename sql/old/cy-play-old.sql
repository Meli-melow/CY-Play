-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS `cy-play`;
USE `cy-play`;

-- Step 2: Create the `user` Table
CREATE TABLE IF NOT EXISTS `user` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `prenoun` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `passcode` VARCHAR(255) NOT NULL
);

-- Step 3: Create the `product` Table
CREATE TABLE IF NOT EXISTS `product` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `imagelink` VARCHAR(255),
    `stock` INT NOT NULL,
    `review` DECIMAL(3,2),
    `price` DECIMAL(10,2) NOT NULL,
    `nbofachat` INT NOT NULL,
    `categorie` VARCHAR(255) NOT NULL
);

-- Step 4: Create the `fournisseur` Table
CREATE TABLE IF NOT EXISTS `fournisseur` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `commande` (
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `order_date` DATETIME NOT NULL,
    `quantity` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`user_id`, `product_id`, `order_date`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`)
);

DROP TABLE IF EXISTS `productimages`;
CREATE TABLE IF NOT EXISTS `productimages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`name`, `prenoun`, `email`, `passcode`) VALUES
('John Doe', 'John', 'john.doe@example.com', 'password123'),
('Jane Smith', 'Jane', 'jane.smith@example.com', 'password456');

INSERT INTO `product` (`name`, `description`, `imagelink`, `stock`, `review`, `price`, `nbofachat`, `categorie`) VALUES
('Laptop', 'High-performance gaming laptop', 'https://example.com/laptop.jpg', 10, 4.5, 1200.00, 5, 'Electronics'),
('Smartphone', 'Latest model smartphone with high-resolution camera', 'https://example.com/smartphone.jpg', 15, 4.7, 800.00, 3, 'Electronics');

INSERT INTO `fournisseur` (`name`) VALUES
('Tech Gadgets Inc.'),
('Smart Electronics Ltd.');

INSERT INTO `commande` (`user_id`, `product_id`, `order_date`, `quantity`, `status`) VALUES
(1, 1, '2024-04-05 10:00:00', 1, 'Pending'),
(1, 2, '2024-04-05 10:15:00', 2, 'Shipped'),
(2, 1, '2024-04-06 09:30:00', 1, 'Delivered');


-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `stock`, `review`, `price`, `nbofachat`, `categorie`, `fournisseur`) VALUES
(1, 'MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB', ' Processeur Intel Core i7-12650H de 12e -- génération Carte graphique GeForce RTX 4070 Laptop GPU 8Go GDDR6 Propulsée par NVIDIA DLSS 3, l\'architecture Ada Lovelace et les technologies Max-Q Écran 15,6\'\' Full HD (1920 x 1080), taux de rafraîchissement 144 Hz, dalle de niveau IPS Mode Discrete Graphics (Design MUX) pour pousser les performances à un niveau supérieur Technologie Cooler Boost 5 exclusive : 2 ventilateurs + 4 caloducs', 10, 4.00, 1449.99, 5, ' Laptop', ' MSI\r'),
(2, 'MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6\' UHD 120Hz - Windows 11 Famille - Clavier Azerty FR - Portable Gaming', ' Processeur Intel Core i7-13620H de 13ème génération Nvidia RTX4060 8GB MSI Coolerboost Trinity : Le système de refroidissement exclusif Cooler Boost Trinity+ fonctionne avec trois ventilateurs dédiés et cinq caloducs en cuivre MSI MUX : Le mode Discrete Graphics (MUX) pousse les performances du GPU à leur niveau le plus haut Grâce à la fonction MSI AI Noise Cancellation, les bruits environnants sur les haut-parleurs et le microphone sont réduits afin d’améliorer vos discussions en ligne', 8, 4.50, 1499.99, 10, ' Laptop', ' MSI\r'),
(3, 'MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6\' FHD 144Hz – Dos', ' Taille de l\'écran 15,6 Pouces -- Couleur: Gris -- Taille du disque dur: 512 Go -- Modèle du CPU: Intel Core i5 -- Taille de la mémoire RAM installée: 16 Go -- Système d\'exploitation: DOS -- Description de la carte graphique: Dédié -- Coprocesseur graphique: NVIDIA GeForce RTX 3050', 10, 4.00, 1449.00, 5, ' Laptop', ' MSI');


INSERT INTO `productimages` (`id`, `product_id`, `image_url`) VALUES
(1, 3, '/Project/Projectnew/src/pictures/Products/MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6/Img1.jpg\r\n'),
(2, 3, '/Project/Projectnew/src/pictures/Products/MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6/Img2.jpg\r\n'),
(3, 3, '/Project/Projectnew/src/pictures/Products/MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6/Img3.jpg\r\n'),
(4, 3, '/Project/Projectnew/src/pictures/Products/MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6/Img4.jpg\r\n'),
(5, 3, '/Project/Projectnew/src/pictures/Products/MSI Thin 15 B12UC-1234XFR  i5-12450H – 16GB DDR4 – SSD 512GB – Nvidia RTX3050 4GB – 15,6/Img5.jpg\r\n'),
(6, 2, '/Project/Projectnew/src/pictures/Products/MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6/Img1.jpg\r\n'),
(7, 2, '/Project/Projectnew/src/pictures/Products/MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6/Img2.jpg\r\n'),
(8, 2, '/Project/Projectnew/src/pictures/Products/MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6/Img3.jpg\r\n'),
(9, 2, '/Project/Projectnew/src/pictures/Products/MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6/Img4.jpg\r\n'),
(10, 2, '/Project/Projectnew/src/pictures/Products/MSI Stealth 15 A13VF-036FR  Intel Core I7 13620H - 16GB DDR5-1TB SSD - Nvidia RTX4060 8GB - 15,6/Img5.jpg\r\n'),
(11, 1, '/Project/Projectnew/src/pictures/Products/MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB/Img1.jpg\r\n'),
(12, 1, '/Project/Projectnew/src/pictures/Products/MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB/Img2.jpg\r\n'),
(13, 1, '/Project/Projectnew/src/pictures/Products/MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB/Img3.jpg\r\n'),
(14, 1, '/Project/Projectnew/src/pictures/Products/MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB/Img4.jpg\r\n'),
(15, 1, '/Project/Projectnew/src/pictures/Products/MSI Katana 15 B12VGK-208FR  Intel Core i7 12650H - 16GB DDR5 - SSD 512GB - Nvidia RTX4070 8GB - 15.6 Full HD 144HZ - Windows 11 Famille - Clavier Azerty RGB/Img5.jpg');


INSERT INTO `product` (`name`, `description`, `imagelink`, `stock`, `review`, `price`, `nbofachat`, `categorie`)
(`test` , `test`,`/src/pictures/Products/test.webp`, 10, 4.00, 1449.00, 5, ' GAMING PC', ' MSI\r');