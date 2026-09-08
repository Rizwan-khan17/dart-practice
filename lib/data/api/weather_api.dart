import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_practice/data/models/current_weather_response.dart';

import '../models/forecast_day_model.dart';
import '../models/search_model.dart';

class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<CurrentWeatherResponse?> getCurrentWeather(String city)async{
    try{
      final res = await http.get(Uri.parse(
          '$baseUrl/current.json?key=ea4cf793e272429fb84153317260609&q=$city&days=1&aqi=no&alerts=no'
      ));
      final data = await jsonDecode(res.body);
      CurrentWeatherResponse response = CurrentWeatherResponse.fromJson(data);
      return response;
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<List<ForecastDayModel>> getForecast(String city, int days)async{
    try{
      final res = await http.get(Uri.parse(
        '$baseUrl/forecast.json?key=ea4cf793e272429fb84153317260609&q=$city&days=$days&aqi=no&alerts=no'));
      final data = await jsonDecode(res.body);
      List dataList = data['forecast']['forecastday'];
      List<ForecastDayModel> forecastDay = dataList.map((e) => ForecastDayModel.fromJson(e)).toList();
      return forecastDay;
    }catch(e){
      print(e);
    }
    return [];
  }

  Future<List<SearchModel>> searchRegion(String city)async {
    try {
      final res = await http.get(Uri.parse(
          '$baseUrl/search.json?key=ea4cf793e272429fb84153317260609&q=$city'));
      final data = await jsonDecode(res.body);
      List dataList = data;
      List<SearchModel> items = dataList
          .map((e) => SearchModel.fromJson(e))
          .toList();
      return items;
    } catch (e) {
      print(e);
    }
    return [];
  }
}