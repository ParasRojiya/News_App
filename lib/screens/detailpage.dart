import 'package:flutter/material.dart';

import '../globals/global.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed News Page"),
      ),
      body: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        width: _width,
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 300,
              width: _width,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  image: NetworkImage("${res['urlToImage']}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${res['title']}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const SizedBox(width: 4),
                Text(
                  "${res['author']}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                const Spacer(),
                Text(
                  "${res['publishedAt']}".split('T')[0],
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
            const SizedBox(height: 18),
            SingleChildScrollView(
              child: Text(
                "${res['content']}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "- ${res['source']['name']}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Global.webURL = res['url'];
                Navigator.of(context).pushNamed('web_page', arguments: res);
              },
              child: Text("Go to ${res['source']['name']} WebPage"),
            ),
          ],
        ),
      ),
    );
  }
}
