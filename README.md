# S7J2 - Projet EventFreeka : Authentification et Interface

## 📖 L'Essentiel : automatisation et standardisation
L'enjeu majeur de cette étape est la transition d'une gestion manuelle des sessions vers l'adoption de standards industriels. En intégrant la gem Devise, nous automatisons des fonctionnalités critiques (inscription, hachage sécurisé, récupération de mot de passe) qui garantissent la robustesse de l'application. Pour EventFreeka, cette étape transforme un backend statique en une plateforme interactive où la sécurité rencontre l'expérience utilisateur. L'utilisation de Bootstrap 5 permet d'habiller ces processus complexes avec une interface professionnelle, fluide et responsive, respectant la philosophie "Convention Over Configuration" de Rails.

## 🛠️ Guide d'installation 

Ce guide détaille les étapes pour cloner, configurer et lancer le projet en environnement de développement et de production.

### 1. Prérequis
Assurez-vous d'avoir les versions suivantes installées :
- Ruby (version spécifiée dans le Gemfile)
- Rails 7.x
- PostgreSQL (pour la production via Neon.com) ou SQLite3 (développement)

### 2. Installation des dépendances
Clonez le dépôt et installez les gems nécessaires :
```bash
bundle install
```
### 3. Configuration de la base de données
Initialisez votre base de données et passez les migrations :
```bash
rails db:create
rails db:migrate
```
### 4. Configuration de Devise et Action Mailer
Assurez-vous que les variables d'URL pour Action Mailer sont configurées selon l'environnement :  
Développement : `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`  
Production : Configurez l'URL réelle de votre instance (Render) dans `production.rb`.
### 5. Peuplement de la base (Seed)
Pour tester l'interface avec des données réalistes :
```bash
rails db:seed
```
### 6. Lancement du serveur
`rails server` 

L'application sera accessible sur http://localhost:3000.
