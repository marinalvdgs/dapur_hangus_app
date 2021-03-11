import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_dish_card.dart';
import 'package:flutter/material.dart';

class ReceiptBookPage extends StatefulWidget {
  @override
  _ReceiptBookPageState createState() => _ReceiptBookPageState();
}

class _ReceiptBookPageState extends State<ReceiptBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding*2),
          children: [
            DHDishCard(),
            DHDishCard(),
            DHDishCard(),
          ],
        ),
      ),
    );
  }
}
