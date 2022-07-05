class Todo {
  Todo({this.id, required this.title, required this.description});

  late int? id;
  late String title;
  late String description;

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }

  Todo.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    description = map?['description'];
  }
}
