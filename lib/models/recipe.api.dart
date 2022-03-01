import 'dart:convert';
import 'package:best_before/models/recipe.dart';
import 'package:http/http.dart' as http;


class RecipeApi{

static Future<List<Recipe>> getRecipe() async{
    var uri = Uri.https('spoonacular-recipe-food-nutrition-v1.p.rapidapi.com', '/recipes/search',
        {'query': 'burger','diet': 'vegetarian','excludeIngredients': 'coconut','intolerances': 'egg, gluten','number': '10','offset': '0','type': 'main course'});

    final response = await http.get(uri,headers:{'x-rapidapi-host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
        'x-rapidapi-key': '99ecae3413msh40cf9900b9f0e7bp19e433jsn9e4240e236aa'
         });

Map data = jsonDecode(response.body);
List temp = [];

    for (var i in data['results']){
      temp.add(i['0']);
    }

   // return Recipe.recipesFromSnapshot(temp);
}

}