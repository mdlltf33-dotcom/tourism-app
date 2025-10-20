import 'place_model.dart';

class HotelModel extends PlaceModel {
  final double pricePerNight;
  final String? phoneNumber; // ← رقم الهاتف اختياري

  HotelModel({
    required super.id,
    required super.name,
    required super.description,
    required super.images,
    required super.location,
    required super.rating,
    required this.pricePerNight,
    required this.phoneNumber, // ← بدون required
  });
}
