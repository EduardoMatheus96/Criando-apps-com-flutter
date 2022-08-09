import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;
  late String id;

  late String title;
  late String description;

  late double price;

  late List images;
  late List sizes;

  ProductData.fromDoc(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.data()!["title"];
    description = snapshot.data()!["description"];
    price = snapshot.data()!['price'];
    images = snapshot.data()!['images'];
    sizes = snapshot.data()!['sizes'];
  }
}
