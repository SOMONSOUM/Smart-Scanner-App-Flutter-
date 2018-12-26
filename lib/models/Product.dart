import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:crud_app/const/global.dart';

class Product {
  int id;
  String name;
  String upc;
  String imageUrl;

  // Constructor
  Product({
    this.id,
    this.name,
    this.upc,
    this.imageUrl,
  });

  // This is a static method
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      upc: json["upc"],
      imageUrl: json["imageUrl"],
    );
  }
}

// Fetch data from RESTFul API
Future<List<Product>> fetchProducts(http.Client client) async {
  // How to make these URL in a .dart file ?
  final response = await client.get(URL_PRODUCTS);
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      final products = mapResponse["data"].cast<Map<String, dynamic>>();
      final listOfProducts = await products.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      return listOfProducts;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load Product from the Internet');
  }
}
