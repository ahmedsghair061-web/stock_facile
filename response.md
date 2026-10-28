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
3.2/
(1) Que se passe-t-il si on écrit deux fois `DatabaseHelper()` dans le code ?

La classe utilise le **patron Singleton** avec un constructeur `factory`. Même si on appelle `DatabaseHelper()` plusieurs fois, on récupère la même instance de la classe. Un seul objet `DatabaseHelper` est donc créé.

Le mot-clé `factory` permet à un constructeur de ne pas créer systématiquement une nouvelle instance : il peut retourner un objet déjà existant.


L'opérateur `??=` affecte une valeur à une variable uniquement si cette variable vaut `null`.

Exemple :

```dart
Database? _database;

_database ??= await openDatabase(...);
```

La base de données est ouverte et affectée à `_database` uniquement si `_database` est encore `null`. Si elle contient déjà une instance, celle-ci est conservée.

(3) Pourquoi `PRAGMA foreign_keys = ON` est-il placé dans `onConfigure` et non dans `onCreate` ?

`onConfigure` est appelé lors de l'ouverture de la connexion à la base de données. Il permet donc d'activer les clés étrangères à chaque ouverture.

`onCreate` est appelé uniquement lorsque la base de données est créée pour la première fois. Si l'activation des clés étrangères était placée uniquement dans `onCreate`, elle ne serait pas réexécutée lors des ouvertures suivantes.
Combien de fois `onCreate` est-il appelé dans toute la vie de l'application ?

`onCreate` est appelé une seule fois lors de la création initiale de la base de données, pour une version donnée.

Il n'est pas rappelé à chaque lancement de l'application. Il peut toutefois être exécuté de nouveau si la base est supprimée puis recréée, ou si une nouvelle base est créée à un autre emplacement. Une modification de version déclenche plutôt `onUpgrade`.

3.4/- Chemin complet de la base : [copier le chemin affiché]
- Message onCreate : [copier le message affiché, ou indiquer qu'il ne s'affiche pas]
- Nombre de catégories : [indiquer le nombre affiché]
3.5/La méthode onCreate de SQLite est appelée uniquement lorsque la base de données est créée pour la première fois. Lorsque tu arrêtes puis relances l'application, le fichier de la base existe déjà sur le disque : SQLite le réutilise sans recréer les tables.
