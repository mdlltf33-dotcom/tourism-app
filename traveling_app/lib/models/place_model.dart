class PlaceModel {
  final String id;
  final String name;
  final String description;
  final List<String> images; // ← يدعم أكثر من صورة
  final String location;
  final double rating;

  PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.location,
    required this.rating,
  });
}
