import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:best_before/ShoppingList/toDos.dart';
import 'package:best_before/ShoppingList/toDoWidget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    //unsure if this line is needed
    Builder:(context);

    return todos.isEmpty
        ? Center(
            child: Text(
              'No items.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}