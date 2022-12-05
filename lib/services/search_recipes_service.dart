import 'package:dio/dio.dart';
import 'package:food_app/models/search_recipes_model.dart';
import 'package:food_app/services/key.dart';

class SearchRecipeService {
  Dio dio = Dio();
  SearchRecipesModel? data;
  String url = "https://api.spoonacular.com/recipes/complexSearch";
  Map<String, String> headers = {
    "x-api-key": apiKey
  };

  Future<SearchRecipesModel> GetSearchRecipe(String userInput) async {
    SearchRecipesModel data = SearchRecipesModel();
    

    try {
      Response res = await dio.get(url,
        queryParameters: {"query": userInput},
        options: Options(headers: headers));
        data =SearchRecipesModel.fromJson(res.data) ;


        return data;
      
    } catch (e) {
      if (e is DioError){
        data.errorMessage=e.message;
        
        return data;
        
      }
      else{
        data.errorMessage="Unknown error";
       
        return data;
      }
      
    }
  }
}
