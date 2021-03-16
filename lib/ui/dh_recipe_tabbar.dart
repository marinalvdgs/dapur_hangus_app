import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

class DHRecipeTabBar extends StatefulWidget {
  final List<String> tabsTitle;
  final List<Widget> tabsBody;

  DHRecipeTabBar({@required this.tabsTitle, @required this.tabsBody});

  @override
  _DHRecipeTabBarState createState() => _DHRecipeTabBarState();
}

class _DHRecipeTabBarState extends State<DHRecipeTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  int lastIndex;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabsTitle.length, vsync: this);
    _tabController.animation.addListener(changeIndex);
    lastIndex = widget.tabsTitle.length - 1;
    super.initState();
  }

  void changeIndex() {
    int value = _tabController.animation.value.round();
    if (value != currentIndex) {
      setState(() {
        currentIndex = value;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.animation.removeListener(changeIndex);
    _tabController.dispose();
  }

  BorderRadius getBorderRadius() {
    if (currentIndex == 0) {
      return BorderRadius.horizontal(right: defaultRadius);
    }
    if (currentIndex == lastIndex) {
      return BorderRadius.horizontal(left: defaultRadius);
    }
    return BorderRadius.all(defaultRadius);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: Column(
          children: [
            Container(
              height: 45,
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Color(0xFF476385),
                labelStyle: Theme.of(context).textTheme.headline4,
                tabs: widget.tabsTitle.map((e) => Text(e)).toList(),
              ),
            ),
            // tab bar view here
            IndexedStack(
              index: currentIndex,
              children: widget.tabsBody
                  .map((e) => Visibility(
                        child: e,
                        visible: currentIndex == widget.tabsBody.indexOf(e),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
