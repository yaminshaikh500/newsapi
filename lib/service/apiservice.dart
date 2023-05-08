import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/model/article.dart';
class ApiService{
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2023-04-08&sortBy=publishedAt&apiKey=3a37d63c77734dbb807454f7998efc7c";
  Future<List<Article>>getArticle() async{
    Response response= await get(Uri.parse(endpoint));
    if(response.statusCode==200){
      Map<String,dynamic> json =jsonDecode(response.body);
      List<dynamic> body = json["articles"];
      List<Article> article = body.map((dynamic item)=>Article.fromJson(item)).toList();
      return article;
    }
    else{
      throw "Data not found";
    }
  }
}