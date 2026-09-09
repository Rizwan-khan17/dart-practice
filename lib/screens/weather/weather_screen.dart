import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_practice/data/models/search_model.dart';
import 'package:weather_app_practice/provider/weather/weather_provider.dart';


class WeatherScreen extends StatefulWidget {
  final SearchModel item;
  const WeatherScreen({super.key, required this.item});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    context.read<WeatherProvider>().getCurrentWeather(widget.item.name?? '');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, provider, child){
          return Scaffold(
            appBar: AppBar(),
            body: provider.loading? Center(child: CircularProgressIndicator(),):
            Column(
              children: [
                ListTile(
                  title: Text('Name'),
                  trailing: Text(provider.location?.name?? ''),
                  // subtitle: Text(provider.location?.region?? ''),
                ),
                // ListTile(
                //   title: Text('Region'),
                //   trailing: Text(provider.location?.region?? ''),
                //   // subtitle: Text(provider.location?.country?? ''),
                // ),
                ListTile(
                  title: Text('Country'),
                  trailing: Text(provider.location?.country?? ''),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text('Temperature (C / F)'),
                  trailing: Text('${provider.current?.tempC}°C / ${provider.current?.tempF}°F'),
                ),
                ListTile(
                  title: Text('Condition'),
                  trailing: Text(provider.current?.condition?.text?? ''),
                  leading: Image.network(provider.current?.condition?.icon?.replaceFirst('//', 'https://')?? ''),
                ),
                ListTile(
                  title: Text('Feels Like (C / F)'),
                  trailing: Text('${provider.current?.feelslikeC}°C / ${provider.current?.feelslikeF}°F'),
                ),
                ListTile(
                  title: Text('Wind (Mph / Kph)'),
                  trailing: Text('${provider.current?.windMph}Mph / ${provider.current?.windKph}Kph'),
                ),
                ListTile(
                  title: Text('Humidity'),
                  trailing: Text('${provider.current?.humidity}%'),
                ),
                ListTile(
                  title: Text('Cloud'),
                  trailing: Text('${provider.current?.cloud}%'),
                ),
                ListTile(
                  title: Text('Pressure (Mb / In)'),
                  trailing: Text('${provider.current?.pressureMb}Mb / ${provider.current?.pressureIn}In'),
                ),
                ListTile(
                  title: Text('Precip (Mm / In)'),
                  trailing: Text('${provider.current?.precipMm}Mm / ${provider.current?.precipIn}In'),
                ),
                ListTile(
                  title: Text('Uv'),
                  trailing: Text('${provider.current?.uv}'),
                ),
                ListTile(
                  title: Text('Last Updated'),
                  trailing: Text(provider.current?.lastUpdated?? ''),
                ),
                ElevatedButton(onPressed: (){
                  provider.getCurrentWeather('Islamabad');
                }, child: Text('Refresh'))

              ],
            ),
          );
        });
  }
}
