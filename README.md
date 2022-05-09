# Marketplace
## Procédure de démarrage
(La totalité des lignes de commandes devront être exécutées dans le terminal laragon en se situant dans le dossier backend)
1) Exposer l'api sur l'emulateur :
```
php artisan serve --host 0.0.0.0
```
2) Effectuer le seeding:
```
php artisan db:seed
php artisan migrate:fresh --seed
```

## Dans le cas ou le seeding ne fonctionne pas :

1) Si le fichier vendor/autoload.php n'existe pas, réinstallez composer :
```
composer install
```
## Dans le cas ou des erreurs de connection à la base de données apparaissent :
1) Si le fichier .env n'existe pas :
- copier coller le fichier .env.example dans .env
- modifier le fichier .env pour qu'il corresponde à la config de la db
- générer un jeton d'authentification :
```
php artisan jwt:secret
```
2) Si un problème persiste, vérifier le fichier ./config/database.php
## Schéma des requêtes :
- Connexion de l'utilisateur :
- Récupération du token :

## A faire
gestion des erreurs
faire le front de l'admin