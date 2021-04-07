import 'package:dapur_hangus_app/navigation/app_state.dart';
import 'package:dapur_hangus_app/navigation/inner_router_delegate.dart';
import 'package:dapur_hangus_app/ui/dh_side_navigation_bar.dart';
import 'package:flutter/material.dart';

class DHSideNavigationScaffold extends StatefulWidget {
  final RecipeAppState appState;

  DHSideNavigationScaffold(this.appState);

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
  InnerRouterDelegate _routerDelegate;

  @override
  void initState() {
    _routerDelegate = InnerRouterDelegate(widget.appState);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DHSideNavigationScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate.appState = widget.appState;
  }

  void onItemTap(int index) {
    widget.appState.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DHSideNavigationBar(
            items: _titleList,
            onSelected: onItemTap,
            currentIndex: widget.appState.selectedIndex,
          ),
          Expanded(
              child: Router(
            routerDelegate: _routerDelegate,
          ))
        ],
      ),
    );
  }
}
