// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/app_provider.dart';

import 'package:todo_list/main.dart';
import 'package:todo_list/model/todo_model.dart';

void main() {
  test("test update todo list", () async {
    AppProvider appProvider = new AppProvider();
    // update todos value
    TodoModel model1 =
        new TodoModel(appProvider.todos[0].name, appProvider.todos[0].complete);
    model1.complete = false;
    appProvider.update(model1, 0);
    expect(false, appProvider.todos[0].complete);

    TodoModel model2 =
        new TodoModel(appProvider.todos[0].name, appProvider.todos[0].complete);
    model2.complete = true;
    appProvider.update(model2, 0);
    expect(true, appProvider.todos[0].complete);
  });
}
