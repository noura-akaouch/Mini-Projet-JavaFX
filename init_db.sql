--Création de la base de données
CREATE DATABASE IF NOT EXISTS salle_de_sport;
USE salle_de_sport;

--Table pour l'Entité 1 (Membre)
CREATE TABLE IF NOT EXISTS membre (
                                      id_membre INT AUTO_INCREMENT PRIMARY KEY,
                                      nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(15),
    email VARCHAR(50),
    date_inscription DATE NOT NULL
    );

--Table pour l'Entité 2 (Abonnement)
CREATE TABLE IF NOT EXISTS abonnement (
                                          id_abonnement INT AUTO_INCREMENT PRIMARY KEY,
                                          type_abonnement ENUM('Mensuel', 'Trimestriel', 'Annuel') NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    statut VARCHAR(20) DEFAULT 'Actif',
    id_membre INT NOT NULL,
    FOREIGN KEY (id_membre) REFERENCES membre(id_membre) ON DELETE CASCADE
    );