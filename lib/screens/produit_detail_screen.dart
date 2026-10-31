import 'package:flutter/material.dart';

import 'package:stock_facile/models/produit.dart';
import 'package:stock_facile/models/categorie.dart';

import 'package:stock_facile/database/produit_dao.dart';
import 'package:stock_facile/database/categorie_dao.dart';

class _ProduitDetailData {
  final Produit produit;
  final Categorie? categorie;

  _ProduitDetailData(this.produit, this.categorie);
}

class ProduitDetailScreen extends StatefulWidget {
  final int id;

  const ProduitDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ProduitDetailScreen> createState() =>
      _ProduitDetailScreenState();
}

class _ProduitDetailScreenState
    extends State<ProduitDetailScreen> {

  late Future<_ProduitDetailData?> _futurDetails;

  @override
  void initState() {
    super.initState();
    _futurDetails = _chargerDetails();
  }

  Future<_ProduitDetailData?> _chargerDetails() async {
    // Lire le produit
    final produit = await ProduitDao()
        .lireProduitParId(widget.id);

    if (produit == null) {
      return null;
    }

    // Lire sa catégorie
    final categorie = await CategorieDao()
        .lireCategorieParId(produit.categorieId);

    return _ProduitDetailData(produit, categorie);
  }

  String formaterDate(DateTime date) {
    final jour = date.day.toString().padLeft(2, '0');
    final mois = date.month.toString().padLeft(2, '0');
    final annee = date.year.toString();

    return '$jour/$mois/$annee';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail du produit'),
        backgroundColor: Colors.blueAccent,
      ),

      body: FutureBuilder<_ProduitDetailData?>(
        future: _futurDetails,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Produit introuvable'),
            );
          }

          final produit = snapshot.data!.produit;
          final categorie = snapshot.data!.categorie;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Center(
                        child: Icon(
                          Icons.inventory_2,
                          size: 65,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        produit.nom,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Divider(height: 30),

                      ListTile(
                        leading: const Icon(Icons.attach_money),
                        title: const Text('Prix'),
                        subtitle: Text(
                          '${produit.prix.toStringAsFixed(3)} DT',
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.numbers),
                        title: const Text('Quantité'),
                        subtitle: Text('${produit.quantite}'),
                      ),

                      ListTile(
                        leading: const Icon(Icons.check_circle),
                        title: const Text('Disponibilité'),
                        subtitle: Text(
                          produit.disponible
                              ? 'Disponible'
                              : 'Non disponible',
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.category),
                        title: const Text('Catégorie'),
                        subtitle: Text(
                          categorie?.nom ?? 'Catégorie introuvable',
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: const Text('Date d\'ajout'),
                        subtitle: Text(
                          formaterDate(produit.dateAjout),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}