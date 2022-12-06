class InstructionsModel {
  String? name;
  List<Steps>? steps;
  String? errorMessage;

  InstructionsModel({this.name, this.steps,this.errorMessage});

  InstructionsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? number;
  String? step;
  List<Ingredients>? ingredients;

  Length? length;

  Steps(
      {this.number, this.step, this.ingredients, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }

    length =
        json['length'] != null ? new Length.fromJson(json['length']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }

    if (this.length != null) {
      data['length'] = this.length!.toJson();
    }
    return data;
  }
}

class Ingredients {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Ingredients({this.id, this.name, this.localizedName, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localizedName'] = this.localizedName;
    data['image'] = this.image;
    return data;
  }
}

class Length {
  int? number;
  String? unit;

  Length({this.number, this.unit});

  Length.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unit'] = this.unit;
    return data;
  }
}
