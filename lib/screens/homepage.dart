import 'package:flutter/material.dart';

import '../globals/global.dart';
import '../helpers/news_api_helper.dart';
import '../modals/modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIUrl(String category) {
    if (category == 'Business') {
      Global.url =
          "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Business";
    } else if (category == 'Apple News') {
      Global.url =
          "https://newsapi.org/v2/everything?q=apple&from=2022-09-28&to=2022-09-28&sortBy=popularity&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Apple News";
    } else if (category == 'Sports') {
      Global.url =
          "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Sports";
    } else if (category == 'Entertainment') {
      Global.url =
          "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Entertainment";
    } else if (category == "Health") {
      Global.url =
          "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Health";
    } else if (category == "Technology") {
      Global.url =
          "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=42af38b65580434da69c5d60ecf4bdff";
      Global.category = "Technology";
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
        ),
        drawer: const Drawer(backgroundColor: Colors.grey),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: 70,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: Global.categories.map((e) {
                      return InkWell(
                        onTap: () {
                          APIUrl(e['category']);
                          Navigator.of(context)
                              .pushNamed('category_page', arguments: e);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          height: 50,
                          width: 130,
                          margin: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          child: Text(
                            "${e['category']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Text(
                  "Top Headlines",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(4),
                  child: FutureBuilder(
                    future: NewsAPIHelper.newsAPIHelper.fetchNewsData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        TopHeadlines? data = snapshot.data;

                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: data?.articles.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('detail_page',
                                    arguments: data.articles[i]);
                              },
                              child: Container(
                                width: width,
                                // height: 370,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 4),
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    // color: Colors.white.withOpacity(0.1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 0),
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          spreadRadius: 1)
                                    ]
                                    // border: Border.all(color: Colors.black),
                                    ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${data!.articles[i]['urlToImage']}"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      height: 260,
                                      width: width,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${data.articles[i]['title']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Tap to see more",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
