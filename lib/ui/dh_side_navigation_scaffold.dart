import 'package:dapur_hangus_app/screens/desserts_receipt_page.dart';
import 'package:dapur_hangus_app/screens/drink_receipt_page.dart';
import 'package:dapur_hangus_app/screens/main_receipt_page.dart';
import 'package:dapur_hangus_app/screens/soup_receipt_page.dart';
import 'package:dapur_hangus_app/screens/vege_receipt_page.dart';
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
        return MainReceiptPage();
      case 1:
        return VegeReceiptPage();
      case 2:
        return SoupReceiptPage();
      case 3:
        return DessertReceiptPage();
      case 4:
        return DrinkReceiptPage();
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
