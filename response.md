1/3 1. Stocker disponible (booléen)
On utilise le type INTEGER :
- 1 = vrai (TRUE), le produit est disponible.
- 0 = faux (FALSE), le produit n’est pas disponible.
Stocker date_ajout (date et heure)
On peut utiliser le type TEXT, en enregistrant la date au format ISO 8601 :
2.  . AUTOINCREMENT
Permet de générer automatiquement un identifiant entier pour chaque nouvelle ligne, en évitant de réutiliser les identifiants déjà attribués.
3. ON DELETE RESTRICT est une contrainte de clé étrangère en SQLite qui empêche la suppression d'un enregistrement s'il est encore référencé par d'autres enregistrements.
1/4
En SQL, on écrit 'Huile d''olive' avec deux apostrophes consécutives ('') pour représenter une apostrophe à l'intérieur d'une chaîne de caractères.
1.8/Verrouillage du fichier (locking) : SQLite utilise des verrous pour contrôler l'accès simultané à la base. Si DB Browser effectue une opération ou garde une transaction ouverte, l'autre programme peut recevoir l'erreur database is locked.

2.3/int? id : autorise null avant l'insertion en base.



if (id != null) 'id': id : évite d'envoyer un identifiant inexistant lors d'une nouvelle insertion.



SQLite génère l'identifiant si la clé primaire est configurée pour cela.
