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
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
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
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
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
    if (this.metric != null) {
      data['metric'] = this.metric!.toJson();
    }
    if (this.us != null) {
      data['us'] = this.us!.toJson();
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
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}
