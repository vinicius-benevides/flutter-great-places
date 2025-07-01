import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;

  const PlaceLocation({required this.latitude, required this.longitude});

  String get address =>
      'Latitude: ${latitude.toStringAsFixed(2)}, Longitude: ${longitude.toStringAsFixed(2)}';
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  const Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
