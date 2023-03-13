import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:to_do_list/models/todolist/todolist.dart';

class ToDoLIstCollection with ChangeNotifier{
  List<ToDoList> _todoList = [
    
  ];

  UnmodifiableListView<ToDoList> get todoList => UnmodifiableListView(_todoList);

  void addTodoList(ToDoList toDoList){
    _todoList.add(toDoList);
    notifyListeners();
  }

  void removeTodoList(ToDoList toDoList){
    _todoList.removeWhere((element) => element.id == toDoList.id);
    notifyListeners();
  }
}