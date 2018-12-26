import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:crud_app/models/Product.dart';
import 'package:crud_app/utils/Color.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.bkColor,
          centerTitle: true,
          title: Text(
            product.name,
            style: TextStyle(fontFamily: "Cabin Sketch"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.plusCircle,
                size: 24,
              ),
              onPressed: () => {},
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(product.imageUrl),
            new Padding(padding: new EdgeInsets.only(bottom: 36.0)),
            Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 64.0),
              child: new Text(
                  "This is an awesome product which provided by our company. Hopefully, you will make a good decision",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.black54)),
            ),
          ],
        ));
  }
}
