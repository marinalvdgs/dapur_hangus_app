import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class MainRecipePage extends StatefulWidget {
  @override
  _MainRecipePageState createState() => _MainRecipePageState();
}

class _MainRecipePageState extends State<MainRecipePage> {
  String title = 'Want To Try New Recipe Today ?';
  List<String> tabsTitle = ['Malay', 'Chinese', 'Indian', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: [
          DHDishCard(image: dishes[0]),
          DHDishCard(image: dishes[1]),
          DHDishCard(image: dishes[0]),
          DHDishCard(image: dishes[1]),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return DHTabBarScaffold(
      title: title,
      tabsTitle: tabsTitle,
      tabsBody: tabsBody,
    );
  }
}
