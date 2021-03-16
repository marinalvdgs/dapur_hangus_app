import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class SoupRecipePage extends StatefulWidget {
  @override
  _SoupRecipePageState createState() => _SoupRecipePageState();
}

class _SoupRecipePageState extends State<SoupRecipePage> {
  String title = 'Want To Try New Recipe Today ?';
  List<String> tabsTitle = ['Malay', 'Chinese', 'Indian', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: [
          DHDishCard(image: dishes[2], title: titles[2],),
          DHDishCard(image: dishes[3], title: titles[3],),
          DHDishCard(image: dishes[2], title: titles[2],),
          DHDishCard(image: dishes[3], title: titles[3],),
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
