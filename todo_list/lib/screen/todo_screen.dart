import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app_provider.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/utils/app_utils.dart';
import 'package:todo_list/widget/item_todo.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoState();
  }

  TodoScreen({Key key}) : super(key: key);
}

class _TodoState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: provider.todos.length,
          itemBuilder: (context, index) {
            TodoModel model = provider.todos[index];
            return ItemTodo(
              model: model,
              onChanged: (checked) {
                model.complete = checked;
                provider.update(model, index);
                AppUtils.showSnackUpdate(context, todo: model);
              },
            );
          },
        ),
      ),
    );
  }
}
