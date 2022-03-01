import 'dart:ffi';

import 'package:best_before/models/recipe.api.dart';
import 'package:best_before/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:best_before/models/recipe.dart';
import 'package:best_before/models/recipe.api.dart';


class RecipePage extends StatefulWidget {
  @override
  State<RecipePage> createState()=> _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  List<Recipe> _recipes;
  bool _isLoading=true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
    _isLoading = false;
   });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: _isLoading ?   Center(child: CircularProgressIndicator())
       :ListView.builder(
         //itemCount: _recipes.length,
         itemBuilder: (context,index){
         return RecipeCard(
            title: _recipes[index].name,
            cookTime: _recipes[index].readyInMinutes,
            id: _recipes[index].id,
            thumbnailUrl:_recipes[index].images);
            })
          );

      }
}