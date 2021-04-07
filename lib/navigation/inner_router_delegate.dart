import 'package:dapur_hangus_app/models/Dish.dart';
import 'package:dapur_hangus_app/navigation/app_state.dart';
import 'package:dapur_hangus_app/navigation/recipe_route_path.dart';
import 'package:flutter/material.dart';

import '../screens/desserts_recipe_page.dart';
import '../screens/drink_recipe_page.dart';
import '../screens/main_recipe_page.dart';
import '../screens/soup_recipe_page.dart';
import '../screens/vege_recipe_page.dart';

class InnerRouterDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  RecipeAppState _appState;

  InnerRouterDelegate(this._appState);

  RecipeAppState get appState => _appState;

  set appState(RecipeAppState value) {
    if (value == appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.selectedIndex == 0)
          MaterialPage(
              key: ValueKey(appState.selectedTabName),
              child: MainRecipePage(handleRecipeTap)),
        if (appState.selectedIndex == 1)
          MaterialPage(
              key: ValueKey(appState.selectedTabName),
              child: VegeRecipePage(handleRecipeTap)),
        if (appState.selectedIndex == 2)
          MaterialPage(
              key: ValueKey(appState.selectedTabName),
              child: SoupRecipePage(handleRecipeTap)),
        if (appState.selectedIndex == 3)
          MaterialPage(
              key: ValueKey(appState.selectedTabName),
              child: DessertRecipePage(handleRecipeTap)),
        if (appState.selectedIndex == 4)
          MaterialPage(
              key: ValueKey(appState.selectedTabName),
              child: DrinkRecipePage(handleRecipeTap)),
      ],
      onPopPage: (route, result) {
        return false;
      },
    );
  }

  void handleRecipeTap(Dish dish) {
    appState.selectedId = dish.id;
    appState.chosenDish = dish;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(configuration) async {
    assert(false);
  }
}
