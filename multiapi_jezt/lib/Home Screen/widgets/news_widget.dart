import 'package:flutter/material.dart';
import 'package:multiapi_jetz/NewsScreen/Functions/functions.dart';
import 'package:multiapi_jetz/NewsScreen/components/newsbox.dart';
import 'package:multiapi_jetz/NewsScreen/constants/constants.dart';

class NewsWigetCard extends StatefulWidget {
  const NewsWigetCard({super.key});

  @override
  State<NewsWigetCard> createState() => _NewsWigetCardState();
}

class _NewsWigetCardState extends State<NewsWigetCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ));
                    },
                  ));
  }
}