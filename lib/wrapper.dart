import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/todolist/todolist.dart';
import 'package:to_do_list/models/todolist/todolist_collection.dart';
import 'package:to_do_list/screen/home/home_screen.dart';
import 'package:to_do_list/screen/login/login_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context, listen: false);
    final toDoListSteam = FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .collection('addList')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((toDoList) => ToDoList.fromJson(toDoList.data())).toList());

    return StreamProvider<List<ToDoList>>.value(
      value: toDoListSteam,
      initialData: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
            ),
            brightness: Brightness.dark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
        home: user == null ? const LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
