import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';

class AppUtils {
  static void showSnackUpdate(BuildContext context, {TodoModel todo}) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Updated ${todo == null ? "" : todo.name}')));
  }
}
