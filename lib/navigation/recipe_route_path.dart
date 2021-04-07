import 'package:flutter/material.dart';

class RecipeRoutePath {}

class RecipeStartPath extends RecipeRoutePath {}

class RecipeMainPath extends RecipeRoutePath {
  final int selectedIndex;

  RecipeMainPath(this.selectedIndex);
}

class RecipeDishPath extends RecipeRoutePath {
  final int id;

  RecipeDishPath(this.id);
}

class RecipeMainCoursePath extends RecipeMainPath {
  RecipeMainCoursePath(int selectedIndex) : super(selectedIndex);
}

class RecipeVegePath extends RecipeMainPath {
  RecipeVegePath(int selectedIndex) : super(selectedIndex);
}

class RecipeSoupPath extends RecipeMainPath {
  RecipeSoupPath(int selectedIndex) : super(selectedIndex);
}

class RecipeDessertsPath extends RecipeMainPath {
  RecipeDessertsPath(int selectedIndex) : super(selectedIndex);
}

class RecipeDrinksPath extends RecipeMainPath {
  RecipeDrinksPath(int selectedIndex) : super(selectedIndex);
}
