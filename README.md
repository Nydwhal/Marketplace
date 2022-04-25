# Marketplace

# Lancer Laragon
# Pour exposer l'api sur l'emulateur :
A faire sur le terminal laragon dans le dossier Backend-MarketPlace
```
php artisan serve --host 0.0.0.0
```
<!-- Mettre son l'adresse ip de sa machine dans le .env du projet fultter -->
<!-- Ouvrir la collection marketplace dans postman
Le mot de passe de john est "password" 
Le mot de passe de jonathan est "pomme1"
Faire les routes restantes-->

# Si le dossier vendor n'existe pas :
```
composer install
```
Cela permet de récupérer le fichier autoload.php nécessaire

# Configurer la db côté back :
Vérifier les infos contenus dans le .env concernant la db (nom de la db et mot de passe). Entrez les mêmes infos dans le fichier ./config/database.php.
# Effectuer le seeding:
```
php artisan db:seed
php artisan migrate:fresh --seed
```

# Générer jwt avec :
```
php artisan jwt:secret
```