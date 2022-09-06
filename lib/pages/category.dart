import 'package:flutter/material.dart';

import '../services/api.dart';
import '../widgets/article_widget.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.categorty}) : super(key: key);
  final String categorty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                categorty,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: Api.getCategory(categorty),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ArticleWidget(
                                  title: snapshot.data[index].title,
                                  url: snapshot.data[index].url,
                                  urlToImage: snapshot.data[index].urlToImage);
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
