import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';
void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'TODO APP',
      home : TodoPage()
    );
  }
}



