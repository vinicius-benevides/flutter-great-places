import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';
import 'package:uuid/uuid.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');

    _items.clear();

    for (var item in dataList) {
      _items.add(
        Place(
          id: item['id'] as String,
          title: item['title'] as String,
          image: io.File(item['image'] as String),
          location: PlaceLocation(
            latitude: item['latitude'] as double,
            longitude: item['longitude'] as double,
          ),
        ),
      );
    }

    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, io.File image, PlaceLocation location) {
    var uuid = Uuid();

    final newPlace = Place(
      id: uuid.v4(),
      title: title,
      location: location,
      image: image,
    );

    _items.add(newPlace);
    notifyListeners();

    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': newPlace.location.latitude,
      'longitude': newPlace.location.longitude,
    });
  }

  void removePlace(String id) {
    var index = _items.indexWhere((item) => item.id == id);

    if (index == -1) return;

    _items.removeAt(index);
    notifyListeners();

    DbUtil.delete('places', id);
  }
}
