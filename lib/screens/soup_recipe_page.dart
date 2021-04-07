import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class SoupRecipePage extends StatefulWidget {
  @override
  _SoupRecipePageState createState() => _SoupRecipePageState();
}

class _SoupRecipePageState extends State<SoupRecipePage> {
  String title = 'Want To Try New Soup Today ?';
  List<String> tabsTitle = ['Cream', 'Chinese', 'Malay', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: [
          DHDishCard(dish: Dish(id: 9, image: dishes[2], title: titles[2])),
          DHDishCard(dish: Dish(id: 10, image: dishes[3], title: titles[3])),
          DHDishCard(dish: Dish(id: 11, image: dishes[2], title: titles[2])),
          DHDishCard(dish: Dish(id: 12, image: dishes[3], title: titles[3])),
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
