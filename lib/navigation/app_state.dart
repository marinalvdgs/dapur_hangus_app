import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/navigation/recipe_route_information_parser.dart';
import 'package:flutter/material.dart';

class RecipeAppState extends ChangeNotifier {
  int _selectedIndex;
  int _selectedId;
  String _selectedTabName;
  Dish _chosenDish;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  int get selectedId => _selectedId;

  set selectedId(int id) {
    _selectedId = id;
    notifyListeners();
  }

  Dish get chosenDish => _chosenDish;

  set chosenDish(Dish d) {
    _chosenDish = d;
    notifyListeners();
  }

  String get selectedTabName => _selectedTabName;

  set selectedTabName(String name) {
    _selectedTabName = name;
    notifyListeners();
  }

  void onTabSelected(int index) {
    _selectedIndex = index;
    _selectedTabName = tabsName[index];
    notifyListeners();
  }

  void onGetStartTap() {
    _selectedIndex = 0;
    notifyListeners();
  }
}
