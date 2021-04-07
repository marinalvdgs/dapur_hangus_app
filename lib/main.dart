import 'package:dapur_hangus_app/navigation/recipe_route_information_parser.dart';
import 'package:dapur_hangus_app/navigation/recipe_router_delegate.dart';
import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RecipeRouteInformationParser _routeInformationParser =
      RecipeRouteInformationParser();
  RecipeRouterDelegate _routerDelegate = RecipeRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dapur Hangus',
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
