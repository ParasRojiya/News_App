import 'package:flutter/material.dart';
import 'package:news_app/helpers/news_api_helper.dart';

import '../globals/global.dart';
import '../modals/modals.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(Global.category),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        child: FutureBuilder(
          future:
              AllCategoriesAPIHelper.allCategoriesAPIHelper.fetchCategoryNews(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              AllCategories data = snapshot.data;

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.articles.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('detail_page',
                          arguments: data.articles[i]);
                    },
                    child: Container(
                      width: width,
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
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${data.articles[i]['urlToImage']}"),
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
    );
  }
}
