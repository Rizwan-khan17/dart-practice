import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_practice/provider/main/main_provider.dart';
import '../forecast/forecast_screen.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> widgets = [
    HomeScreen(),
    SearchScreen(),
    ForecastScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white,))
        ],
        leading: IconButton(onPressed: (){

        }, icon: Icon(Icons.menu, color: Colors.white,)),
        leadingWidth: 0,
        toolbarHeight: 60,
      ),
      body: widgets[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          provider.changeIndex(index);
        },
        currentIndex: provider.currentIndex,
        iconSize: 28,
          selectedItemColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_circle),
            label: "Forecast",
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
