import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiapi_jetz/Time%20Screen/Functions/functions.dart';
import 'package:multiapi_jetz/Time%20Screen/components/searchbar.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  List<Map>? timezoneDataList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Zone'),
      ),
      body: Column(
        children: [
          SearchBarWidget(
            onSearch: (timezone) async {
              setState(() {
                isLoading = true;
              });
              final data = await fetchTime(timezone);
              setState(() {
                timezoneDataList!.add(data);
                isLoading = false;
              });
            },
          ),const SizedBox(height: 10,),
          const Row(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 12,),
              Text("eg: Asia/Kolkata",style: TextStyle(fontSize: 18,color: Colors.grey),),
            ],
          ),
          const SizedBox(height: 10),
          timezoneDataList!.isEmpty && !isLoading
              ? const Center(child: Text("Please search time zone",style: TextStyle(fontSize: 16),))
              : Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: timezoneDataList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final timezoneData = timezoneDataList![index];
                            String dateTimeString =
                                timezoneData['utc_datetime'];
                            String offset =
                                timezoneData['utc_offset'].substring(1, 3);
                            DateTime now = DateTime.parse(dateTimeString);
                            now = now.add(Duration(hours: int.parse(offset)));
                            DateTime dateTime =
                                DateTime.parse(dateTimeString);

                            String formattedDate =
                                DateFormat.yMMMd().format(dateTime);
                            String formattedTime =
                                DateFormat.Hm().format(now);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 110,
                                child: Card(
                                  color: const Color.fromARGB(255, 129, 163, 180),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              timezoneData['utc_offset'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 83, 82, 82),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Text(
                                              timezoneData['timezone'],
                                              style: const TextStyle(
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
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color.fromARGB(
                                                    255, 30, 29, 29),
                                              ),
                                            ),
                                            Text(
                                              formattedTime,
                                              style: const TextStyle(
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
                              ),
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}
