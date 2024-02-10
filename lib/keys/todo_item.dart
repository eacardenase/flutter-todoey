import 'package:flutter/material.dart';

import 'package:todoey/keys/keys.dart';

enum Priority { urgent, normal, low }

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (todo.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (todo.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(todo.text),
        ],
      ),
    );
  }
}
