import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/catergory_tile.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  Future<QuerySnapshot> _getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection("products").get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
            tiles: snapshot.data!.docs.map((doc) {
              return CategoryTile(
                snapshot: doc,
              );
            }).toList(),
            color: Colors.grey[500],
          ).toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}
