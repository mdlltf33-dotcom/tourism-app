import 'place_model.dart';

class TransportModel extends PlaceModel {
  final String type;
  final double fare;

  TransportModel({
    required super.id,
    required super.name,
    required super.description,
    required super.images,
    required super.location,
    required super.rating,
    required this.type,
    required this.fare,
  });

  factory TransportModel.fromJson(Map<String, dynamic> json) {
    return TransportModel(
      id: json['_id'] ?? json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      location: json['location'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      type: json['type'] ?? '',
      fare: (json['fare'] ?? 0).toDouble(),
    );
  }
}
