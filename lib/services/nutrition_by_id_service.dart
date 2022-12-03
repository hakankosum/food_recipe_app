import 'package:dio/dio.dart';
import 'package:food_app/models/nutrition_by_id_model.dart';

import 'package:food_app/services/key.dart';

class NutritionByIdService {
  Dio dio = Dio();
  NutritionByIdModel? data;
  
  String url = "https://api.spoonacular.com/recipes/";
  Map<String, String> headers = {
    "x-api-key": apiKey
  };

  Future<NutritionByIdModel> GetNutritionById(String id) async {
    NutritionByIdModel data = NutritionByIdModel();
    

    try {
      Response res = await dio.get(url+"$id/nutritionWidget.json",
        
        options: Options(headers: headers));
        data =NutritionByIdModel.fromJson(res.data) ;

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
