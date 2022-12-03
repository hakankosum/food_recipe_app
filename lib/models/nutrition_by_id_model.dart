class NutritionByIdModel {
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  String? errorMessage;
  
  
  int? expires;
  bool? isStale;

  NutritionByIdModel(
      {this.calories,
      this.carbs,
      this.fat,
      this.errorMessage,

      
      this.expires,
      this.isStale});

  NutritionByIdModel.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    
    
    expires = json['expires'];
    isStale = json['isStale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    data['protein'] = this.protein;

    data['expires'] = this.expires;
    data['isStale'] = this.isStale;
    return data;
  }
}

