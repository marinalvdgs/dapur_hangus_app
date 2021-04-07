import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class VegeRecipePage extends StatefulWidget {
  final Function onRecipeTap;

  VegeRecipePage(this.onRecipeTap);

  @override
  _VegeRecipePageState createState() => _VegeRecipePageState();
}

class _VegeRecipePageState extends State<VegeRecipePage> {
  String title = 'Want To Try Vege Recipe Today ?';
  List<String> tabsTitle = ['Thai', 'Indian', 'Japanese', 'Others'];
  List<Widget> tabsBody = [];

  @override
  void initState() {
    tabsBody = List.filled(
        4,
        ListView(
          children: [
            DHDishCard(
                dish: Dish(id: 5, image: dishes[1], title: titles[1]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 6, image: dishes[2], title: titles[2]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 7, image: dishes[1], title: titles[1]),
                onTap: widget.onRecipeTap),
            DHDishCard(
                dish: Dish(id: 8, image: dishes[2], title: titles[2]),
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
