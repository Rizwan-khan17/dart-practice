import 'package:flutter/material.dart';
import 'package:weather_app_practice/data/repository/weather_repo.dart';

import '../../data/models/search_model.dart';

class SearchProvider with ChangeNotifier{
  WeatherRepo repo;
  List<SearchModel> items = [];
  bool loading = false;


  SearchProvider(this.repo);

  searchRegion(String city)async{
    loading = true;
    notifyListeners();
    items = await repo.searchRegion(city);
    loading = false;
    notifyListeners();
  }
}
