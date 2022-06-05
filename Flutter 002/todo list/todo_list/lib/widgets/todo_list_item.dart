import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            //padding: const EdgeInsets.all(16),
            //flex: 2,
            onPressed: (context) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.remove,
            label: 'Remove',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              DateFormat('dd/MMM/yyyy - EE - HH:mm').format(todo.dateTime),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              todo.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
