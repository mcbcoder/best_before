import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:best_before/recipePages/random10recipeList.dart';
import 'package:best_before/recipePages/tobeusedRecipes.dart';
import 'package:best_before/recipePages/lowCalorieRecipes.dart';
import 'package:best_before/recipePages/vegetarianRecipes.dart';
import 'package:best_before/recipePages/veganRecipes.dart';
import 'package:best_before/recipePages/pescetarianRecipes.dart';
import 'package:best_before/recipePages/glutenfreeRecipes.dart';
import 'package:best_before/recipePages/breakfastRecipes.dart';
import 'package:best_before/recipePages/lunchRecipes.dart';
import 'package:best_before/recipePages/dessertRecipes.dart';


import 'package:best_before/navBarTest/menu_item.dart';
import 'package:best_before/navBarTest/menu_page.dart';



class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  MenuItem currentItem = MenuItems.allRecipes;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.Style1,
        borderRadius: 40,
        angle: -10,
        //slideWidth: MediaQuery.of(context).size.width * 0.8,
        showShadow: true,
        backgroundColor: Colors.teal,
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);

              ZoomDrawer.of(context)!.close();
            },
          ),
        ),
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.allRecipes:
        return random10recipelist();
      case MenuItems.touseup:
        return tobeusedRecipe();
      case MenuItems.lowCal:
        return lowCalorieRecipes();
      case MenuItems.veg:
        return vegRecipes();
      case MenuItems.vegan:
        return veganRecipes();
      case MenuItems.pescetarian:
        return pescetarianRecipes();
      case MenuItems.glutenFree:
        return glutenfreeRecipes();
      case MenuItems.breakfast:
        return breakfastRecipes();
      case MenuItems.lunch:
        return lunchRecipes();
      case MenuItems.dessert:
      default:
        return dessertRecipes();
    }
  }
}