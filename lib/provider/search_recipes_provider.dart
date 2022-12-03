// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app/models/ingredient_by_id_mode.dart';
import 'package:food_app/models/nutrition_by_id_model.dart';
import 'package:food_app/models/search_recipes_model.dart';
import 'package:food_app/services/nutrition_by_id_service.dart';
import 'package:food_app/services/search_recipes_service.dart';

import '../services/ingredient_by_id_service.dart';

class SearchRecipesProvider extends ChangeNotifier {
  final SearchRecipeService _service = SearchRecipeService();
  final NutritionByIdService _nutritionService = NutritionByIdService();
  final IngredientByIdService _ingredientService = IngredientByIdService();
  SearchRecipesModel data = SearchRecipesModel();
  List<NutritionByIdModel> nutritionData=[];
  List<IngredientsByIdModel> ingredientData=[];
  bool loaded = false;
  GetSearchRecipes(String userInput) async {
    loaded=false;
    data = await _service.GetSearchRecipe(userInput);
    for (var i = 0; i < data.results!.length; i++) {
      nutritionData.add(await _nutritionService.GetNutritionById(data.results![i].id.toString())) ;
      ingredientData.add(await _ingredientService.GetIngredientById(data.results![i].id.toString()));
      
      
    }
    print(nutritionData);
    

    loaded = true;

    notifyListeners();
  }
}
