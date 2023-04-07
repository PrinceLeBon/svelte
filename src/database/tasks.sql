-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 07 avr. 2023 à 13:06
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tache`
--

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `completed`, `created_at`) VALUES
(1, 'Tâche n°0000', 'Description de la tâche n°23', 1, '2023-04-07 09:04:25'),
(2, 'Tâche n°91', 'Description de la tâche n°91', 1, '2023-04-07 09:04:25'),
(3, 'Tâche n°24', 'Description de la tâche n°24', 0, '2023-04-07 09:04:25'),
(4, 'Tâche n°92', 'Description de la tâche n°92', 0, '2023-04-07 09:04:25'),
(5, 'Tâche n°97', 'Description de la tâche n°97', 0, '2023-04-07 09:04:25'),
(6, 'Tâche n°25', 'Description de la tâche n°25', 0, '2023-04-07 09:04:25'),
(7, 'Tâche n°66', 'Description de la tâche n°66', 0, '2023-04-07 09:04:25'),
(8, 'Tâche n°74', 'Description de la tâche n°74', 0, '2023-04-07 09:04:25'),
(9, 'Tâche n°53', 'Description de la tâche n°53', 0, '2023-04-07 09:04:25'),
(10, 'Tâche n°62', 'Description de la tâche n°62', 0, '2023-04-07 09:04:25'),
(11, 'Tâche n°80', 'Description de la tâche n°80', 0, '2023-04-07 09:04:25'),
(12, 'Tâche n°12', 'Description de la tâche n°12', 0, '2023-04-07 09:04:25'),
(13, 'Tâche n°93', 'Description de la tâche n°93', 0, '2023-04-07 09:04:25'),
(14, 'Tâche n°59', 'Description de la tâche n°59', 0, '2023-04-07 09:04:25'),
(15, 'Tâche n°75', 'Description de la tâche n°75', 1, '2023-04-07 09:04:25'),
(16, 'test', 'testeuh', 0, '2023-04-07 09:06:58'),
(17, 's', 's', 0, '2023-04-07 09:08:04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
