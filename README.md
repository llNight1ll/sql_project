# 🗃️ Projet : Base de données SQL + Remplissage automatique en PHP

Ce projet contient :
1. Une **base de données relationnelle** modélisée en SQL (schéma visible ci-dessous).
2. Un **script PHP (`filldb.php`)** permettant de remplir automatiquement la base avec des données générées dynamiquement.

---

## 🧱 Schéma de la base de données

La base de données contient les tables suivantes :

- `users` : utilisateurs
- `addresses` : adresses des utilisateurs
- `photos` : photos de profil
- `products` : catalogue de produits
- `carts` : paniers
- `products_cart` : liaison produits/paniers
- `commands` : commandes
- `payments` : paiements
- `invoices` : factures

🖼️ **Aperçu du modèle relationnel** :

<img width="1515" height="848" alt="image" src="https://github.com/user-attachments/assets/4eb5dd24-01fd-4091-9537-3f82002de5ef" />


---

## 🐘 Script de génération automatique (`filldb.php`)

Le fichier `filldb.php` permet de générer automatiquement un ensemble de données réalistes pour effectuer des tests sur la base.

### ✨ Fonctionnalités :

- Génération de plusieurs **utilisateurs** avec infos personnelles
- Insertion de **produits** aléatoires
- Création de **paniers**, **commandes**, **paiements** et **factures**
- Possibilité d’utiliser la bibliothèque [`Faker`](https://github.com/fzaninotto/Faker) pour PHP

---
