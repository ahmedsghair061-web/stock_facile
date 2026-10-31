import 'package:stock_facile/database/database_helper.dart';
import 'package:stock_facile/models/produit.dart';
import 'package:flutter/foundation.dart';
class ProduitDao {
  final String table = 'produits';

  // Lire tous les produits
  Future<List<Produit>> lireProduits() async {
    debugPrint('Lecture des produits dans SQLite...');

    final db = await DatabaseHelper().database;

    final lignes = await db.query(
      table,
      orderBy: 'nom ASC',
    );

    return lignes.map((ligne) {
      return Produit.fromMap(ligne);
    }).toList();
  }

  // Lire un produit par son ID
  Future<Produit?> lireProduitParId(int id) async {
    final db = await DatabaseHelper().database;

    final lignes = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    return lignes.isEmpty
        ? null
        : Produit.fromMap(lignes.first);
  }
}