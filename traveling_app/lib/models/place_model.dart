class PlaceModel {
  final String id;
  final String name;
  final String description;
  final List<String> images;
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

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['_id'] ?? json['id'], // MongoDB يعيد _id
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      location: json['location'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}
