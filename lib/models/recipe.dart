import 'dart:convert';
import 'package:flutter/material.dart';


class Recipe{
  final String name;
  final String images;
  final String id;
  final String readyInMinutes;
    Recipe({
    @required this.name,
    @required this.images,
    @required this.id,
    @required this.readyInMinutes,
  });

  //Recipe({this.name, this.id, this.totalTime});

  factory Recipe.fromJson(dynamic json){
    return Recipe(
      name: json['title'] ?? '',
       id: json['id'].toString(),
      images: 
      "https://spoonacular.com/recipeImages/${json['id']}-556x370.${json['imageType']}",
      readyInMinutes: json['readyInMinutes'].toString(),
    );
  }
}

class RecipeList {
  final List<Recipe> list;
    RecipeList ({
      @required this.list,
    });
  
  factory RecipeList.fromJson (List<dynamic> json) {
    return RecipeList(
      list: json.map((data) => Recipe.fromJson(data)).toList(),
    );
  }

   static List<Recipe> recipesFromSnapshot(List snapshot){
     return snapshot.map(
     (data){
         return Recipe.fromJson(data);
       }).toList();
   }
}
//   @override
//     String toString(){
//       return 'Recipe {name :$name, images :$images, id :$id, readyInMinutes :$readyInMinutes}';
//     }
// }
