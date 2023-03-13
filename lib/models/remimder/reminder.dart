class Reminder {
  final String id;
  final String title;
  final String categoryid;
  final String? notes;
  final Map<String, dynamic> list;
  final int dueDate;
  final Map<String, dynamic> dueTime;

  Reminder(
      {required this.id,
      required this.title,
      required this.categoryid,
      this.notes,
      required this.list,
      required this.dueDate,
      required this.dueTime});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category_id': categoryid,
        'notes': notes,
        'list': list,
        'due_date': dueDate,
        'due_time': dueTime,
      };

  Reminder.fromJson(Map<String, dynamic> jSon)
      : id = jSon['id'],
        title = jSon['title'],
        categoryid = jSon['category_id'],
        notes = jSon['notes'],
        list = jSon['list'],
        dueDate = jSon['due_date'],
        dueTime = jSon['due_time'];
}
