import 'package:flutter/material.dart';
import 'package:to_do_list/screen/home/category_collections.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
    required this.categoryCollections,
  }) : super(key: key);

  final CategoryCollections categoryCollections;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 16 / 9,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: categoryCollections.selectedCategories
      .map(
        (cat) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A181D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    cat.categoryIcon,
                    const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  ],
                ),
                Text(cat.name, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 21)),
                
              ],
            ),
          ),
        ),
      )
      .toList(),
          );
  }
}
