import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/todolist/todolist.dart';
import 'package:to_do_list/screen/addlist/add_list.dart';
import 'package:to_do_list/screen/addreminders/add_reminders.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todolist = Provider.of<List<ToDoList>>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: todolist.length > 0
                  ? () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddReminders(),
                          fullscreenDialog: true));
                    }
                  : null,
              icon: const Icon(Icons.add_circle),
              label: const Text('New Reminder'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddList(), fullscreenDialog: true));
              },
              child: const Text('Add List'),
            )
          ],
        ),
      ),
    );
  }
}
