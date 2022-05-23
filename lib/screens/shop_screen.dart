
import 'package:first_flutter_app/model/http_helper.dart';
import 'package:first_flutter_app/model/product.dart';
import 'package:first_flutter_app/screens/shop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:strintcurrency/strintcurrency.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  ListProduct list = ListProduct();
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: gridViewBuilder(),
    );
    
  }

  Widget gridViewBuilder(){
    final strintcurrency = StrIntCurrency();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: list.products?.length,
        shrinkWrap: false,
        itemBuilder: (context, index){
          return GridTile(
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list.products![index].title!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize:22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                  // shadows: [
                                  //   Shadow(
                                  //     offset: Offset(1.0, 1.0),
                                  //     blurRadius: 2.0,
                                  //     color: Colors.grey
                                  //   )
                                  // ]
                                ),
                              ),
                              Text(
                                strintcurrency.intToStringID(int.parse(list.products![index].price!.split('.')[0])),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                  // shadows: [
                                  //   Shadow(
                                  //     offset: Offset(1.0, 1.0),
                                  //     blurRadius: 2.0,
                                  //     color: Colors.grey
                                  //   )
                                  // ]
                                ),
                              )
                            ],
                          ),
                        )
                      ),
            ),
            child: InkResponse(
              onTap: () => _onTileClicked(list.products![index]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    list.products![index].imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },


      );
  }
  void _onTileClicked(Product product){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> ShopDetailScreen(product: product))
    );

  }

  Future getData() async{
    ListProduct listProduct = await list.getProducts();
    setState(() {
      list = listProduct;
    });
  }
}