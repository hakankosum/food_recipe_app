import 'package:dio/dio.dart';
import 'package:food_app/services/key.dart';

import '../models/instructions_model.dart';

class InstructionsService {
  Dio dio = Dio();
  InstructionsModel? data;

  String url = "https://api.spoonacular.com/recipes/";
  Map<String, String> headers = {
    "x-api-key": apiKey,
    "Content-Type": "application/json"
  };

  Future<InstructionsModel> GetInstructions(String id) async {
    InstructionsModel data = InstructionsModel();

    try {

      Response res = await dio.get("$url$id/analyzedInstructions",
          options: Options(headers: headers));




      
      data = InstructionsModel.fromJson(res.data[0]);
      
    

      return data;
    } catch (e) {

      if (e is DioError) {
        data.errorMessage = e.message;

        return data;
      } else {
        data.errorMessage = "Unknown error";

        return data;
      }
    }
  }
}
