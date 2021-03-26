/* Supprimer la base de données si elle existe */
DROP DATABASE IF EXISTS jeu_cnaminator;

/* Création de la base de données si elle n'existe pas avec le jeu de caractères */
CREATE DATABASE IF NOT EXISTS jeu_cnaminator DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

/* Utiliser la base de données */
USE jeu_cnaminator;

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

/* Création de la table participants */
CREATE TABLE participants(
   participant_id INT AUTO_INCREMENT,
   participant_lastname VARCHAR(50) NOT NULL,
   participant_firstname VARCHAR(50) NOT NULL,
   participant_kind CHAR(1) NOT NULL,
   participant_age INT NOT NULL,
   participant_passion VARCHAR(50) NOT NULL,
   participant_hair_color VARCHAR(20) NOT NULL,
   participant_eye_color VARCHAR (20) NOT NULL,
   response_id INT NOT NULL,
   PRIMARY KEY(participant_id),
   FOREIGN KEY(response_id) REFERENCES responses(response_id)
);

/* Création de la table de liaison attribute*/
CREATE TABLE attribute(
   participant_id INT,
   question_id INT,
   PRIMARY KEY(participant_id, question_id),
   FOREIGN KEY(participant_id) REFERENCES participants(participant_id),
   FOREIGN KEY(question_id) REFERENCES questions(question_id)
);

/*Création de la table de liaison associate */
CREATE TABLE associate(
   question_id INT,
   response_id INT,
   PRIMARY KEY(question_id, response_id),
   FOREIGN KEY(question_id) REFERENCES questions(question_id),
   FOREIGN KEY(response_id) REFERENCES responses(response_id)
);

INSERT INTO participants
  (participant_id, participant_lastname, participant_firstname, participant_kind,
  participant_age, participant_passion, participant_hair_color, participant_eye_color)
VALUES
  (1, "FLAMENT", "Pauline", "F", 23, "lecture", "roux", "vert"),
  (2, "GLOUX", "Ethan", "M", 18, "gaming", "brun", "brun"),
  (3, "GRANJON", "Lea", "F", 20, "gaming", "brun", "brun"),
  (4, "LECORNET", "Julien", "M", 20, "gagner de l''argent", "blond", "bleu"),
  (5, "MANSO", "Melanie", "F", 24, "regarder des series", "brun", "bleu"),
  (6, "NOVO", "Sandra", "M", 29, "handlettering", "noir", "brun"),
  (7, "PATRU", "Dorian", "M", 24, "gaming", "chatain", "vert"),
  (8, "TESTE", "Romain", "M", 22, "faire la fete", "brun", "brun"),
  (9, "MAIGRET", "Benoit", "M", 33, "lecture", "roux", "vert"),
  (10, "DEVOLDERE", "Mickael", "M", 40, "gaming", "brun", "bleu"),
  (10, "BASTIAN", "Celia", "F", 45, "developpement personnel", "brun", "brun"),
  (11, "GOZE", "Michel", "M", 60, "sciences", "brun", "brun"),
  (12, "SCHOTT", "Jean-Louis", "M", 64, "gagner de l''argent", "blond", "bleu"),
  (13, "PINTIAU", "Frederic", "M", 47, "regarder des series", "brun", "bleu"),
  (14, "MATERA", "Sandro", "M", 38, "handlettering", "noir", "brun"),
  (15, "TSCHAEN", "Benjamin", "M", 29, "gaming", "chatain", "vert"),
  (16, "WEISS", "Serge", "M", 55, "faire la fete", "brun", "brun"),
  (16, "HELMER", "Jean-Luc", "M", 67, "faire la fete", "brun", "brun");
