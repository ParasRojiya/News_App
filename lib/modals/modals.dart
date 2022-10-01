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

class AllCategories {
  final List articles;
  AllCategories({
    required this.articles,
  });

  factory AllCategories.fromJSON({required Map json}) {
    return AllCategories(
      articles: json['articles'],
    );
  }
}
