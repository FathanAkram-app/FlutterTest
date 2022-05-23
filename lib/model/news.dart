

import 'dart:convert';

import 'package:first_flutter_app/model/http_helper.dart';

import 'package:http/http.dart' as http;

class News{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  );
  
}
class ListNews extends HttpHelper{
  List<News>? news;

  ListNews(
    this.news
  );

  Future<ListNews> getNews(String category) async{
    Map<String,dynamic> parameters = {'q':category, 'apiKey':apiKey};
    Uri uri = Uri.https(authority, getNewsPath, parameters);
    http.Response result = await http.get(uri);
    Map<String,dynamic> data = json.decode(result.body);
    ListNews listNews = ListNews.fromJson(data);
    return listNews;
  }

  ListNews.fromJson(Map<String, dynamic> newsMap){
    List<News> tempList = [];
    for (var element in newsMap['articles']) {
      tempList.add(
        News(
          element['author'], 
          element['title'], 
          element['description'], 
          element['url'], 
          element['urlToImage'], 
          element['publishedAt'], 
          element['content']
        )
      );
    }
    news = tempList;


  }


}