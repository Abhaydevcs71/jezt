import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiapi_jetz/Time%20Screen/time_screen.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
 
  @override
  Widget build(BuildContext context) {
      DateTime dateTime = DateTime.now();
  String formattedDate = DateFormat.yMMMd().format(dateTime);
  String formattedTime = DateFormat.Hm().format(dateTime);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Current Time",style: TextStyle(fontSize: 20,color: Colors.black),),
            TextButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TimeScreen()),
                            );
                        }, child: const Text("See More timeZone"))
          ],
        ),
        Card(
                                      color: Color.fromARGB(255, 129, 163, 180),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "+5.30",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 83, 82, 82),
                                                  ),
                                                ),
                                                SizedBox(height: 7),
                                                Text(
                                                  "Asia/Kolkata",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 83, 82, 82),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  formattedDate,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Color.fromARGB(
                                                        255, 30, 29, 29),
                                                  ),
                                                ),
                                                Text(
                                                  formattedTime,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Color.fromARGB(
                                                        255, 30, 29, 29),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
      ],
    );
  }
}