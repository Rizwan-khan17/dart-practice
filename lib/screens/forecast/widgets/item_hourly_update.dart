import 'package:flutter/material.dart';
import 'package:weather_app_practice/data/models/hour_model.dart';

class ItemHourlyUpdate extends StatelessWidget {
  final HourModel hour;
  const ItemHourlyUpdate({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      // margin: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.network(hour.condition?.icon?.replaceFirst('//', 'https://')??''),
          Text('${hour.tempC}°C'),
          Text(hour.time?? '', style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
    );
  }
}
