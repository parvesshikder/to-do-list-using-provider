import 'package:flutter/material.dart';
import 'package:to_do_list/screen/home/category_collections.dart';

const LISTVIEW_HEIGHT = 70;

class CategoryListview extends StatefulWidget {
  final CategoryCollections categoryCollections;
  const CategoryListview({Key? key, required this.categoryCollections})
      : super(key: key);

  @override
  State<CategoryListview> createState() => _CategoryListviewState();
}

class _CategoryListviewState extends State<CategoryListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: widget.categoryCollections.categories.length*LISTVIEW_HEIGHT.toDouble(),
      child: ReorderableListView(
        
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = widget.categoryCollections.removeItem(oldIndex);
            widget.categoryCollections.insertItem(newIndex, item);
          });
        },
        children: widget.categoryCollections.categories
            .map((category) => SizedBox(
              height: LISTVIEW_HEIGHT.toDouble(),
              key: UniqueKey(),
              child: ListTile(
                    onTap: () {
                      setState(() {
                        category.toggleCheckbox();
                      });
                    },
                    
                    tileColor: Colors.grey[800],
                    leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: category.isChecked
                                    ? Colors.transparent
                                    : Colors.grey),
                            color: category.isChecked
                                ? Colors.blue
                                : Colors.transparent,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: category.isChecked
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        )),
                    title: Row(
                      children: [
                        category.categoryIcon,
                        const SizedBox(
                          width: 10,
                        ),
                        Text(category.name),
                      ],
                    ),
                    trailing: const Icon(Icons.reorder),
                  ),
            ))
            .toList(),
      ),
    );
  }
}
