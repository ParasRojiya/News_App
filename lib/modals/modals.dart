class TopHeadlines {
  final List articles;
  TopHeadlines({
    required this.articles,
  });

  factory TopHeadlines.fromJSON({required Map json}) {
    return TopHeadlines(
      articles: json['articles'],
    );
  }
}

class BusinessNews {
  final List articles;
  BusinessNews({
    required this.articles,
  });

  factory BusinessNews.fromJSON({required Map json}) {
    return BusinessNews(
      articles: json['articles'],
    );
  }
}

class AppleNews {
  final List articles;
  AppleNews({
    required this.articles,
  });

  factory AppleNews.fromJSON({required Map json}) {
    return AppleNews(
      articles: json['articles'],
    );
  }
}
