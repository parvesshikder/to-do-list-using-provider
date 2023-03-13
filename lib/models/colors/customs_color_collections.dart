import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:to_do_list/models/colors/custom_colors.dart';

class CustomeColorCollections{
  final List<CustomColors> _colorCollections = [
    CustomColors(id: 'blue_accent', color: Colors.blueAccent),
    CustomColors(id: 'green', color: Colors.green),
    CustomColors(id: 'red_accent', color: Colors.redAccent),
    CustomColors(id: 'yellow_accent', color: Colors.yellow),
    CustomColors(id: 'brown', color: Colors.brown),
    CustomColors(id: 'orange_accent', color: Colors.orangeAccent),

  ];

  UnmodifiableListView<CustomColors> get colorCollections => UnmodifiableListView(_colorCollections);

  CustomColors findColorById(colorId){
    return _colorCollections.firstWhere((customColor) => customColor.id == colorId);
  }
}