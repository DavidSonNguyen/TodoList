import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';

class ItemTodo extends StatelessWidget {
  TodoModel model;
  ValueChanged<bool> onChanged;

  ItemTodo({@required this.model, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('${model.name}'),
          Checkbox(
            value: model.complete,
            onChanged: onChanged,
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
    );
  }
}
