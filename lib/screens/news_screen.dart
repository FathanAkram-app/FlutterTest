import 'package:first_flutter_app/model/http_helper.dart';
import 'package:first_flutter_app/model/news.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ListNews list = ListNews([]);
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport News'),
      ),
      body: gridViewBuilder(),
    );
  }

  Widget gridViewBuilder(){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: list.news?.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return GridTile(
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                        padding: const EdgeInsets.all(24),
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
                        child: Text(
                          list.news![index].title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:22,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Colors.grey
                              )
                            ]
                          ),
                        )
                      ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  list.news![index].urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },


      );
  }
  
  Future getData() async{
    
    final ListNews result = await list.getNews('sports');
    setState(() {
      list = result;
    });
  }
}