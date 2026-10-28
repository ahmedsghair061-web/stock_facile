
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/categorie_dao.dart';
import '../models/categorie.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banc d’essai'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bouton 1 : ouvrir la base et compter les catégories
          ElevatedButton(
            onPressed: () async {
              try {
                final db = await DatabaseHelper().database;

                final resultat = await db.rawQuery(
                  'SELECT COUNT(*) AS nb FROM categories',
                );

                debugPrint(
                  'Nombre de catégories : ${resultat.first['nb']}',
                );
              } catch (e) {
                debugPrint('Erreur lors de l’ouverture de la base : $e');
              }
            },
            child: const Text('Ouvrir la base'),
          ),

          const SizedBox(height: 16),

          // Bouton 2 : ajouter une catégorie
          ElevatedButton(
            onPressed: () async {
              try {
                final dao = CategorieDao();

                final id = await dao.insererCategorie(
                  const Categorie(
                    nom: 'Électroménager',
                    description: 'Petits appareils',
                  ),
                );

                debugPrint('ID de la catégorie insérée : $id');
              } catch (e) {
                debugPrint('Erreur lors de l’insertion : $e');
              }
            },
            child: const Text('Test : ajouter une catégorie'),
          ),
        ],
      ),
    );
  }
}
