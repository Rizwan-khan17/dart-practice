import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/search/search_provider.dart';
import '../weather/weather_screen.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child){
      return provider.loading? Center(child: CircularProgressIndicator(),):
      ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    if(search.text.isNotEmpty){
                      provider.searchRegion(search.text);
                    }
                  },
                  icon: const Icon(Icons.search, color: Colors.white,),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          provider.loading? Center(child: CircularProgressIndicator(),): SizedBox(),
          for(var item in provider.items)
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> WeatherScreen(item: item)
                ));
              },
              title: Text(item.name?? ''),
              subtitle: Text('${item.region} (${item.country})'),
            )
        ],
      );
    }
    );
  }
}
