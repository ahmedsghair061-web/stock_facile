import 'package:flutter/material.dart';
import 'package:stock_facile/models/produit.dart';

class ProduitTile extends StatelessWidget {
  final Produit produit;
  final VoidCallback onTap;

  const ProduitTile({
    super.key,
    required this.produit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      leading: CircleAvatar(
        backgroundColor:
            produit.quantite == 0 ? Colors.red : Colors.green,
        child: Text(
          '${produit.quantite}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      title: Text(
        produit.nom,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(
        '${produit.prix.toStringAsFixed(3)} DT',
      ),

      trailing: Icon(
        produit.disponible
            ? Icons.check_circle
            : Icons.cancel,
        color: produit.disponible
            ? Colors.green
            : Colors.red,
      ),
    );
  }
}