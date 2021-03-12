import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_circle_indicator.dart';
import 'package:flutter/material.dart';

class DHTabBarScaffold extends StatefulWidget {
  final String title;
  final List<String> tabsTitle;

  DHTabBarScaffold({@required this.title, @required this.tabsTitle});

  @override
  _DHTabBarScaffoldState createState() => _DHTabBarScaffoldState();
}

class _DHTabBarScaffoldState extends State<DHTabBarScaffold> {
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
                      hintText: 'Search fo recipe...',
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
                tabs: widget.tabsTitle
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
