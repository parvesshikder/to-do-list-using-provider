// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowIcons {
  String id;
  IconData icon;
  bool isSeledted;
  ShowIcons({
    required this.id,
    required this.icon,
     this.isSeledted = false,
  });
}
