-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 07 avr. 2025 à 09:12
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aaaaaaa`
--

-- --------------------------------------------------------

--
-- Structure de la table `cm__1_`
--

CREATE TABLE `cm__1_` (
  `id` int(1) DEFAULT NULL,
  `Code_Postal` varchar(5) DEFAULT NULL,
  `Nom` varchar(36) DEFAULT NULL,
  `Adresse` varchar(49) DEFAULT NULL,
  `Paroisse` int(1) DEFAULT NULL,
  `Position` varchar(38) DEFAULT NULL,
  `imagen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cm__1_`
--

INSERT INTO `cm__1_` (`id`, `Code_Postal`, `Nom`, `Adresse`, `Paroisse`, `Position`, `imagen_id`) VALUES
(1, 'AD500', 'Hospital Nostra Senyora de Meritxell', 'Avinguda de Tarragona, 1, Andorra la Vella', 5, '42.51176222685382, 1.533902553020172', NULL),
(2, 'AD600', 'Centre medic de St Julia', 'Carrer de la Uni?, 6, Sant Juli? de L?ria', 6, '42.46500436021446, 1.4905371', NULL),
(3, 'AD300', 'Centre medic de la Massana', 'Avinguda Sant Antoni, 35, La Massana', 3, '42.5452080178234, 1.5153408079409334', NULL),
(4, 'AD700', 'Centre medic de Escaldes Engordany', 'Carrer de Prat de la Creu, 88, Escaldes-Engordany', 7, '42.5083408863411, 1.5341926699402684', NULL),
(5, 'AD400', 'Centre medic d\'Ordino', 'Carrer de la Borda, 2, Ordino', 4, '42.556507557878255, 1.5348561260366433', NULL),
(6, 'AD100', 'Centre medic de Canillo', 'Carrer de la Solana, 1, Canillo', 1, '42.5562889975294, 1.5348414337565246', NULL),
(7, 'AD200', 'Centre medic d\'Encamp', 'Carrer de les Escoles, 2, Encamp', 2, '42.5363808206809, 1.5814452818569134', NULL),
(8, 'AD500', 'Som salut', 'Baixada del Mol? 18, 1r-3a, Andorra la Vella', 5, '42.505643784218, 1.5179352106915303', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comu`
--

CREATE TABLE `comu` (
  `id` int(8) NOT NULL,
  `nom` varchar(128) NOT NULL,
  `cp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comu`
--

INSERT INTO `comu` (`id`, `nom`, `cp`) VALUES
(1, 'Canillo', 'AD100'),
(2, 'Encamp', 'AD200'),
(3, 'Ordino', 'AD300'),
(4, 'La Massana', 'AD400'),
(5, 'Andorra la Vella', 'AD500'),
(6, 'Sant Julia de Loria', 'AD600'),
(7, 'Escaldes Engordany', 'AD700');

-- --------------------------------------------------------

--
-- Structure de la table `cs`
--

CREATE TABLE `cs` (
  `id` int(16) NOT NULL,
  `Code_Postal` varchar(11) DEFAULT NULL,
  `Nom` varchar(38) DEFAULT NULL,
  `Adresse` varchar(62) DEFAULT NULL,
  `Paroisse` varchar(19) DEFAULT NULL,
  `Position` varchar(38) DEFAULT NULL,
  `imagen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cs`
--

INSERT INTO `cs` (`id`, `Code_Postal`, `Nom`, `Adresse`, `Paroisse`, `Position`, `imagen_id`) VALUES
(1, 'AD500', 'Centre Esportiu dels Serradells', 'Cam? de la Grau, AD500 Andorre-la-Vieille, Andorre\n', '5', '42.49970506270853, 1.5190517818554985', NULL),
(2, 'AD500', 'Poliesportiu d?Andorra', 'Carrer Baixada del Mol?, 24, AD500 Andorre-la-Vieille, Andorre', '5', '42.505205517330346, 1.5164224628113907', NULL),
(3, 'AD200', 'Centre Esportiu d?Encamp', 'Avinguda de Rouillac, AD200 Encamp, Andorre', '2', '42.53580329357578, 1.5807577413790517', NULL),
(4, 'AD300', 'Centre Esportiu d\'Ordino', 'Carrer dels C?ms, AD300 Ordino, Andorre', '3', '42.55642276279818, 1.532287910993546', NULL),
(5, 'AD100', 'Centre esportiu de Canillo', 'Av. Sant Joan de Caselles, AD100 Canillo, Andorre', '1', '42.566566955399345, 1.5979825395296459', NULL),
(6, 'AD600', 'Centre esportiu de Sant Juli? de Loria', 'Avinguda Rocafort, AD600 Sant Juli? de L?ria, Andorre', '6', '42.46582535911463, 1.4922024260331903', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `tamano` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `imagen` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `imagenes`
--

INSERT INTO `imagenes` (`id`, `nombre`, `tipo`, `tamano`, `fecha_creacion`, `imagen`) VALUES
(1, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(2, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(3, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(4, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(5, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(6, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(7, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(8, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(9, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(10, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(11, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(12, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(13, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(14, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(15, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(16, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(17, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(18, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(19, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(20, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(21, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(22, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(23, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(24, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(25, 'parc1.jpg', '', 0, '2025-04-01 13:11:19', ''),
(26, 'parc2.jpg', '', 0, '2025-04-01 13:11:19', ''),
(27, 'parc3.jpg', '', 0, '2025-04-01 13:11:19', ''),
(28, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(29, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(30, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(31, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(32, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(33, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(34, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(35, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(36, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(37, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(38, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(39, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(40, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(41, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(42, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(43, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(44, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(45, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(46, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(47, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(48, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', ''),
(49, 'parc1.jpg', '', 0, '2025-04-01 13:11:20', ''),
(50, 'parc2.jpg', '', 0, '2025-04-01 13:11:20', ''),
(51, 'parc3.jpg', '', 0, '2025-04-01 13:11:20', '');

-- --------------------------------------------------------

--
-- Structure de la table `parc__2_`
--

CREATE TABLE `parc__2_` (
  `id` int(1) DEFAULT NULL,
  `Code_Postal` varchar(5) DEFAULT NULL,
  `Nom` varchar(43) DEFAULT NULL,
  `Adresse` varchar(52) DEFAULT NULL,
  `Paroisse` int(1) DEFAULT NULL,
  `Position` varchar(38) DEFAULT NULL,
  `imagen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parc__2_`
--

INSERT INTO `parc__2_` (`id`, `Code_Postal`, `Nom`, `Adresse`, `Paroisse`, `Position`, `imagen_id`) VALUES
(1, 'AD400', 'Parque Natural de les Valls del Comapedrosa', 'AD400 La Massana', 4, '42.588514097742284, 1.4660145004744998', 1),
(2, 'AD300', 'Parc naturel de Sorteny', 'AD300 Ordino', 3, '42.6233492397104, 1.5785781844974185', NULL),
(3, 'AD700', 'Vall del Madriu-Perafita-Claror', 'Prat de la creu 74-76 baixos, AD500 Andorra la Vella', 7, '42.48511615270526, 1.6035506366154009', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comu`
--
ALTER TABLE `comu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cs`
--
ALTER TABLE `cs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comu`
--
ALTER TABLE `comu`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `cs`
--
ALTER TABLE `cs`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
