import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:news1/models/article.dart';

class Api {
  static Future<List<Article>> getGeneral() async {
    String apiKey = '161e5be74b954e13baf98e4c9da86834';
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=$apiKey');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }

  static Future<List<Article>> getCategory(String category) async {
    String apiKey = '161e5be74b954e13baf98e4c9da86834';
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }
}
