
import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banc d’essai'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      ElevatedButton(
  onPressed: () async {
    final db = await DatabaseHelper().database;

    final lignes = await db.query('produits');

    debugPrint(lignes.toString());
  },
  child: const Text('Test : lire les produits'),
),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
        ],
      ),
    );
  }
}
