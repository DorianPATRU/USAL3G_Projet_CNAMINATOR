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
   participant_sex CHAR(1) NOT NULL,
   participant_age INT NOT NULL,
   participant_passion VARCHAR(50) NOT NULL,
   participant_hair_color VARCHAR(20) NOT NULL,
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

INSERT INTO questions
(question_id, )
