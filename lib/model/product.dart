// {
//   "id": 7,
//   "createdAt": "2022-05-19T04:06:53.496Z",
//   "updatedAt": "2022-05-19T04:06:53.496Z",
//   "title": "Raket Yonex",
//   "description": "Raket Bulutangkis dengan merek yonex",
//   "price": "700000.00",
//   "category": "sports"
// }
import 'dart:convert';

import 'package:first_flutter_app/model/http_helper.dart';
import 'package:http/http.dart' as http;

class Product{
  int? id;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? price;
  String? category;
  String? imageUrl;

  Product({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.price,
    this.category,
    this.imageUrl
});

}
class ListProduct extends HttpHelper{
  List<Product>? products;

  ListProduct({
    this.products
  });

  Future<ListProduct> getProducts() async{
    const String baseUrlLocal = "localhost:3000";
    const String getProductsPath = "/products";
    Map<String,dynamic> parameters = {'s':'{"category": "sports"}'};
    Uri uri = Uri.http(baseUrlLocal, getProductsPath, parameters);

    http.Response result = await http.get(uri);
    List<dynamic> data = json.decode(result.body);
    ListProduct listProduct = ListProduct.fromJson(data);
    
    
    return listProduct;
  }

  ListProduct.fromJson(List productsList){
    List<Product> tempList = [];
    for (var element in productsList) {
      final product = Product();
      product.id = element['id'];
      product.createdAt = element['createdAt'];
      product.updatedAt = element['updatedAt'];
      product.title =  element['title']; 
      product.description = element['description'];
      product.price = element['price'];
      product.category = element['category'];
      product.imageUrl = element['imageUrl'];

      tempList.add(product);
    }
    products = tempList;

  }

}

class UninitializedProducts extends ListProduct {

  
}