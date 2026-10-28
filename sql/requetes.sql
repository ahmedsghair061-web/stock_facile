1/3 L'exécution s'est terminée sans erreur.
Résultat : Requête exécutée avec succès. Elle a pris 0 ms , 6 enregistrements affectés
À la ligne 7 :
INSERT INTO produits (nom, prix, quantite, disponible, date_ajout, categorie_id) VALUES
  ('Huile d''olive 1 L',   18.500,  24, 1, '2026-10-01T09:00:00', 1),
  ('Couscous moyen 1 kg',   2.300,  40, 1, '2026-10-01T09:05:00', 1),
  ('Eau minérale 1,5 L',    0.850, 120, 1, '2026-10-02T10:00:00', 2),
  ('Jus d''orange 1 L',     3.200,   0, 0, '2026-10-02T10:10:00', 2),
  ('Savon de Marseille',    2.900,  15, 1, '2026-10-03T11:00:00', 3),
  ('Cahier 96 pages',       1.600,  60, 1, '2026-10-04T08:30:00', 4);


  1.5/1.1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4
1.2 4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
1.3
1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2
1.4
Huile d'olive 1 L	Alimentation
Couscous moyen 1 kg	Alimentation
Eau minérale 1,5 L	Boissons
Jus d'orange 1 L	Boissons
Savon de Marseille	Hygiène
Cahier 96 pages	Papeterie
1.5
Alimentation	2
Boissons	2
Hygiène	1
Papeterie	1
1.5
777.5
1.6/
1.1Résultat : CHECK constraint failed: prix >= 0
1.2Résultat : FOREIGN KEY constraint failed
1.3Résultat : FOREIGN KEY constraint failed