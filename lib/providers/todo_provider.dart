import 'package:todo/models/todo.dart';

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(id: 0, title: 'aaa', description: 'aaaaaaaa'),
    Todo(id: 1, title: 'bbb', description: 'bbbbbbb'),
    Todo(id: 2, title: 'ccc', description: 'ccccccc'),
    Todo(id: 3, title: 'ddd', description: 'ddddddd'),
    Todo(id: 4, title: 'eee', description: 'eeeeeee'),
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int id) {
    return dummyTodos[id];
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
        id: dummyTodos.length + 1,
        title: todo.title,
        description: todo.description);
    dummyTodos.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == id) {
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == todo.id) {
        dummyTodos[i] = todo;
      }
    }
  }
}
