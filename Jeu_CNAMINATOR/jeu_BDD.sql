/* Supprimer la base de données si elle existe */
DROP DATABASE IF EXISTS jeu_cnaminator;

/* Création de la base de données si elle n'existe pas avec le jeu de caractères */
CREATE DATABASE IF NOT EXISTS jeu_cnaminator DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

/* Utiliser la base de données */
USE jeu_cnaminator;

/* Création de la table auditeurs */
CREATE TABLE auditors(
   auditor_id INT AUTO_INCREMENT,
   auditor_lastname VARCHAR(50) NOT NULL,
   auditor_firstname VARCHAR(50) NOT NULL,
   auditor_kind CHAR(1) NOT NULL,
   auditor_age INT NOT NULL,
   auditor_passion VARCHAR(50) NOT NULL,
   auditor_hair_color VARCHAR(20) NOT NULL,
   auditor_eyes_color VARCHAR(20) NOT NULL,
   PRIMARY KEY(auditor_id)
);

/* Création de la table questions */
CREATE TABLE questions(
   question_id INT AUTO_INCREMENT,
   question_type VARCHAR(20) NOT NULL,
   question_description VARCHAR(255) NOT NULL,
   PRIMARY KEY(question_id)
);

/* Création de la table réponses */
CREATE TABLE responses(
   response_id INT AUTO_INCREMENT,
   response_type VARCHAR(20) NOT NULL,
   response_description VARCHAR(255) NOT NULL,
   PRIMARY KEY(response_id)
);

/* Création de la table intervenants */
CREATE TABLE speakers(
   speaker_id INT AUTO_INCREMENT,
   speaker_lastname VARCHAR(50) NOT NULL,
   speaker_firstname VARCHAR(50) NOT NULL,
   speaker_kind CHAR(1) NOT NULL,
   speaker_age INT NOT NULL,
   auditor_unit VARCHAR(50) NOT NULL,
   speaker_hair_color VARCHAR(20) NOT NULL,
   PRIMARY KEY(speaker_id)
);

/* Création de la table administrateurs */
CREATE TABLE administrators(
   administrator_id INT AUTO_INCREMENT,
   administrator_lastname VARCHAR(50) NOT NULL,
   administrator_firstname VARCHAR(50) NOT NULL,
   administrator_kind CHAR(1) NOT NULL,
   administrator_age INT NOT NULL,
   administrator_post VARCHAR(50) NOT NULL,
   administrator_hair_color VARCHAR(20) NOT NULL,
   PRIMARY KEY(administrator_id)
);

/* Création de la table de liaison attribute */
CREATE TABLE attribute(
   auditor_id INT AUTO_INCREMENT,
   question_id INT AUTO_INCREMENT,
   administrator_id INT AUTO_INCREMENT,
   speaker_id INT AUTO_INCREMENT,
   PRIMARY KEY(auditor_id, question_id, administrator_id, speaker_id),
   FOREIGN KEY(auditor_id) REFERENCES auditors(auditor_id),
   FOREIGN KEY(question_id) REFERENCES questions(question_id),
   FOREIGN KEY(administrator_id) REFERENCES administrators(administrator_id),
   FOREIGN KEY(speaker_id) REFERENCES speakers(speaker_id)
);

/* Création de la table de liaison associate */
CREATE TABLE associate(
   question_id INT AUTO_INCREMENT,
   response_id INT AUTO_INCREMENT,
   PRIMARY KEY(question_id, response_id),
   FOREIGN KEY(question_id) REFERENCES questions(question_id),
   FOREIGN KEY(response_id) REFERENCES responses(response_id)
);

/* Création de la table de liaison give */
CREATE TABLE give(
   auditor_id INT AUTO_INCREMENT,
   response_id INT AUTO_INCREMENT,
   administrator_id INT AUTO_INCREMENT,
   speaker_id INT AUTO_INCREMENT,
   PRIMARY KEY(auditor_id, response_id, administrator_id, speaker_id),
   FOREIGN KEY(auditor_id) REFERENCES auditors(auditor_id),
   FOREIGN KEY(response_id) REFERENCES responses(response_id),
   FOREIGN KEY(administrator_id) REFERENCES administrators(administrator_id),
   FOREIGN KEY(speaker_id) REFERENCES speakers(speaker_id)
);

/* Insertion des valeurs de la table auditeurs */
INSERT INTO auditors
  (auditor_id, auditor_lastname, auditor_firstname, auditor_kind,
  auditor_age, auditor_passion, auditor_hair_color, auditor_eyes_color)
VALUES
  (0, "FLAMENT", "Pauline", "F", 23, "lecture", "roux", "vert"),
  (0, "GLOUX", "Ethan", "M", 18, "gaming", "brun", "brun"),
  (0, "LECORNET", "Julien", "M", 20, "gagner de l''argent", "blond", "bleu"),
  (0, "MANSO", "Melanie", "F", 24, "regarder des series", "brun", "bleu"),
  (0, "NOVO", "Sandra", "M", 29, "handlettering", "noir", "brun"),
  (0, "PATRU", "Dorian", "M", 24, "gaming", "chatain", "vert"),
  (0, "TESTE", "Romain", "M", 22, "faire la fete", "brun", "brun");

/* Insertion des valeurs de la table intervenants */
INSERT INTO speakers
  (speaker_id, speaker_lastname, speaker_firstname, speaker_kind,
  speaker_age, speaker_unit, speaker_hair_color)
VALUES
  (0, "MAIGRET", "Benoit", "M", 33, "html-css algo-javascript", "noir"),
  (0, "DI MASCOLO", "Claudine", "F", 45, "methodes et outils communication ecrite", "rouge"),
  (0, "CHARIH", "Khalil", "M", 39, "php-mvc", "brun"),
  (0, "DEVOLDERE", "Mickael", "M", 40, "base de donnees", "brun"),
  (0, "BASTIAN", "Celia", "F", 45, "coaching personnalise", "blond"),
  (0, "SCHOTT", "Jean-Louis", "M", 64, "demarche de projet", "blanc"),
  (0, "PINTIAU", "Frederic", "M", 47, "ouverture aux cultures numeriques", "gris"),
  (0, "MATERA", "Sandro", "M", 38, "graphisme et web design numerique", "noir"),
  (0, "TSCHAEN", "Benjamin", "M", 29, "reseau systeme", "noir"),
  (0, "HELMER", "Jean-Luc", "M", 67, "economie et gestion de l''entreprise", "blanc");

  /* Insertion des valeurs de la table administrateurs */
  INSERT INTO administrators
  (administrator_id, administrator_lastname, administrator_firstname, administrator_kind,
  administrator_age, administrator_post, administrator_hair_color)
  VALUES
  (0, "GUIRAUD", "Steeve", "M", 21, "assistant commercial", "noir"),
  (0, "BOOTZ", "Megane", "F", 27, "cheffe de projet pedagogique", "blond"),
  (0, "TOURON", "Mathilde", "F", 28, "assistante de formation pedagogique", "brun");

  /* Insertion des valeurs de la table questions */
  INSERT INTO questions
  (question_id, question_type, question_description)
  VALUES
  (0, "kind", "Est-ce que la personne est une femme ?"),
  (0, "kind", "Est-ce que la personne est un homme ?"),
  (0, "age", "Est-ce que la personne a moins de 20 ans ?"),
  (0, "age", "Est-ce que la personne a plus de 20 ans ?"),
  (0, "age", "Est-ce que la personne a moins de 30 ans ?"),
  (0, "age", "Est-ce que la personne a plus de 30 ans ?"),
  (0, "age", "Est-ce que la personne a moins de 40 ans ?"),
  (0, "age", "Est-ce que la personne a plus de 40 ans ?"),
  (0, "age", "Est-ce que la personne a moins de 50 ans ?"),
  (0, "age", "Est-ce que la personne a plus de 50 ans ?"),
  (0, "age", "Est-ce que la personne a moins de 60 ans ?"),
  (0, "age", "Est-ce que la personne a plus de 60 ans ?"),
  (0, "role", "Est-ce que la personne est un intervenant au CNAM ?"),
  (0, "role", "Est-ce que la personne est un auditeur au CNAM ?"),
  (0, "role", "Est-ce que la personne fait partie de l''administration du CNAM ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux blonds ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux bruns ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux roux ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux noirs ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux châtains ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux gris ?"),
  (0, "hair color", "Est-ce que la personne a les cheveux blancs ?"),
  (0, "eyes color", "Est-ce que la personne a les yeux bleus ?"),
  (0, "eyes color", "Est-ce que la personne a les yeux verts ?"),
  (0, "eyes color", "Est-ce que la personne a les yeux bruns ?"),
  (0, "alternation", "Est-ce que la personne a trouvé facilement une alternance ?"),
  (0, "passion", "Est-ce que la personne a pour passion les jeux vidéo ?"),
  (0, "passion", "Est-ce que la personne a pour passion la lecture ?"),
  (0, "passion", "Est-ce que la personne a pour passion les séries ?"),
  (0, "passion", "Est-ce que la personne a pour passion les Handlettering ?"),
  (0, "passion", "Est-ce que la personne a pour passion faire de l''argent ?"),
  (0, "passion", "Est-ce que la personne a pour passion faire la fête ?");

  /* Insertion des valeurs de la table réponses */
  INSERT INTO responses
  (response_id, response_type, response_description)
  VALUES
  (0, "auditors", "La personne à laquelle je pense est-elle Pauline FLAMENT ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Mélanie MANSO ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Sandra NOVO ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Ethan GLOUX ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Dorian PATRU ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Romain TESTE ?"),
  (0, "auditors", "La personne à laquelle je pense est-elle Julien LECORNET ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Jean-Louis SCHOTT ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Benoit MAIGRET ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Claudine DI MASCOLO ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Khalil CHARIH ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Mickael DEVOLDERE ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Celia BASTIAN ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Jean-Louis SCHOTT ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Frédéric PINTIAU ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Sandro MATERA ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Benjamin TSCHAEN ?"),
  (0, "speakers", "La personne à laquelle je pense est-elle Jean-Luc HELMER ?"),
  (0, "administrators", "La personne à laquelle je pense est-elle Steeve GUIRAUD ?"),
  (0, "administrators", "La personne à laquelle je pense est-elle Mégane BOOTZ ?"),
  (0, "administrators", "La personne à laquelle je pense est-elle Mathilde TOURON ?");
