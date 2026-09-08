import 'package:weather_app_practice/data/models/current_model.dart';
import 'package:weather_app_practice/data/models/location_model.dart';

class CurrentWeatherResponse {
  LocationModel location;
  CurrentModel current;

  CurrentWeatherResponse(this.location, this.current);

  factory CurrentWeatherResponse.fromJson(json) => CurrentWeatherResponse(
    LocationModel.fromJson(json['location']),
    CurrentModel.fromJson(json['current']),
  );

}