import 'package:flutter/material.dart';
import 'package:news_app/screens/categorypage.dart';
import 'package:news_app/screens/detailpage.dart';
import 'package:news_app/screens/homepage.dart';
import 'package:news_app/screens/webpage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
        'category_page': (context) => const CategoryPage(),
        'web_page': (context) => const WebPage(),
      },
    ),
  );
}
