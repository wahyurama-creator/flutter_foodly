import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String id;
  final String title;
  final String time;
  final String imageUrl;
  final List<dynamic> foods;
  final bool pickup;
  final bool delivery;
  final String owner;
  final bool isAvailable;
  final String code;
  final String logoUrl;
  final double rating;
  final int ratingCount;
  final String verification;
  final String verificationMessage;
  final Coords coords;

  const RestaurantModel({
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.foods,
    required this.pickup,
    required this.delivery,
    required this.owner,
    required this.isAvailable,
    required this.code,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.verificationMessage,
    required this.coords,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['_id'],
      title: json['title'],
      time: json['time'],
      imageUrl: json['imageUrl'],
      foods: List<dynamic>.from(
        json['foods'].map((x) => x),
      ),
      pickup: json['pickup'],
      delivery: json['delivery'],
      owner: json['owner'],
      isAvailable: json['isAvailable'],
      code: json['code'],
      logoUrl: json['logoUrl'],
      rating: json['rating']?.toDouble() ?? 0.0,
      ratingCount: json['ratingCount'],
      verification: json['verification'],
      verificationMessage: json['verificationMessage'],
      coords: Coords.fromJson(json['coords']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'time': time,
      'imageUrl': imageUrl,
      'foods': foods,
      'pickup': pickup,
      'delivery': delivery,
      'owner': owner,
      'isAvailable': isAvailable,
      'code': code,
      'logoUrl': logoUrl,
      'rating': rating,
      'ratingCount': ratingCount,
      'verification': verification,
      'verificationMessage': verificationMessage,
      'coords': coords.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        time,
        imageUrl,
        foods,
        pickup,
        delivery,
        owner,
        isAvailable,
        code,
        logoUrl,
        rating,
        ratingCount,
        verification,
        verificationMessage,
        coords,
      ];
}

class Coords extends Equatable {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  const Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) {
    return Coords(
      id: json['id'],
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      address: json['address'],
      title: json['title'],
      latitudeDelta: json['latitudeDelta']?.toDouble() ?? 0.0,
      longitudeDelta: json['longitudeDelta']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'title': title,
      'latitudeDelta': latitudeDelta,
      'longitudeDelta': longitudeDelta,
    };
  }

  @override
  List<Object?> get props => [
        id,
        latitude,
        longitude,
        address,
        title,
        latitudeDelta,
        longitudeDelta,
      ];
}
