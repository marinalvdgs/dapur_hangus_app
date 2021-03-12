import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class MainReceiptPage extends StatefulWidget {
  @override
  _MainReceiptPageState createState() => _MainReceiptPageState();
}

class _MainReceiptPageState extends State<MainReceiptPage> {
  List<String> tabsTitle = ['Malay', 'Chinese', 'Indian', 'Others'];
  List<Widget> tabsBody = List.filled(
      4,
      ListView(
        children: List.filled(4, DHDishCard()),
      ));

  @override
  Widget build(BuildContext context) {
    return DHTabBarScaffold(
      title: 'Want To Try New Recipe Today ?',
      tabsTitle: tabsTitle,
      tabsBody: tabsBody,
    );
  }
}
