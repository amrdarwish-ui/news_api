import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    required this.title,
    required this.url,
    required this.urlToImage,
  }) : super(key: key);
  final String url;
  final String title;
  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              launchUrl(Uri.parse(url));
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(urlToImage), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title),
          ),
          IconButton(
              onPressed: () {
                ShareExtend.share(url, 'text');
              },
              icon: const Icon(Icons.share))
        ],
      ),
    );
  }
}
