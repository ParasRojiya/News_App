class Global {
  static List<Map<String, dynamic>> categories = [
    {
      'category': 'Business',
    },
    {
      'category': 'Entertainment',
    },
    {
      'category': 'Sports',
    },
    {
      'category': 'Health',
    },
    {
      'category': 'Technology',
    },
    {
      'category': 'Apple News',
    },
  ];

  static String url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=42af38b65580434da69c5d60ecf4bdff";

  static String category = 'Business';
  static String webURL = "https://www.google.co.in";
}
