import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news1/pages/category.dart';
import 'package:news1/services/api.dart';
import 'dart:math' as math;

import '../widgets/article_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Choose News Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 0,
              thickness: 1,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'business');
                          },
                        ));
                      },
                      child: const Text(
                        'business',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'entertainment');
                          },
                        ));
                      },
                      child: const Text(
                        'entertainment',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'health');
                          },
                        ));
                      },
                      child: const Text(
                        'health',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'science');
                          },
                        ));
                      },
                      child: const Text(
                        'science',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'sports');
                          },
                        ));
                      },
                      child: const Text(
                        'sports',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Category(categorty: 'technology');
                          },
                        ));
                      },
                      child: const Text(
                        'technology',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 0,
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Best News:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: Api.getGeneral(),
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
