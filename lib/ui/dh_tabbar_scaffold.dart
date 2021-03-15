import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_circle_indicator.dart';
import 'package:flutter/material.dart';

class DHTabBarScaffold extends StatefulWidget {
  final String title;
  final List<String> tabsTitle;
  final List<Widget> tabsBody;

  DHTabBarScaffold(
      {@required this.title,
      @required this.tabsTitle,
      @required this.tabsBody});

  @override
  _DHTabBarScaffoldState createState() => _DHTabBarScaffoldState();
}

class _DHTabBarScaffoldState extends State<DHTabBarScaffold> {
  final List<Widget> tabs = [];
  final Map<String, GlobalKey> tabsKeys = {};
  double tabPadding = 0;

  @override
  void initState() {
    widget.tabsTitle.forEach((tab) => tabsKeys[tab] = GlobalKey());
    tabs.addAll(widget.tabsTitle.map((tab) => Container(
        key: tabsKeys[tab],
        child: Tab(
          text: tab,
        ))));
    WidgetsBinding.instance
        .addPostFrameCallback((Duration d) => calculateTabBarPadding);
    super.initState();
  }

  void calculateTabBarPadding() {
    setState(() {
      final screenWidth = MediaQuery.of(context).size.width;
      final tabBarWidth = tabsKeys.values
          .fold(0, (prev, tab) => prev + tab.currentContext.size.width);
      tabPadding = tabBarWidth < screenWidth
          ? ((screenWidth - tabBarWidth) / widget.tabsTitle.length) / 2
          : 16.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: widget.tabsTitle.length,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: defaultPadding,
                    left: defaultPadding,
                    right: defaultPadding * 2),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding * 1.5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 0.0, top: defaultPadding),
                      hintText: 'Search for recipe...',
                      hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                      enabled: false),
                ),
              ),
              TabBar(
                indicator: DHCircleIndicator(
                    color: Theme.of(context).primaryColor, radius: 3),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w700),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
                labelPadding: EdgeInsets.symmetric(horizontal: tabPadding),
                tabs: widget.tabsTitle
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
              Expanded(child: TabBarView(children: widget.tabsBody))
            ],
          ),
        ),
      ),
    );
  }
}
