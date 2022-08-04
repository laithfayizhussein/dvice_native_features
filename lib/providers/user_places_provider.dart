import 'package:flutter/material.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class UserPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlaceToList(String titlePiker, File imagePicker) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: titlePiker,
        image: imagePicker,
        location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
