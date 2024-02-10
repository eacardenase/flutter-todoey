import 'package:flutter/material.dart';

import 'package:todoey/keys/checkable_todo_item.dart';
import 'package:todoey/keys/todo_item.dart';

class Todo {
  const Todo({
    required this.text,
    required this.priority,
  });

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todos = const [
    Todo(text: 'Learn Flutter', priority: Priority.urgent),
    Todo(text: 'Practice Flutter', priority: Priority.normal),
    Todo(text: 'Learn Laravel', priority: Priority.low),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);

    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);

      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });

    return sortedTodos;
  }

  void _changeTodosOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeTodosOrder,
            icon: Icon(
                _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  // key: ObjectKey(todo),
                  key: ValueKey(todo),
                  todo: todo,
                )
            ],
          ),
        )
      ],
    );
  }
}
