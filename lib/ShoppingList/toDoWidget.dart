import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:best_before/ShoppingList/toDo.dart';
import 'package:best_before/ShoppingList/toDos.dart';
import 'package:best_before/ShoppingList/Utils.dart';
import 'package:best_before/ShoppingList/editToDoPage.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: Key(todo.id),
          startActionPane: ActionPane(
          motion:  ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children:  [
           SlidableAction(
                onPressed: (context) => deleteTodo(context,todo),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          
          ),
          endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
           SlidableAction(
             flex: 2,
             onPressed: (context) =>  editTodo(context, todo),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label:'Edit'
            )
          ],
          ),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Color.fromRGBO(51, 171, 160, 0.612),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.all(Colors.white),
                //activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.teal,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Item Brought' : 'Item marked unpurchased',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontFamily:'Fredoka',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontFamily:'Fredoka',fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the item');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}