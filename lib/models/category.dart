// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:to_do_list/common/category_icon.dart';

class Category {
  String id;
  String name;
  bool isChecked;
  CategoryIcon categoryIcon;

  Category({
    required this.id,
    required this.name,
     this.isChecked = true,
     required this.categoryIcon,
  });

  void toggleCheckbox(){
    isChecked = !isChecked;
  }
}
