import 'package:flutter/material.dart';
import 'package:multiapi_jetz/Home%20Screen/widgets/chat_widget.dart';
import 'package:multiapi_jetz/Home%20Screen/widgets/movie_widget.dart';
import 'package:multiapi_jetz/Home%20Screen/widgets/news_widget.dart';
import 'package:multiapi_jetz/Home%20Screen/widgets/time_widget.dart';
import 'package:multiapi_jetz/Home%20Screen/widgets/weather_widget_card.dart';
import 'package:multiapi_jetz/MovieScreen/movie_screen.dart';
import 'package:multiapi_jetz/NewsScreen/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.blueGrey,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                
                TimeWidget(),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(" Trending Movies",style: TextStyle(fontSize: 20,color: Colors.black),),
                      TextButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MovieScreen()),
                          );
                      }, child: const Text("See More"))
                    ],
                  ),
                  const MovieWidgetCard()
                ],),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hot News",style: TextStyle(fontSize: 20,color: Colors.black),),
                        TextButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewsScreen()),
                          );
                      }, child: const Text("See More"))
                      ],
                    ),
                    NewsWigetCard()
                  ],
                ),
                WeatherWidgetCard(),
                ChatGptWidgetCard(),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
