-- ============================================
-- TD Caisse Supermarché - Base de données
-- ============================================

CREATE DATABASE IF NOT EXISTS supermarche CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE supermarche;

-- Table Produit
CREATE TABLE IF NOT EXISTS produit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    quantite_stock INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Caisse
CREATE TABLE IF NOT EXISTS caisse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    libelle VARCHAR(50) NOT NULL,
    actif TINYINT(1) DEFAULT 1
);

-- Table Achat (un achat = un client)
CREATE TABLE IF NOT EXISTS achat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    caisse_id INT NOT NULL,
    date_achat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cloture TINYINT(1) DEFAULT 0,
    FOREIGN KEY (caisse_id) REFERENCES caisse(id)
);

-- Table Ligne d'achat (détail de chaque achat)
CREATE TABLE IF NOT EXISTS achat_ligne (
    id INT AUTO_INCREMENT PRIMARY KEY,
    achat_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (achat_id) REFERENCES achat(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);

-- Table Utilisateur (pour le login - Travaux 4)
CREATE TABLE IF NOT EXISTS utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL
);

-- ============================================
-- Données de test
-- ============================================

-- 5 Produits
INSERT INTO produit (designation, prix, quantite_stock) VALUES
('Biscuit',   1000.00, 150),
('Pain',       400.00, 200),
('Lait',       800.00,  80),
('Riz (1kg)', 1500.00, 300),
('Sucre (1kg)',1200.00, 100);

-- 2 Caisses
INSERT INTO caisse (numero, libelle) VALUES
(1, 'Caisse n°1'),
(2, 'Caisse n°2');

-- 1 Utilisateur admin
INSERT INTO utilisateur (login, mot_de_passe) VALUES
('admin', MD5('admin123'));
