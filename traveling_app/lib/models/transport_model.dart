import 'place_model.dart';

class TransportModel extends PlaceModel {
  final String type; // مثلاً: سيارة أجرة - حافلة - مترو
  final double fare;

  TransportModel({
    required super.id,
    required super.name,
    required super.description,
    required super.images, // ← صورة واحدة داخل قائمة
    required super.location,
    required super.rating,
    required this.type,
    required this.fare,
  });
}
