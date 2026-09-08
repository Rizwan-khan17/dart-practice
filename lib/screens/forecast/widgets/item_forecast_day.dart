import 'package:flutter/material.dart';
import 'package:weather_app_practice/data/models/forecast_day_model.dart';
import 'package:weather_app_practice/screens/forecast/widgets/item_hourly_update.dart';

class ItemForecastDay extends StatelessWidget {
  final ForecastDayModel forecastDay;
  const ItemForecastDay({super.key, required this.forecastDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        // borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ListTile(
            title: const Text('DATE'),
            trailing: Text(forecastDay.date?? ''),
          ),
         ListTile(
           title: const Text('CONDITION'),
           trailing: Text(forecastDay.day?.condition?.text ?? 'N/A'),
           leading: Image.network(
             forecastDay.day?.condition?.icon?.replaceFirst('//', 'https://') ?? '',
           ),
         ),
          ListTile(
            title: const Text('MAX TEMP'),
            trailing: Text('${forecastDay.day?.maxtempC ?? 'N/A'}°C'),
          ),
          ListTile(
            title: const Text('MIN TEMP'),
            trailing: Text('${forecastDay.day?.mintempC ?? 'N/A'}°C'),
          ),
          ListTile(
            title: const Text('AVG TEMP'),
            trailing: Text('${forecastDay.day?.avgtempC ?? 'N/A'}°C'),
          ),
          ListTile(
            title: const Text('SUNRISE'),
            trailing: Text(forecastDay.astro?.sunrise ?? 'N/A'),
          ),
          ListTile(
            title: const Text('SUNSET'),
            trailing: Text(forecastDay.astro?.sunset ?? 'N/A'),
          ),
          ListTile(
            title: const Text('MOONRISE'),
            trailing: Text(forecastDay.astro?.moonrise ?? 'N/A'),
          ),
          ListTile(
            title: const Text('MOONSET'),
            trailing: Text(forecastDay.astro?.moonset ?? 'N/A'),
          ),
          ListTile(
            title: const Text('MOON PHASE'),
            trailing: Text(forecastDay.astro?.moonPhase ?? 'N/A'),
          ),
          ListTile(
            title: const Text('MOON ILLUMINATION'),
            trailing: Text('${forecastDay.astro?.moonIllumination ?? 'N/A'}%'),
          ),
          Divider(),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for(var hour in forecastDay.hour?? [])
                  ItemHourlyUpdate(hour: hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}
