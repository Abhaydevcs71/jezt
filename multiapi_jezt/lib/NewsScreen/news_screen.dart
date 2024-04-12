import 'package:flutter/material.dart';
import 'package:multiapi_jetz/NewsScreen/Functions/functions.dart';
import 'package:multiapi_jetz/NewsScreen/components/appbar.dart';
import 'package:multiapi_jetz/NewsScreen/components/newsbox.dart';
import 'package:multiapi_jetz/NewsScreen/components/searchbar.dart';
import 'package:multiapi_jetz/NewsScreen/constants/constants.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<NewsScreen> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appbar(),
        body: SafeArea(
          child: Column(
            children: [
              SearchBarWidget(),
              Expanded(
                child: Container(
                    width: w,
                    child: FutureBuilder<List>(
                      future: fetchnews(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
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
                    )),
              ),
            ],
          ),
        ));
  }
}
