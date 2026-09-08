import 'package:flutter/material.dart';

import '../../data/models/forecast_day_model.dart';
import '../../data/repository/weather_repo.dart';

class ForecastProvider with ChangeNotifier{
  WeatherRepo repo;
  List<ForecastDayModel> forecastDays = [];
  bool loading = false;

  ForecastProvider(this.repo) {
    getForecast();
  }

  getForecast()async{
    loading = true;
    notifyListeners();
    forecastDays = await repo.getForecast('Islamabad', 2);
    loading = false;
    notifyListeners();
  }
  }
