import 'package:flutter/material.dart';
import 'package:news_app/screens/categorypage.dart';
import 'package:news_app/screens/detailpage.dart';
import 'package:news_app/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
        'category_page': (context) => const CategoryPage(),
      },
    ),
  );
}
