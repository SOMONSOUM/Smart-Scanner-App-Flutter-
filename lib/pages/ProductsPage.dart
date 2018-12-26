import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:crud_app/models/Product.dart';
import 'package:crud_app/pages/ProductDetailsPage.dart';

class ProductsPage extends StatefulWidget {
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProducts(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? ProductList(products: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  // Constructor
  ProductList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: new Text(products[index].name),
              subtitle: new Text(products[index].upc),
              leading: new Image.network(
                products[index].imageUrl,
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        });
  }
}
