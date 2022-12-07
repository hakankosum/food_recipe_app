import 'package:flutter/material.dart';
import 'package:food_app/models/instructions_model.dart';
import 'package:food_app/services/instructions_service.dart';

class InstructionsProvider extends ChangeNotifier {
  final InstructionsService _service = InstructionsService();
  InstructionsModel data = InstructionsModel();

  bool isLoaded = false;
  bool showInstructions = false;

  GetInstructions(String id) async {
    isLoaded = false;
    data = await _service.GetInstructions(id);

    isLoaded = true;

    notifyListeners();
  }

  changeVisibility() {
    if (showInstructions == false) {
      showInstructions = true;
    } else if (showInstructions == true) {
      showInstructions = false;
    }

    print(showInstructions);
    notifyListeners();
  }
}
