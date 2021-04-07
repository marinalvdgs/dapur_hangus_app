import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class DessertRecipePage extends StatefulWidget {
  final Function onRecipeTap;

  DessertRecipePage(this.onRecipeTap);

  @override
  _DessertRecipePageState createState() => _DessertRecipePageState();
}

class _DessertRecipePageState extends State<DessertRecipePage> {
  String title = 'Want To Try New Dessert Today ?';
  List<String> tabsTitle = ['Asian', 'European', 'American', 'Others'];
  List<Widget> tabsBody = [];

  @override
  void initState() {
    tabsBody = List.filled(
        4,
        ListView(
          children: [
            DHDishCard(
                dish: Dish(id: 13, image: dishes[3], title: titles[3]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 14, image: dishes[4], title: titles[4]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 15, image: dishes[3], title: titles[3]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 16, image: dishes[4], title: titles[4]),
                onTap: widget.onRecipeTap),
          ],
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DHTabBarScaffold(
      title: title,
      tabsTitle: tabsTitle,
      tabsBody: tabsBody,
    );
  }
}
