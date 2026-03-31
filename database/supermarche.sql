CREATE DATABASE supermarche;
USE supermarche;

CREATE TABLE produits (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    nom_produit VARCHAR(255) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL
);

CREATE TABLE caisses (
    id_caisse INT AUTO_INCREMENT PRIMARY KEY,
    nom_caisse VARCHAR(255) NOT NULL
);