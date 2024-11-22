-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 15 nov. 2024 à 11:15
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetsql`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `adress_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`adress_id`, `user_id`, `adress`) VALUES
(1, 1, '84, rue Matthieu Pascal\n55090 Pruvost-les-Bains'),
(2, 2, '59, avenue Virginie Petit\n02 775 Bernierboeuf'),
(3, 3, '4, rue Roy\n27 302 Da Silva'),
(4, 4, '63, chemin Leduc\n21 839 Dos Santos'),
(5, 5, '834, impasse de Delahaye\n56 736 Gerard'),
(6, 6, '22, place de Guillon\n29 358 VidalBourg'),
(7, 7, 'chemin Gautier\n92 978 Clerc'),
(8, 8, '15, rue de Guillon\n04 953 Verdier-sur-Mer'),
(9, 9, '15, boulevard Merle\n37 846 Blanchard');

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `creation_date`, `total_price`) VALUES
(1, 1, '2022-10-30 06:51:06', 3532.42),
(2, 2, '2018-02-13 06:31:16', 4637),
(3, 3, '2024-09-23 19:23:35', 4761.01),
(4, 4, '2023-09-14 06:52:36', 1480.45),
(5, 5, '2018-08-08 07:05:19', 855.41),
(6, 6, '2018-08-29 09:16:27', 2789.51),
(7, 7, '2023-10-12 18:51:37', 930.15),
(8, 8, '2018-03-12 19:12:32', 3469.28),
(9, 9, '2020-02-11 16:09:54', 3315.18);

-- --------------------------------------------------------

--
-- Structure de la table `commands`
--

CREATE TABLE `commands` (
  `command_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commands`
--

INSERT INTO `commands` (`command_id`, `cart_id`, `creation_date`, `total_price`) VALUES
(1, 1, '2022-10-30 06:51:06', 3278.36),
(2, 2, '2018-02-13 06:31:16', 4950.33),
(3, 3, '2024-09-23 19:23:35', 532.31),
(4, 4, '2023-09-14 06:52:36', 4921.23),
(5, 5, '2018-08-08 07:05:19', 4110.5),
(6, 6, '2018-08-29 09:16:27', 1478.31),
(7, 7, '2023-10-12 18:51:37', 4204.39),
(8, 8, '2018-03-12 19:12:32', 588.14),
(9, 9, '2020-02-11 16:09:54', 241.88);

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `command_id`, `payment_id`, `user_id`, `date`, `total_price`) VALUES
(1, 1, 1, 1, '2022-10-30 06:51:06', 4533.76),
(2, 2, 2, 2, '2018-02-13 06:31:16', 3131.17),
(3, 3, 3, 3, '2024-09-23 19:23:35', 1405.07),
(4, 4, 4, 4, '2023-09-14 06:52:36', 3960.64),
(5, 5, 5, 5, '2018-08-08 07:05:19', 4726.09),
(6, 6, 6, 6, '2018-08-29 09:16:27', 2541.98),
(7, 7, 7, 7, '2023-10-12 18:51:37', 1563.64),
(8, 8, 8, 8, '2018-03-12 19:12:32', 2874.89),
(9, 9, 9, 9, '2020-02-11 16:09:54', 2501.06);

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `payment_method`, `card_number`, `iban`) VALUES
(1, 1, 'Visa', '5519411439339823', 'FR2410703997982OHQZ7T9NOF8S'),
(2, 2, 'MasterCard', '5298913293710954', 'FR858489782463775MIK814WS11'),
(3, 3, 'Visa', '4532482569214173', 'FR1198095538156271B9046QOF6'),
(4, 4, 'Visa', '5456990860863083', 'FR1596136713157EE378I3DLF4C'),
(5, 5, 'Visa', '5351833424658449', 'FR9601996088034H5X0N2WB8BT0'),
(6, 6, 'Visa', '6011056403483346', 'FR4621936051420A9S9UU91KZN6'),
(7, 7, 'Visa', '372276893893053', 'FR23118218909450F4VB760KZ82'),
(8, 8, 'MasterCard', '4024007150597986', 'FR1432714920519BOFFW5U8P010'),
(9, 9, 'Visa', '4929829867544', 'FR840284766785185002Q8W4LX6');

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `image_data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`photo_id`, `type`, `entity_id`, `image_data`) VALUES
(1, 'dolorum', 1, 0x3031313031313130303130313030313130313031303131313031313131303030303031303130313130303031303031303030313131303131303131303031313030313131313130303131303031303130313130313130303130303131303131313131313130),
(2, 'facere', 2, 0x3031303031313030303131303131303130303131303031303130303131303031303031313131313131313031313130303130303130303030303130313030313031303130303131313030313031303130303031313131313131313030313030303130303131),
(3, 'corporis', 3, 0x3030313031303030303030313130313030303030313031303030303031313130303131313031313030313030303031313131303130313030303030303031303131313131313131303131313131303030303031303130313131313030313131303130313031),
(4, 'ducimus', 4, 0x3031313130313131313030313130313031303131303030313031313031303131313130303031303031313031313130313130313031303030313130313031313131313030313031303130303131313131303030303031313131313031313031313031303131),
(5, 'tenetur', 5, 0x3031313030303131303030313131313130303031303031303031303130313031313030313130313031303131303031313131313131303030303031313030303031313131303131303030313030303131303130303131303030303130303130303131303130),
(6, 'et', 6, 0x3031303130313031303130313131303031313030303131313130303030313030313030303131303031313131303131303131303131313030313030313131313130303131313030313030313131313130303130313130313030313031303131303030303131),
(7, 'voluptatem', 7, 0x3030313030313030313030313031303030313130303131313030313130313130303031303130313130303031313030303130303030313130303030303031313031303031303031303130303131313130313131313131303030303031303130303031313030),
(8, 'dolore', 8, 0x3031313031313131303031313130313031313130313031313130303030303131303031313131303131303131303030303031303031303130313130313031313031313130303030303130303130313131313031313131313131313130303030313030303130),
(9, 'veritatis', 9, 0x3030303131303031313131313031303130313031313131303030303130303131313130303131303031303131313030313131313130303030303031313131303131303031303131303030313130303031303131303031303131313031303131313130313030);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `quantity`) VALUES
(1, 'nisi', 4164.63, 7791),
(2, 'architecto', 444.64, 3871),
(3, 'delectus', 2017.81, 6700),
(4, 'nam', 4060.81, 6251),
(5, 'aut', 2547.27, 2963),
(6, 'quae', 212.49, 9781),
(7, 'quisquam', 841.79, 6303),
(8, 'non', 621.01, 2644),
(9, 'quos', 2365.28, 9741);

-- --------------------------------------------------------

--
-- Structure de la table `products_cart`
--

CREATE TABLE `products_cart` (
  `products_cart_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products_cart`
--

INSERT INTO `products_cart` (`products_cart_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 4),
(2, 2, 2, 4),
(3, 3, 3, 10),
(4, 4, 4, 4),
(5, 5, 5, 4),
(6, 6, 6, 9),
(7, 7, 7, 9),
(8, 8, 8, 7),
(9, 9, 9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `last_name`, `first_name`, `age`, `email`, `password`) VALUES
(1, 'Humbert', 'Juliette', 33, 'Henri82@wanadoo.fr', '$2y$10$4Olr1PZVvOPxKg2xBPBHx.IsRlktdmNOy7ePNmrgTgMv1EGbEgrN6'),
(2, 'Ramos', 'Noël', 62, 'Patricia.Chretien@Lefort.com', '$2y$10$9ASTIepOZnJ6lyvU4VbyKuFo9oM5y8nClMoC2aO/BbMb1ZBXizoke'),
(3, 'Da Costa', 'Timothée', 68, 'Vidal.Roland@free.fr', '$2y$10$nC3XCI/8lzMdchKd8Gu2se.DfS.4kXrqwVQcHW0dcuuPuA.oPd70a'),
(4, 'Gautier', 'Jacqueline', 19, 'Lebon.Nathalie@Rossi.fr', '$2y$10$Dz4wkyX/BXDuZFzQNU8NKePfsXQctNGaw1I41ePW2Wz2wSbeMQu5i'),
(5, 'Lebreton', 'François', 32, 'Robert84@Toussaint.net', '$2y$10$GnBbbTMyXusw8819.srcGuf0qwxlIq2TtndO..p2dSThILKyOR2Ba'),
(6, 'Lebreton', 'Gilbert', 48, 'kRichard@Parent.com', '$2y$10$8etTfbBbcbBj/U13MDMVoeK3qSdF68IUGtdi17wcqRDNLDCYbfWY2'),
(7, 'Raymond', 'Bernadette', 66, 'Anais.Blanchard@orange.fr', '$2y$10$QK8p6F65ezW07Zej11olk.u4MBpAAwGgU6m6rfjAPZPOSoQZfO1A2'),
(8, 'Reynaud', 'Françoise', 26, 'rBertrand@Renard.com', '$2y$10$xyHNTQWV1snVkNx3hOtzRupqsPZDEzKcu/p.4rml0lAKKqhc1/Tti'),
(9, 'Julien', 'Thibault', 79, 'Emmanuel93@orange.fr', '$2y$10$xivhVyVhN570Lrf2gdyy8OsjKdrMRb7dPkPE30pZWdtnXrrlCfAPe');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`command_id`),
  ADD KEY `command_ibfk_1` (`cart_id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `command_id` (`command_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoices_ibfk_3` (`payment_id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `entity_id` (`entity_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Index pour la table `products_cart`
--
ALTER TABLE `products_cart`
  ADD PRIMARY KEY (`products_cart_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commands`
--
ALTER TABLE `commands`
  MODIFY `command_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `products_cart`
--
ALTER TABLE `products_cart`
  MODIFY `products_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `commands_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `commands` (`command_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`entity_id`) REFERENCES `photos` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `products_cart`
--
ALTER TABLE `products_cart`
  ADD CONSTRAINT `products_cart_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
