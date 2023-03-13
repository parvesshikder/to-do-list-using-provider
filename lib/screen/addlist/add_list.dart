import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/colors/custom_colors.dart';
import 'package:to_do_list/models/colors/customs_color_collections.dart';
import 'package:to_do_list/models/icons/icon_collections.dart';
import 'package:to_do_list/models/icons/icons.dart';
import 'package:to_do_list/models/todolist/todolist.dart';

class AddList extends StatefulWidget {
  AddList({Key? key}) : super(key: key);

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  CustomeColorCollections customeColorCollections = CustomeColorCollections();

  IconCollections iconCollections = IconCollections();

  CustomColors _selestedColor =
      CustomeColorCollections().colorCollections.first;

  ShowIcons _seletedIcon = IconCollections().iconCollections.first;

  final TextEditingController _listController = TextEditingController();
  String listName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listController.addListener(
      () => setState(() {
        listName = _listController.text;
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _listController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add List')),
        actions: [
          TextButton(
              onPressed: listName.isNotEmpty
                  ? () async {
                      Navigator.pop(context);
                      final user = Provider.of<User?>(context, listen: false);
                      final toDoListRef = FirebaseFirestore.instance
                          .collection('user')
                          .doc(user!.uid)
                          .collection('addList')
                          .doc();
                      final todolist = ToDoList(
                          reminderCount: 0,
                          id: toDoListRef.id,
                          title: _listController.text,
                          icon: {
                            'color': _selestedColor.id,
                            'id': _seletedIcon.id,
                          });

                      try {
                        await toDoListRef.set(todolist.toJson());
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  : null,
              child: const Text(
                'Add',
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selestedColor.color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  _seletedIcon.icon,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: TextField(
                controller: _listController,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: TextButton(
                    child: const Icon(Icons.clear),
                    onPressed: () {
                      _listController.clear();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customColor
                    in CustomeColorCollections().colorCollections)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selestedColor = customColor;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: customColor.color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selestedColor.id == customColor.id
                              ? Colors.black26
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: iconCollections.iconCollections
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        setState(() {
                          _seletedIcon = e;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _seletedIcon.id == e.id
                                ? Colors.black26
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Icon(e.icon),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
