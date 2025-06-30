import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:greate_places/models/place.dart';
import 'package:uuid/uuid.dart';

class GreatePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, io.File image) {
    var uuid = Uuid();

    final newPlace = Place(
      id: uuid.v4(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlace);

    notifyListeners();
  }
}
