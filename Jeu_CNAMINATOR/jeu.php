<?php

require_once ('jeu.js');

?>

<!DOCTYPE html>
<html>
    <head>
        <title>Connexion BDD Jeu</title>
        <meta charset="utf-8">
        <!-- <link rel="stylesheet" href="cours.css"> -->
    </head>
    <body>
        <h1>Bases de données MySQL Jeu</h1>
        <?php
            $servername = 'localhost';
            $username = 'root';
            $password = 'root';
            $dbname = 'jeu_cnaminator'

            //On établit la connexion
            $conn = new mysqli($servername, $username, $password, $dbname);

            //On vérifie la connexion
            if($conn->connect_error){
                die('Erreur : ' .$conn->connect_error);
            }
            echo 'Connexion réussie';

            //On ferme la Connexion
            $conn->close();
        ?>
    </body>
</html>
