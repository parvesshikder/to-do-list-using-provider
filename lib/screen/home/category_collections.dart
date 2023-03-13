import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/common/category_icon.dart';
import 'package:to_do_list/models/category.dart';

class CategoryCollections{
  final List<Category> _categories = [
    Category(
      id: 'today',
      name: 'Today',
      categoryIcon: const CategoryIcon( 
        bgColor: CupertinoColors.systemBlue,
        iconData: CupertinoIcons.calendar_today,
      ),
    ),
    Category(
      id: 'scheduled',
      name: 'Scheduled',
      categoryIcon: const CategoryIcon( 
        bgColor: CupertinoColors.systemRed,
        iconData: CupertinoIcons.calendar,
      ),
    ),
    Category(
      id: 'all',
      name: 'All',
      categoryIcon: const CategoryIcon( 
        bgColor: CupertinoColors.systemGrey,
        iconData: Icons.inbox_rounded,
      ),
    ),
    Category(
      id: 'flag',
      name: 'Flag',
      categoryIcon: const CategoryIcon( 
        bgColor: CupertinoColors.systemOrange,
        iconData: CupertinoIcons.flag_fill,
      ),
    ),
  ];

  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);

  Category removeItem(int oldIndex){
    return _categories.removeAt(oldIndex);
  }

  void insertItem(int newIndex, Category item){
    _categories.insert(newIndex, item);
  }

  List<Category> get selectedCategories =>
     _categories.where((e) => e.isChecked ).toList();
  

}