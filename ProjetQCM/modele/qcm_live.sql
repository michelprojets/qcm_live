-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 17 Octobre 2016 à 00:48
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `qcm_live`
--

-- --------------------------------------------------------

--
-- Structure de la table `bilan`
--

CREATE TABLE `bilan` (
  `id_bilan` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etu` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login` text COLLATE utf8_bin NOT NULL,
  `pass` text COLLATE utf8_bin NOT NULL,
  `matricule` int(8) NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_grpe` int(11) NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id_prof` int(11) NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login` text COLLATE utf8_bin NOT NULL,
  `pass` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_quest` int(11) NOT NULL,
  `id_theme` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `texte` text COLLATE utf8_bin NOT NULL,
  `bmultiple` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id_rep` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `texte_rep` text COLLATE utf8_bin NOT NULL,
  `bvalide` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE `resultat` (
  `id_res` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `id_rep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `sessio`
--

CREATE TABLE `sessio` (
  `id_session` int(11) NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL,
  `titre_sess` text COLLATE utf8_bin NOT NULL,
  `date_sess` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `id_test` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `bAutorise` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(11) NOT NULL,
  `descr_theme` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bilan`
--
ALTER TABLE `bilan`
  ADD PRIMARY KEY (`id_bilan`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etu`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_grpe`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_prof`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_quest`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id_rep`);

--
-- Index pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`id_res`);

--
-- Index pour la table `session`
--
ALTER TABLE `sessio`
  ADD PRIMARY KEY (`id_session`);

--
-- Index pour la table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_test`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- AUTO_INCREMENT pour les tables exportées
--

ALTER TABLE `groupe`
  MODIFY `id_grpe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bilan`
--
ALTER TABLE `bilan`
  MODIFY `id_bilan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_quest` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id_rep` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `sessio`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `test`
--
ALTER TABLE `test`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(11) NOT NULL AUTO_INCREMENT;
  
 -- Etudiant 
INSERT INTO etudiant (nom, prenom, email, login, pass, matricule,num_grpe)
VALUES ('Jean','Marc','email.truc@gmail.com','JeanMarc','123','65423','Groupe 1'); 

INSERT INTO etudiant (nom, prenom, email, login, pass, matricule,num_grpe)
VALUES ('Dark','Vador','email.truc@gmail.com','DarkVador','noir','654','Groupe 1'); 

INSERT INTO etudiant (nom, prenom, email, login, pass, matricule,num_grpe)
VALUES ('Mouse','Mickey','email.truc@gmail.com','MickeyMouse','1234','63','Groupe 2'); 

INSERT INTO etudiant (nom, prenom, email, login, pass, matricule,num_grpe)
VALUES ('Skywalker','Luke','email.truc@gmail.com','LukeSky','12345','543','Groupe 2');  
 
-- Prof
 
INSERT INTO professeur (nom, prenom, email, login, pass)
VALUES ('LeBlanc','Gandalf','email.truc@gmail.com','Gandalf','magie'); 
 
-- Groupe
  
INSERT INTO groupe (num_grpe)
VALUES ('Groupe 1'); 

INSERT INTO groupe (num_grpe)
VALUES ('Groupe 2'); 
 
 
-- theme
 
INSERT INTO theme (descr_theme)
VALUES ('Culture general'); 

INSERT INTO theme (descr_theme)
VALUES ('Hightech'); 
-- question

INSERT INTO question (id_theme, titre, texte, bmultiple)
VALUES ('1','Question','Pain au chocolat ou chocolatine ?','0'); 

INSERT INTO question (id_theme, titre, texte, bmultiple)
VALUES ('1','Question','De quel couleur est le ciel ?','0'); 
 
INSERT INTO question (id_theme, titre, texte, bmultiple)
VALUES ('2','Question','Quel est le mieux entre Ps4 et XboxOne ?','0'); 

INSERT INTO question (id_theme, titre, texte, bmultiple)
VALUES ('1','Question','De quel couleur est une vache ?','1'); 

INSERT INTO question (id_theme, titre, texte, bmultiple)
VALUES ('2','Question','De quel composant a besoin un PC pour fonctionner ?','1'); 
 
-- reponse 

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('1','Pain au chocolat','0'); 

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('1','Chocolatine','1'); 

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('2','Bleu','1'); 

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('2','Rouge','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('2','Vert','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('3','Ps4','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('3','Xbox','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('3','Le Pc evidemment !','1');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('4','Noir','1');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('4','Orange','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('4','Blanc','1');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('5','Un processeur','1');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('5','Un disque dur externe','0');

INSERT INTO reponse (id_quest, texte_rep, bvalide)
VALUES ('5','Une carte mère','1');



  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
