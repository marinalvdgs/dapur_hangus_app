import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class VegeRecipePage extends StatefulWidget {
  @override
  _VegeRecipePageState createState() => _VegeRecipePageState();
}

class _VegeRecipePageState extends State<VegeRecipePage> {
  String title = 'Want To Try New Recipe Today ?';
  List<String> tabsTitle = ['Malay', 'Chinese', 'Indian', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: List.filled(4, DHDishCard()),
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