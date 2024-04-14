import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;
  final String category;
  final String time;

  const FoodModel({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
    required this.category,
    required this.time,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['_id'],
      title: json['title'],
      foodTags: List<String>.from(
        json['foodTags'].map((x) => x),
      ),
      foodType: List<String>.from(
        json['foodType'].map((x) => x),
      ),
      code: json['code'],
      isAvailable: json['isAvailable'],
      restaurant: json['restaurant'],
      rating: json['rating']?.toDouble() ?? 0.0,
      ratingCount: json['ratingCount'],
      description: json['description'],
      price: json['price']?.toDouble() ?? 0.0,
      additives: List<Additive>.from(
        json['additives'].map(
          (x) => Additive.fromJson(x),
        ),
      ),
      imageUrl: List<String>.from(
        json['imageUrl'].map((x) => x),
      ),
      category: json['category'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'foodTags': foodTags.map((x) => x).toList(),
      'foodType': foodType.map((x) => x).toList(),
      'code': code,
      'isAvailable': isAvailable,
      'restaurant': restaurant,
      'rating': rating,
      'ratingCount': ratingCount,
      'description': description,
      'price': price,
      'additives': additives.map((x) => x.toJson()).toList(),
      'imageUrl': imageUrl.map((x) => x).toList(),
      'category': category,
      'time': time,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        foodTags,
        foodType,
        code,
        isAvailable,
        restaurant,
        rating,
        ratingCount,
        description,
        price,
        additives,
        imageUrl,
        category,
        time,
      ];
}

class Additive extends Equatable {
  final String id;
  final String title;
  final double price;

  const Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
      id: json['id'],
      title: json['title'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [id, title, price];
}
