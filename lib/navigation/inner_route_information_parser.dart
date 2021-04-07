import 'package:dapur_hangus_app/navigation/recipe_route_information_parser.dart';
import 'package:dapur_hangus_app/navigation/recipe_route_path.dart';
import 'package:flutter/material.dart';

class InnerRouteInformationParser
    extends RouteInformationParser<RecipeMainPath> {
  @override
  Future<RecipeMainPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    debugPrint(uri.path);
    if (uri.pathSegments.length == 2) {
      switch (uri.pathSegments[1]) {
        case 'main_course':
          return RecipeMainCoursePath(0);
        case 'vege':
          return RecipeVegePath(1);
        case 'soup':
          return RecipeSoupPath(2);
        case 'desserts':
          return RecipeDessertsPath(3);
        case 'drinks':
          return RecipeDrinksPath(4);
      }
    }
    throw Exception('invalid inner uri');
  }

  @override
  RouteInformation restoreRouteInformation(RecipeMainPath configuration) {
    return RouteInformation(
        location: '/main/${tabsName[configuration.selectedIndex]}');
  }
}
