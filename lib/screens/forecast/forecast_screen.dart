import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_practice/provider/forecast/forecast_provider.dart';
import 'package:weather_app_practice/screens/forecast/widgets/item_forecast_day.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(builder: (
    context, provider, child){
      return provider.loading? Center(child: CircularProgressIndicator(),):
     ListView(
       children: [
         for(var day in provider.forecastDays)
           ItemForecastDay(forecastDay: day),
           // ListTile(
           //   title: Text(day.date!),
           //   subtitle: Text(day.day!.avgtempC.toString()),
           // ),
       ],
     );
    });
  }
}
