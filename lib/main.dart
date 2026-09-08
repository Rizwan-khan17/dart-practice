import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_practice/data/api/weather_api.dart';
import 'package:weather_app_practice/data/repository/weather_repo.dart';
import 'package:weather_app_practice/provider/forecast/forecast_provider.dart';
import 'package:weather_app_practice/provider/home/home_provider.dart';
import 'package:weather_app_practice/provider/main/main_provider.dart';
import 'package:weather_app_practice/provider/search/search_provider.dart';
import 'package:weather_app_practice/provider/weather/weather_provider.dart';
import 'package:weather_app_practice/screens/main/main_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=> MainProvider()),
        Provider(create: (context)=> WeatherApi()),
        Provider(create: (context)=> WeatherRepo(context.read<WeatherApi>())),
        ChangeNotifierProvider(create: (context)=>
            HomeProvider(context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context)=>
            ForecastProvider(context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context)=>
            SearchProvider(context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context)=>
            WeatherProvider(context.read<WeatherRepo>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}


