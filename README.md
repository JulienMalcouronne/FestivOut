Rails app generated with lewagon/rails-templates, created by the Théophile, Maël, Amir et Julien in 10 days.

Pour visualiser l'application en production, il suffit de suivre le lien suivant : https://www.festivout.com/

To visualize the app, please follow the link below : https://www.festivout.com/


Si vous souhaitez utiliser le code en local, il faudra suivre les étapes suivantes dans le terminal :
1 - bundle install           Cette commande procèdera à l'installation de l'ensemble des gems que nous avons utilisées. 
2 - yarn install             Pour installer toutes les dépendances 
3 - rails db:migrate         Ceci de mettre à jour le schéma de la base de données avec les dernières modifications

Ce projet utilise Cloudinary, MAPBOX GL ainsi que STRIPE. Pour une utilisation complète en développement, il vous faudra donc vous munir d'une clé API Cloudinary, MAPBOX GL et STRIPE en mode test. Il faudra idéalement créer un fichier .env à la racine du dossier et y insérer vos clés API.

4 - rails serve pour lancer votre serveur local

La version en production utilise le mode test de l'API STRIPE, si vous souhaitez donc réaliser une commande, il faudra utiliser la carte bancaire de test suivante : 
4242 4242 4242 4242 
02/22
123

Cette application a été designé pour un usage PWA elle ne sera donc pas responsive si vous ouvrez l'app depuis un ordinateur. 

// Technologies utilisées // 

Ruby / Ruby on Rails /
MAPBOX GL /
Stimulus JS /
HTML / ERB /
CSS / Bootstrap
