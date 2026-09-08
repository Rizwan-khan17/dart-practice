import 'package:weather_app_practice/data/models/astro_model.dart';
import 'package:weather_app_practice/data/models/day_model.dart';
import 'package:weather_app_practice/data/models/hour_model.dart';

class ForecastDayModel {
  String? date;
  // Converted int? to num? for safe numeric parsing
  num? dateEpoch;
  DayModel? day;
  AstroModel? astro;
  List<HourModel>? hour;

  ForecastDayModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  // Factory constructor to map JSON to model properties
  ForecastDayModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];

    day = json['day'] != null
        ? DayModel.fromJson(json['day'])
        : null;

    astro = json['astro'] != null
        ? AstroModel.fromJson(json['astro'])
        : null;

    if (json['hour'] != null) {
      hour = <HourModel>[];
      json['hour'].forEach((v) {
        hour!.add(HourModel.fromJson(v));
      });
    }
  }

  // Converts the class instance back to a JSON Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['date'] = date;
    data['date_epoch'] = dateEpoch;

    if (day != null) {
      data['day'] = day!.toJson();
    }

    if (astro != null) {
      data['astro'] = astro!.toJson();
    }

    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}