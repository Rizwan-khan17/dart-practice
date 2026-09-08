import 'package:weather_app_practice/data/api/weather_api.dart';
import 'package:weather_app_practice/data/models/current_weather_response.dart';
import 'package:weather_app_practice/data/models/forecast_day_model.dart';

import '../models/search_model.dart';

class WeatherRepo {
  WeatherApi api;

  WeatherRepo(this.api);

  Future<CurrentWeatherResponse?> getCurrentWeather(String city)async{
  CurrentWeatherResponse? response = await api.getCurrentWeather(city);
  return response;
  }
  Future<List<ForecastDayModel>> getForecast(String city, int days)async{
     List<ForecastDayModel> forecastDays = await api.getForecast(city, days);
     return forecastDays;
  }

  Future<List<SearchModel>> searchRegion(String city)async{
    List<SearchModel> items = await api.searchRegion(city);
    return items;
  }
}
