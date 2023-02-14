import 'dart:convert';

import 'package:friday_application/MODEL/articole_data.dart';
import 'package:http/http.dart';

class ApiService {
  String endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=it&apiKey=15bd130457514612b37d14454253d207";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
