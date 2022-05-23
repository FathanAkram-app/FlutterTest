
import 'package:first_flutter_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopDetailScreen extends StatelessWidget {
  final Product product;
  const ShopDetailScreen({Key? key, required this.product}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title.toString())),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.topCenter,
        child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  color: Colors.grey
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.imageUrl.toString(),
                      fit: BoxFit.contain
                    ),
                  ),
                ),
                Text(product.title.toString(), style: const TextStyle(fontSize: 22)),
                Text(product.description.toString(), style: const TextStyle(fontSize: 18)),
                Text(product.price.toString(), style: const TextStyle(fontSize: 18)),
                Text(product.category.toString(), style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      );
  
  }
}