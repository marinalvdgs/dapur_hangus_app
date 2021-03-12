import 'package:dapur_hangus_app/ui/dh_tabbar_scaffold.dart';
import 'package:flutter/material.dart';

class MainReceiptPage extends StatefulWidget {
  @override
  _MainReceiptPageState createState() => _MainReceiptPageState();
}

class _MainReceiptPageState extends State<MainReceiptPage> {
  List<String> tabsTitle = ['Malay', 'Chinese', 'Indian', 'Others'];

  @override
  Widget build(BuildContext context) {
    return DHTabBarScaffold(
      title: 'Want To Try New Recipe Today ?',
      tabsTitle: tabsTitle,
    );
  }
}
