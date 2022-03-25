import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:best_before/ShoppingList/toDo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Fridge',
      description: 'Tap to edit category & add items',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Freezer',
      description: 'Tap to edit category & add items',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Cupboard',
      description: 'Tap to edit category & add items'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Other 1',
      description:  'Tap to edit category & add items',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Other 2',
      description:  'Tap to edit category & add items',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Other 3',
      description:  'Tap to edit category & add items',
    ),
    
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}