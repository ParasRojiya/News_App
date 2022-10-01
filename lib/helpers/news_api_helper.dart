import 'dart:convert';
import 'package:news_app/modals/modals.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/globals/global.dart';

class NewsAPIHelper {
  NewsAPIHelper._();

  static final NewsAPIHelper newsAPIHelper = NewsAPIHelper._();

  String url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=42af38b65580434da69c5d60ecf4bdff";

  Future<TopHeadlines?> fetchNewsData() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      TopHeadlines? topHeadlines = TopHeadlines.fromJSON(json: decodedData);

      return topHeadlines;
    }
    return null;
  }
}

class AllCategoriesAPIHelper {
  AllCategoriesAPIHelper._();

  static final AllCategoriesAPIHelper allCategoriesAPIHelper =
      AllCategoriesAPIHelper._();

  // String url =
  //     "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=42af38b65580434da69c5d60ecf4bdff";

  Future<AllCategories?> fetchCategoryNews() async {
    http.Response res = await http.get(Uri.parse(Global.url));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      AllCategories? entertainmentNews =
          AllCategories.fromJSON(json: decodedData);

      return entertainmentNews;
    }
    return null;
  }
}
