import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:to_do_list/models/icons/icons.dart';

class IconCollections {
  final List<ShowIcons> _iconCollections = [
    ShowIcons(id: 'home', icon: Icons.home),
    ShowIcons(id: 'place_outlined', icon: Icons.place_outlined),
    ShowIcons(id: 'draw_outlined', icon: Icons.draw_outlined),
    ShowIcons(id: 'book_online_outlined', icon: Icons.book_online_outlined),
    ShowIcons(id: 'tab_outlined', icon: Icons.tab_outlined),
    ShowIcons(id: 'hub_outlined', icon: Icons.hub_outlined),
  ];

  UnmodifiableListView<ShowIcons> get iconCollections =>
      UnmodifiableListView(_iconCollections);

  ShowIcons getIconbyID(iconId) {
    return _iconCollections.firstWhere((icon) => icon.id == iconId);
  }
}
