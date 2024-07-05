import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String id;
  final String title;
  final String value;
  final String imageUrl;

  const CategoriesModel({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'value': value,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [id, title, value, imageUrl];
}