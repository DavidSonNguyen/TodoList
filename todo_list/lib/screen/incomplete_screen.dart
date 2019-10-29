import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/utils/app_utils.dart';
import 'package:todo_list/widget/item_todo.dart';

import '../app_provider.dart';

class InCompleteScreen extends StatefulWidget {
  InCompleteScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InCompleteState();
  }
}

class _InCompleteState extends State<InCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: provider.todos.length,
          itemBuilder: (context, index) {
            TodoModel model = provider.todos[index];
            if (model.complete) {
              return Center();
            }
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
