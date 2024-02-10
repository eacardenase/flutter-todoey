import 'package:flutter/material.dart';

import 'package:todoey/keys/keys.dart';
import 'package:todoey/keys/todo_item.dart';

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (widget.todo.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (widget.todo.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: _done,
            onChanged: _setDone,
          ),
          const SizedBox(width: 6),
          Icon(icon),
          const SizedBox(width: 12),
          Text(widget.todo.text),
        ],
      ),
    );
  }
}
