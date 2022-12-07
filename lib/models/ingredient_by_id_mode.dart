class IngredientsByIdModel {
  List<Ingredients>? ingredients;
  String? errorMessage;

  IngredientsByIdModel({this.ingredients,this.errorMessage});

  IngredientsByIdModel.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  String? image;
  Amount? amount;

  Ingredients({this.name, this.image, this.amount});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    amount =
        json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['image'] = image;
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    return data;
  }
}

class Amount {
  Metric? metric;
  Metric? us;

  Amount({this.metric, this.us});

  Amount.fromJson(Map<String, dynamic> json) {
    metric =
        json['metric'] != null ? new Metric.fromJson(json['metric']) : null;
    us = json['us'] != null ? new Metric.fromJson(json['us']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (metric != null) {
      data['metric'] = metric!.toJson();
    }
    if (us != null) {
      data['us'] = us!.toJson();
    }
    return data;
  }
}

class Metric {
  double? value;
  String? unit;

  Metric({this.value, this.unit});

  Metric.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}
