import 'package:flutter/material.dart';
import 'package:weather_app_practice/data/repository/weather_repo.dart';

import '../../data/models/current_model.dart';
import '../../data/models/current_weather_response.dart';
import '../../data/models/location_model.dart';

class HomeProvider with ChangeNotifier{
  WeatherRepo repo;
  LocationModel? location;
  CurrentModel? current;
  bool loading = false;


  HomeProvider(this.repo){
    getCurrentWeather('Islamabad');
  }



}