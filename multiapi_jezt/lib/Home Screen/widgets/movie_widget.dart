import 'package:flutter/material.dart';
import 'package:multiapi_jetz/MovieScreen/Functions/functions.dart';

class MovieWidgetCard extends StatelessWidget {
  const MovieWidgetCard({
    super.key,
    
  });
 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        SizedBox(height: 10,),
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder<List>(
            future: fetchMovie(),

            builder: (context,snapshot) {
              if(snapshot.hasData){
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => MainCard(imageUrl: 'https://image.tmdb.org/t/p/w500${snapshot.data![index]['poster_path']}',),
                  ));
               }else if(snapshot.hasError){
                return Text(snapshot.error.toString());
               }
               return Center(child: CircularProgressIndicator(),);
               
                }
          ),
        )
      ],
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            ),
          )),
    );
  }
}