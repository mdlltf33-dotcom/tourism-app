import 'place_model.dart';

class RestaurantModel extends PlaceModel {
  final String cuisineType;
  final String? phoneNumber; // ← حقل اختياري

  RestaurantModel({
    required super.id,
    required super.name,
    required super.description,
    required super.images,
    required super.location,
    required super.rating,
    required this.cuisineType,
    required this.phoneNumber, // ← بدون required
  });
}
