import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class DrinkRecipePage extends StatefulWidget {
  @override
  _DrinkRecipePageState createState() => _DrinkRecipePageState();
}

class _DrinkRecipePageState extends State<DrinkRecipePage> {
  String title = 'Want To Try New Drink Today ?';
  List<String> tabsTitle = ['Tea', 'Coffee', 'Alcohol', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: [
          DHDishCard(dish: Dish(id: 17, image: dishes[4], title: titles[4])),
          DHDishCard(dish: Dish(id: 18, image: dishes[5], title: titles[5])),
          DHDishCard(dish: Dish(id: 19, image: dishes[4], title: titles[4])),
          DHDishCard(dish: Dish(id: 20, image: dishes[5], title: titles[5])),
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
