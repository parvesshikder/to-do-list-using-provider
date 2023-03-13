import 'package:flutter/material.dart';
import 'package:to_do_list/common/category_icon.dart';
import 'package:to_do_list/models/category.dart';

class AddReminders extends StatefulWidget {
  const AddReminders({Key? key}) : super(key: key);

  @override
  _AddRemindersState createState() => _AddRemindersState();
}

class _AddRemindersState extends State<AddReminders> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  String title = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.addListener(
      () => setState(() {
        title = _titleController.text;
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('New reminder')),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Add',
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children:  [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      controller: _noteController,
                      decoration: InputDecoration(
                          hintText: 'Note', border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('List'),
                  CategoryIcon(bgColor: Colors.blue, iconData: Icons.calendar_month),
                  Icon(Icons.arrow_right),
                ],
              )),
            ),

            const SizedBox(height: 20,),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Category'),
                  CategoryIcon(bgColor: Colors.blue, iconData: Icons.calendar_month),
                  Icon(Icons.arrow_right),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
