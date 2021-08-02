import 'dart:convert';

class HomeModel {
  final int? food;
  final double? weight;

  HomeModel({
    this.food,
    this.weight,
  });

  HomeModel copyWith({
    int? food,
    double? weight,
  }) {
    return HomeModel(
      food: food ?? this.food,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'food': food,
      'weight': weight,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      food: map['food'],
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) => HomeModel.fromMap(json.decode(source));

  @override
  String toString() => 'HomeModel(food: $food, weight: $weight)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeModel &&
      other.food == food &&
      other.weight == weight;
  }

  @override
  int get hashCode => food.hashCode ^ weight.hashCode;
}
