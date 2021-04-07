import 'package:dapur_hangus_app/navigation/app_state.dart';
import 'package:dapur_hangus_app/navigation/recipe_route_path.dart';
import 'package:flutter/material.dart';

import '../screens/details_recipe_page.dart';
import '../screens/start_screen.dart';
import '../ui/dh_side_navigation_scaffold.dart';

class RecipeRouterDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  RecipeAppState appState = RecipeAppState();

  RecipeRouterDelegate() {
    appState.addListener(notifyListeners);
  }

  void onTapOnGetStarted() {
    appState.selectedIndex = 0;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (currentConfiguration is RecipeStartPath)
          MaterialPage(key: UniqueKey(), child: StartScreen(onTapOnGetStarted)),
        if (currentConfiguration is RecipeMainPath)
          MaterialPage(
              key: UniqueKey(), child: DHSideNavigationScaffold(appState)),
        if (currentConfiguration is RecipeDishPath)
          MaterialPage(
              key: UniqueKey(),
              child: DetailsRecipePage(dish: appState.chosenDish))
      ],
      onPopPage: (route, result) {
        if (appState.selectedIndex != null && appState.selectedId == null) {
          return false;
        }
        appState.selectedId = null;
        notifyListeners();
        return true;
      },
    );
  }

  RecipeRoutePath get currentConfiguration {
    if (appState.selectedId != null) {
      return RecipeDishPath(appState.selectedId);
    }
    if (appState.selectedIndex != null) {
      return RecipeMainPath(appState.selectedIndex);
    }
    return RecipeStartPath();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RecipeRoutePath path) async {
    if (path is RecipeStartPath) {
      appState.selectedId = null;
      appState.selectedIndex = null;
    }
    if (path is RecipeMainPath) {
      appState.selectedId = null;
      appState.selectedIndex = path.selectedIndex;
    }
    if (path is RecipeDishPath) {
      appState.selectedId = path.id;
    }
  }
}
