

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiapi_jetz/MovieScreen/components/poster.dart';

class MovieWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  const MovieWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                        letterSpacing: 4,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PosterWidget(
                    url: posterpath,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              
                      SizedBox(width: 10,),
                    ],
                  ),
                  // SizedBox(height: 10,),
                  Text('Coming on $day $month'),
                  SizedBox(height: 10,),
                  Text(
                    movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    description,
                    maxLines: 4,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}