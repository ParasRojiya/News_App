import 'dart:convert';
import 'package:news_app/modals/modals.dart';
import 'package:http/http.dart' as http;

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

class BusinessAPIHelper {
  BusinessAPIHelper._();

  static final BusinessAPIHelper businessAPIHelper = BusinessAPIHelper._();

  String url =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=42af38b65580434da69c5d60ecf4bdff";

  Future<BusinessNews?> fetchBusinessNews() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      BusinessNews? businessNews = BusinessNews.fromJSON(json: decodedData);

      return businessNews;
    }
    return null;
  }
}

class AppleAPIHelper {
  AppleAPIHelper._();

  static final AppleAPIHelper appleAPIHelper = AppleAPIHelper._();

  String url =
      "https://newsapi.org/v2/everything?q=apple&from=2022-09-28&to=2022-09-28&sortBy=popularity&apiKey=42af38b65580434da69c5d60ecf4bdff";

  Future<AppleNews?> fetchAppleNews() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      AppleNews? appleNews = AppleNews.fromJSON(json: decodedData);

      return appleNews;
    }
    return null;
  }
}
