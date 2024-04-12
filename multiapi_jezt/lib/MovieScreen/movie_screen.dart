import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiapi_jetz/MovieScreen/Functions/functions.dart';
import 'package:multiapi_jetz/MovieScreen/components/movie_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder<List>(
        future: fetchMovie(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
           return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context,index){
          return MovieWidget(
          id: snapshot.data![index]['id'].toString(),
          month: '',
          day: '',
          posterpath: 'https://image.tmdb.org/t/p/w500${snapshot.data![index]['poster_path']}',
          movieName: snapshot.data![index]['name'] ?? 'no title',
          description: snapshot.data![index]['overview'],
        );
        });
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(),);
        },
         
      )
    );
  }
}
