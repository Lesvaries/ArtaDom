-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 24 nov. 2025 à 17:10
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddartadom`
--
CREATE DATABASE IF NOT EXISTS `bddartadom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bddartadom`;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `id_artiste` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` int(11) NOT NULL,
  `date_naissance` date NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `artiste`
--

INSERT INTO `artiste` (`id_artiste`, `nom`, `prenom`, `photo`, `email`, `description`, `genre`, `date_naissance`, `id_role`) VALUES
(2, 'BORIS', 'VIOLENT', 'borisviolent.jpg', 'joris.barra@stcharles-stecroix.org', '46 auditeurs, Boris Violent est un grand aventurier', 1, '2004-06-19', 1),
(3, 'Sanglier', 'Melon', 'sangliermelon.jpg', 'mathis.besnard@stcharles-stecroix.org', 'un peintre de sanglier du domaine de la foret', 1, '2004-07-30', 1),
(4, 'Léonard', '‎ ', 'liplubo.jpg', 'mathis.dupont@stcharles-stecroix.org', 'Artiste Polyvalent, Saxophoniste Ténor de Jazz, Dessinateur, Peintre, Concepteur de jeu vidéo.', 1, '2003-08-27', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `typeCateg` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `typeCateg`) VALUES
(1, 'Clown'),
(2, 'Peintre'),
(3, 'Sculteur'),
(4, 'Vidéaste'),
(5, 'Danseur'),
(6, 'Photographe'),
(7, 'Illustrateur'),
(8, 'Dessinateur'),
(9, 'Graffeur'),
(10, 'Acteur'),
(11, 'Humoriste'),
(12, 'Marionnettiste'),
(13, 'Musicien'),
(14, 'DJ'),
(15, 'Compositeur'),
(16, 'Chef d\'orchestre'),
(17, 'Producteur musical'),
(18, 'Ecrivain'),
(19, 'Poète'),
(20, 'Scénariste'),
(21, 'Dramaturge'),
(22, 'Essayiste'),
(23, 'Parollier');

-- --------------------------------------------------------

--
-- Structure de la table `est`
--

CREATE TABLE `est` (
  `id_artiste` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `est`
--

INSERT INTO `est` (`id_artiste`, `id_groupe`) VALUES
(2, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `est_membre_de`
--

CREATE TABLE `est_membre_de` (
  `id_artiste` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `est_membre_de`
--

INSERT INTO `est_membre_de` (`id_artiste`, `id_categorie`) VALUES
(2, 14);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` int(11) NOT NULL,
  `nbre_artiste` tinyint(4) NOT NULL,
  `nomGrp` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_groupe`, `nbre_artiste`, `nomGrp`, `description`, `photo`, `email`) VALUES
(1, 2, 'les retardataires', 'le groupe le plus drôle mais aussi le plus en retard ', '', 'lesretards@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `traite` tinyint(1) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `date_envoi` date NOT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `id_artiste` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `id_prestation` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `id_artiste` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reserve`
--

CREATE TABLE `reserve` (
  `Lieu` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_prestation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `role`, `description`) VALUES
(1, 'Artiste', 'Artiste seul et téméraire'),
(2, 'ArtisteGr', 'Artiste affilié à un groupe'),
(3, 'collectif', 'Un artiste faisant partie du collectif');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `ville` varchar(25) NOT NULL,
  `Nom_de_rue` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`id_artiste`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `est`
--
ALTER TABLE `est`
  ADD PRIMARY KEY (`id_artiste`,`id_groupe`),
  ADD KEY `id_artiste` (`id_artiste`,`id_groupe`),
  ADD KEY `id_groupe3` (`id_groupe`);

--
-- Index pour la table `est_membre_de`
--
ALTER TABLE `est_membre_de`
  ADD PRIMARY KEY (`id_artiste`,`id_categorie`),
  ADD KEY `id_artiste` (`id_artiste`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_groupe` (`id_groupe`,`id_artiste`,`id_utilisateur`),
  ADD KEY `id_utilisateur2` (`id_utilisateur`),
  ADD KEY `id_artiste` (`id_artiste`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`id_prestation`),
  ADD KEY `id_groupe` (`id_groupe`,`id_artiste`),
  ADD KEY `id_artiste2` (`id_artiste`);

--
-- Index pour la table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`date`,`id_utilisateur`,`id_prestation`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_prestation` (`id_prestation`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `id_artiste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `id_prestation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `id_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `est`
--
ALTER TABLE `est`
  ADD CONSTRAINT `id_artiste3` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `id_groupe3` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`);

--
-- Contraintes pour la table `est_membre_de`
--
ALTER TABLE `est_membre_de`
  ADD CONSTRAINT `id_artiste4` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `id_artiste` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `id_groupe` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`),
  ADD CONSTRAINT `id_utilisateur2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD CONSTRAINT `id_artiste2` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `id_groupe2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`);

--
-- Contraintes pour la table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `id_prestation` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  ADD CONSTRAINT `id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
