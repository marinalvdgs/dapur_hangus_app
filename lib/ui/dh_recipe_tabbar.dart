import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DHRecipeTabBar extends StatefulWidget {
  final List<String> tabsTitle;
  final List<Widget> tabsBody;
  final double sidePadding;

  DHRecipeTabBar(
      {@required this.tabsTitle,
      @required this.tabsBody,
      this.sidePadding = defaultPadding * 2.5});

  @override
  _DHRecipeTabBarState createState() => _DHRecipeTabBarState();
}

class _DHRecipeTabBarState extends State<DHRecipeTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  int lastIndex;

  final List<Widget> tabs = [];
  final Map<String, GlobalKey> tabsKeys = {};
  double tabPadding = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabsTitle.length, vsync: this);
    _tabController.addListener(changeIndex);
    lastIndex = widget.tabsTitle.length - 1;
    widget.tabsTitle.forEach((tab) => tabsKeys[tab] = GlobalKey());
    tabs.addAll(widget.tabsTitle
        .map((tab) => Container(key: tabsKeys[tab], child: Text(tab))));
    WidgetsBinding.instance
        .addPostFrameCallback((_) => calculateTabBarPadding());
    super.initState();
  }

  void calculateTabBarPadding() {
    setState(() {
      final screenWidth =
          MediaQuery.of(context).size.width - widget.sidePadding * 2;
      final tabBarWidth = tabsKeys.values
          .fold(0, (prev, tab) => prev + tab.currentContext.size.width);
      tabPadding = tabBarWidth < screenWidth
          ? ((screenWidth - tabBarWidth) / widget.tabsTitle.length) / 2
          : 16.0;
      int i;
      tabs.forEach((tab) {
        i = tabs.indexOf(tab);
        tabs[i] = Padding(
          padding: getPadding(i),
          child: tab,
        );
      });
    });
  }

  void changeIndex() {
    if (_tabController.indexIsChanging &&
        _tabController.index != currentIndex) {
      setState(() {
        currentIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(changeIndex);
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

  EdgeInsets getPadding(int i) {
    if (i == 0) {
      return EdgeInsets.only(left: widget.sidePadding, right: tabPadding * 2);
    }
    if (i == lastIndex) {
      return EdgeInsets.only(left: tabPadding * 2, right: widget.sidePadding);
    }
    return EdgeInsets.symmetric(horizontal: tabPadding);
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
                isScrollable: true,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Color(0xFF476385),
                labelStyle: Theme.of(context).textTheme.headline4,
                labelPadding: EdgeInsets.zero,
                tabs: tabs,
              ),
            ),
            // tab bar view here
            IndexedStack(
              index: currentIndex,
              children: widget.tabsBody
                  .map((e) => Align(
                        alignment: Alignment.topLeft,
                        child: Visibility(
                          child: e,
                          visible: currentIndex == widget.tabsBody.indexOf(e),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
