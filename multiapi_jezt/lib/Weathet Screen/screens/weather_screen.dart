import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:multiapi_jetz/Weathet%20Screen/bloc/weather_bloc_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<WeatherScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 299:
        return Image.asset('assets/200.png');
      case > 300 && <= 399:
        return Image.asset('assets/300.png');
      case > 500 && <= 599:
        return Image.asset('assets/500.png');
      case > 600 && <= 699:
        return Image.asset('assets/600.png');
      case > 700 && <= 799:
        return Image.asset('assets/700.png');
      case == 800:
        return Image.asset('assets/800.png');
      case == 801 && <= 899:
        return Image.asset('assets/01.png');

      default:
        return Image.asset('assets/01.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _determinePosition(),
      builder: (context,snap) {
        if(snap.hasData){
        return BlocProvider<WeatherBlocBloc>(
          create: (context) => WeatherBlocBloc()..add(FetchWeather(snap.data as Position)),
          child: Scaffold(
                  backgroundColor: Colors.black,
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    systemOverlayStyle:
                        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
                  ),
                  body: Padding(
                    padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(4, -0.3),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.deepPurple),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-4, -0.3),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.deepPurple),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, -1.2),
                            child: Container(
                              height: 300,
                              width: 600,
                              decoration: BoxDecoration(color: const Color(0xFFFFAB40)),
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.transparent),
                            ),
                          ),
                          BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                            builder: (context, state) {
                              if (state is WeatherBlocSuccess) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '📍${state.weather.areaName}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        'Good Morning',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 240,
                                                child: getWeatherIcon(
                                                    state.weather.weatherConditionCode!)
                                                // Image.asset(
                                                //   'assets/01.png',
                                                //   alignment: Alignment.center,
                                                //   height: 500,
                                                //   width: 500,
                                                // ),
                                                ),
                                            Text(
                                              '${state.weather.temperature!.celsius!.round()}°C',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              state.weather.weatherMain!.toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              DateFormat('EEEE dd -')
                                                  .add_jm()
                                                  .format(state.weather.date!),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 140,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: Image.asset('assets/sunrise.png')),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Sunrise',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    DateFormat()
                                                        .add_jm()
                                                        .format(state.weather.sunrise!),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: Image.asset('assets/moon.png')),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Sunset',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    DateFormat()
                                                        .add_jm()
                                                        .format(state.weather.sunset!),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5),
                                        child: Divider(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  width: 40,
                                                  height: 40,
                                                  child:
                                                      Image.asset('assets/hot_temp.png')),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Temp Max',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    '${state.weather.tempMax!.celsius!.round()}°C',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: 40,
                                                  height: 40,
                                                  child:
                                                      Image.asset('assets/cold_temp.png')),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Temp Min',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    '${state.weather.tempMin!.celsius!.round()}°C',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        );
        }else{
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }
      }
    );
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}