import 'package:dio/dio.dart';
import 'package:food_app/models/nutrition_by_id_model.dart';

import 'package:food_app/services/key.dart';

import '../models/ingredient_by_id_mode.dart';

class IngredientByIdService {
  Dio dio = Dio();
  IngredientsByIdModel? data;
  
  String url = "https://api.spoonacular.com/recipes/";
  Map<String, String> headers = {
    "x-api-key": apiKey
  };

  Future<IngredientsByIdModel> GetIngredientById(String id) async {
    IngredientsByIdModel data = IngredientsByIdModel();
    

    try {
      Response res = await dio.get(url+"$id/ingredientWidget.json",
        
        options: Options(headers: headers));
        data =IngredientsByIdModel.fromJson(res.data) ;

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
