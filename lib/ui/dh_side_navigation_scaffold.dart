import 'package:dapur_hangus_app/screens/desserts_recipe_page.dart';
import 'package:dapur_hangus_app/screens/drink_recipe_page.dart';
import 'package:dapur_hangus_app/screens/main_recipe_page.dart';
import 'package:dapur_hangus_app/screens/soup_recipe_page.dart';
import 'package:dapur_hangus_app/screens/vege_recipe_page.dart';
import 'package:dapur_hangus_app/ui/dh_side_navigation_bar.dart';
import 'package:flutter/material.dart';

class DHSideNavigationScaffold extends StatefulWidget {
  @override
  _DHSideNavigationScaffoldState createState() =>
      _DHSideNavigationScaffoldState();
}

const List<String> _titleList = [
  'Main Course',
  'Vege',
  'Soup',
  'Desserts',
  'Drinks'
];

class _DHSideNavigationScaffoldState extends State<DHSideNavigationScaffold> {
  int currentPage = 0;

  Widget buildBody(int index) {
    switch (index) {
      case 0:
        return MainRecipePage();
      case 1:
        return VegeRecipePage();
      case 2:
        return SoupRecipePage();
      case 3:
        return DessertRecipePage();
      case 4:
        return DrinkRecipePage();
    }
    throw Exception('Invalid page');
  }

  void onItemTap(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DHSideNavigationBar(
            items: _titleList,
            onSelected: onItemTap,
            currentIndex: currentPage,
          ),
          Expanded(child: buildBody(currentPage))
        ],
      ),
    );
  }
}
