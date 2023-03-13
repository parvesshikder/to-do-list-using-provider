import 'package:flutter/material.dart';

class ToDoList {
  final String id;
  final String title;
  final Map icon;
  final int reminderCount;

  ToDoList(
      {required this.id, required this.title, required this.icon, required this.reminderCount,});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'reminder_count': reminderCount,
      };

  ToDoList.fromJson(Map<String, dynamic> jSon)
      : id = jSon['id'],
        title = jSon['title'],
        icon = jSon['icon'],
        reminderCount = jSon['reminder_count'];
}
