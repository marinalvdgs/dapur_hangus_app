import 'package:dapur_hangus_app/ui/dh_navigation_button.dart';
import 'package:flutter/material.dart';

class DHSideNavigationBar extends StatefulWidget {
  final List<String> items;
  final Function(int) onSelected;
  final int currentIndex;

  DHSideNavigationBar(
      {@required this.items,
      @required this.onSelected,
      @required this.currentIndex});

  @override
  _DHSideNavigationBarState createState() => _DHSideNavigationBarState();
}

class _DHSideNavigationBarState extends State<DHSideNavigationBar> {
  void onItemTap(int index) {
    widget.onSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: 90,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: widget.items
            .map((e) => DHNavigationButton(
                  title: e,
                  isSelected: widget.currentIndex == widget.items.indexOf(e),
                  onTap: () => onItemTap(widget.items.indexOf(e)),
                ))
            .toList(),
      ),
    );
  }
}
