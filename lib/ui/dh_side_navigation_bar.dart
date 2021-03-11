import 'package:dapur_hangus_app/screens/receipt_book_page.dart';
import 'package:dapur_hangus_app/ui/dh_navigation_button.dart';
import 'package:flutter/material.dart';

const List<String> _titleList = [
  'Main Course',
  'Vege',
  'Soup',
  'Desserts',
  'Drinks'
];

class DHSideNavigationBar extends StatefulWidget {
  @override
  _DHSideNavigationBarState createState() => _DHSideNavigationBarState();
}

class _DHSideNavigationBarState extends State<DHSideNavigationBar> {
  int currentIndex = 0;

  void onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: _titleList
            .map((e) => DHNavigationButton(
                  title: e,
                  isSelected: currentIndex == _titleList.indexOf(e),
                  onTap: () => onItemTap(_titleList.indexOf(e)),
                ))
            .toList(),
      ),
    );
  }
}
