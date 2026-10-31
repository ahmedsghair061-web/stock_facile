import 'package:flutter/material.dart';
import 'package:stock_facile/models/produit.dart';
import 'package:stock_facile/database/produit_dao.dart';
import 'package:stock_facile/widgets/produit_tile.dart';
import 'package:stock_facile/screens/produit_detail_screen.dart';

class ProduitsScreen extends StatefulWidget {
  const ProduitsScreen({super.key});

  @override
  State<ProduitsScreen> createState() => _ProduitsScreenState();
}

class _ProduitsScreenState extends State<ProduitsScreen> {
  final ProduitDao _dao = ProduitDao();

  late Future<List<Produit>> _futurProduits;

  @override
  void initState() {
    super.initState();

    _futurProduits = _dao.lireProduits();
  }

  Future<void> _rafraichir() async {
    setState(() {
      _futurProduits = _dao.lireProduits();
    });

    await _futurProduits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des produits'),
        backgroundColor: Colors.blueAccent,
      ),

      body: FutureBuilder<List<Produit>>(
        future: _futurProduits,

        builder: (context, snapshot) {

          // 1. Chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 2. Erreur
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // 3. Liste vide
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aucun produit',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }

          // 4. Données reçues
          final produits = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _rafraichir,

            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: produits.length,

              itemBuilder: (context, index) {
                final produit = produits[index];

                return ProduitTile(
                  produit: produit,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProduitDetailScreen(id: produit.id!),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}return ProduitTile(
  produit: produit,

  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProduitDetailScreen(
          id: produit.id!,
        ),
      ),
    );
  },
);