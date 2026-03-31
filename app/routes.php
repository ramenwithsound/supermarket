<?php
require_once 'app/controllers/AuthController.php';
require_once 'app/controllers/CaisseController.php';
require_once 'app/controllers/StatsController.php';

// ---- Auth ----
Flight::route('GET /login',  ['AuthController', 'showLogin']);
Flight::route('POST /login', ['AuthController', 'doLogin']);
Flight::route('GET /logout', ['AuthController', 'logout']);

// ---- Accueil : choix caisse ----
Flight::route('GET /',               ['CaisseController', 'accueil']);
Flight::route('POST /choisir-caisse',['CaisseController', 'choisirCaisse']);

// ---- Caisse : saisie achats ----
Flight::route('GET /caisse',          ['CaisseController', 'index']);
Flight::route('POST /ajouter-achat',  ['CaisseController', 'ajouterAchat']);
Flight::route('POST /cloturer-achat', ['CaisseController', 'cloturerAchat']);

// ---- Stats ----
Flight::route('GET /stats', ['StatsController', 'index']);
