import 'package:flutter/material.dart';
import 'package:multiapi_jetz/Weathet%20Screen/screens/weather_screen.dart';

class WeatherWidgetCard extends StatelessWidget {
  const WeatherWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkResponse(
        onTap: (){
          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WeatherScreen()),
                          );
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.amber[200]
          ),
          height: 90,
          width: double.infinity,
         // color: Colors.amber[100],
          child: Center(child: Text("Check Current Weather",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blue[600]),)),
        ),
      ),
    );
  }
}