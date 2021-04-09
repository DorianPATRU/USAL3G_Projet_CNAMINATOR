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
  (0, "GRANJON", "Lea", "F", 20, "gaming", "brun", "brun"),
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
  (0, "MAIGRET", "Benoit", "M", 33, "lecture", "roux"),
  (0, "DI MASCOLO", "Claudine", "M", 45, "lecture", "roux"),
  (0, "CHARIH", "Khalil", "M", 33, "lecture", "roux"),
  (0, "DEVOLDERE", "Mickael", "M", 40, "gaming", "brun"),
  (0, "EDEBAU", "Marjorie", "M", 40, "gaming", "brun"),
  (0, "BASTIAN", "Celia", "F", 45, "developpement personnel", "brun"),
  (0, "GOZE", "Michel", "M", 60, "sciences", "brun"),
  (0, "SCHOTT", "Jean-Louis", "M", 64, "gagner de l''argent", "blond"),
  (0, "PINTIAU", "Frederic", "M", 47, "regarder des series", "brun"),
  (0, "MATERA", "Sandro", "M", 38, "handlettering", "noir"),
  (0, "TSCHAEN", "Benjamin", "M", 29, "gaming", "chatain"),
  (0, "WEISS", "Serge", "M", 55, "faire la fete", "brun"),
  (0, "HELMER", "Jean-Luc", "M", 67, "faire la fete", "brun");
