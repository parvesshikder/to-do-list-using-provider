import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/common/category_icon.dart';
import 'package:to_do_list/models/colors/customs_color_collections.dart';
import 'package:to_do_list/models/todolist/todolist.dart';
import 'package:to_do_list/models/todolist/todolist_collection.dart';
import 'package:to_do_list/screen/footer/footer.dart';
import 'package:to_do_list/screen/home/category_collections.dart';
import 'package:to_do_list/screen/home/category_gridview.dart';
import 'package:to_do_list/screen/home/category_listview.dart';
import 'package:to_do_list/screen/login/login_screen.dart';
import 'package:to_do_list/services/auth/auth.dart';

import '../../models/icons/icon_collections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollections categoryCollections = CategoryCollections();
  String layoutType = 'grid';

  void addList(ToDoList list) {
    Provider.of<ToDoLIstCollection>(context, listen: false).addTodoList(list);
  }

  void removeList(ToDoList list) {
    Provider.of<ToDoLIstCollection>(context, listen: false)
        .removeTodoList(list);
  }

  @override
  Widget build(BuildContext context) {
    final todolist = Provider.of<List<ToDoList>>(context);
    final user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Auth().signOut();
            //Navigator.pop(context);
          },
          child: Text('Sign Out'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(layoutType == 'grid' ? 'Edit' : 'Done'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedCrossFade(
            crossFadeState: layoutType == 'grid'
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            firstChild:
                CategoryGridView(categoryCollections: categoryCollections),
            secondChild:
                CategoryListview(categoryCollections: categoryCollections),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    onDismissed: (dis) async {
                      // removeList(todolist[index]);
                      final todoLIst = FirebaseFirestore.instance
                          .collection('user')
                          .doc(user!.uid)
                          .collection('addList')
                          .doc(todolist[index].id);

                      try{
                        await todoLIst.delete();
                      }catch(e){
                        print(e.toString());
                      }
                    },
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                    ),
                    key: UniqueKey(),
                    child: Card(
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                width: 1,
                                color: Colors.red,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(todolist[index].title),
                                CategoryIcon(
                                  bgColor: CustomeColorCollections()
                                      .findColorById(
                                          todolist[index].icon['color'])
                                      .color,
                                  iconData: IconCollections()
                                      .getIconbyID(todolist[index].icon['id'])
                                      .icon,
                                ),
                                Text('0'),
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
