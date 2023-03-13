// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomColors {
  String id;
  Color color;
  bool isSelected;
  CustomColors({
    required this.id,
    required this.color,
    this.isSelected = false,
  });
}
