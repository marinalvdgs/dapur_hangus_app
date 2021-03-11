import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_navigation_item.dart';
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
      width: 80,
      height: MediaQuery.of(context).size.height,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding * 3),
              child: Image.asset(
                'assets/setup-dots.png',
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 24,
              ),
            ),
            Expanded(child: Container()),
            ...widget.items
                .map((e) => DHNavigationItem(
                      title: e,
                      isSelected:
                          widget.currentIndex == widget.items.indexOf(e),
                      onTap: () => onItemTap(widget.items.indexOf(e)),
                    ))
                .toList(),
            SizedBox(
              height: 60,
            )
          ]),
    );
  }
}
