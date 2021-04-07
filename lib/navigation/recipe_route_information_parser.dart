import 'package:dapur_hangus_app/navigation/recipe_route_path.dart';
import 'package:flutter/material.dart';

const List<String> tabsName = [
  'main_course',
  'vege',
  'soup',
  'desserts',
  'drinks'
];

class RecipeRouteInformationParser
    extends RouteInformationParser<RecipeRoutePath> {
  @override
  Future<RecipeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length == 0) {
      return RecipeStartPath();
    }

    if (uri.pathSegments.length == 2) {
      int id = int.tryParse(uri.pathSegments[1]);
      if (id == null) {
        return RecipeMainPath(tabsName.indexOf(uri.pathSegments[1]));
      }
      return RecipeDishPath(id);
    }

    throw Exception('invalid uri');
  }

  @override
  RouteInformation restoreRouteInformation(RecipeRoutePath path) {
    if (path is RecipeStartPath) {
      return RouteInformation(location: '/');
    }
    if (path is RecipeMainPath) {
      return RouteInformation(
          location: '/main/${tabsName[path.selectedIndex]}');
    }
    if (path is RecipeDishPath) {
      return RouteInformation(location: '/recipe/${path.id}');
    }
  }
}
