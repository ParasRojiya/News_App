import 'package:flutter/material.dart';
import 'package:news_app/heplers/news_api_helper.dart';

import '../modals/modals.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String title = "Category";
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    if (res['category'] == 'Business') {
      title = "Business";
    } else if (res['category'] == 'Apple News') {
      title = 'Apple News';
    } else if (res['category'] == 'Crypto') {
      title = "Crypto";
    } else if (res['category'] == 'Sports') {
      title = 'Sports';
    } else if (res['category'] == 'Entertainment') {
      title = 'Entertainment';
    }

    fetchNewsData() {
      if (res['category'] == 'Business') {
        return BusinessAPIHelper.businessAPIHelper.fetchBusinessNews();
      } else if (res['category'] == 'Apple News') {
        return AppleAPIHelper.appleAPIHelper.fetchAppleNews();
      } else if (res['category'] == 'Crypto') {
      } else if (res['category'] == 'Sports') {
      } else if (res['category'] == 'Entertainment') {}
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        height: _height,
        width: _width,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        child: FutureBuilder(
          future: fetchNewsData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              if (res['category'] == 'Business') {
              } else if (res['category'] == 'Apple News') {
                AppleNews data = snapshot.data;
              } else if (res['category'] == 'Crypto') {
              } else if (res['category'] == 'Sports') {
              } else if (res['category'] == 'Entertainment') {}

              BusinessNews data = snapshot.data;
              return ListView.builder(
                itemCount: data.articles.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('detail_page',
                          arguments: data.articles[i]);
                    },
                    child: Container(
                      width: _width,
                      height: 370,
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
                      child: SingleChildScrollView(
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
                              width: _width,
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
                    ),
                  );

                  //return Text("${data?.articles[i]['author']}");
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  categoryNews(dynamic res) {
    if (res['category'] == 'Business') {}
  }
}
