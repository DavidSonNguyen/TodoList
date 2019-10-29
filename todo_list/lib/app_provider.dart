import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo_model.dart';

class AppProvider extends ChangeNotifier {
  int _tab = 0;

  List<TodoModel> _todos = [
    new TodoModel('Todo 1', true),
    new TodoModel('Todo 2', false),
    new TodoModel('Todo 3', true),
    new TodoModel('Todo 4', false),
    new TodoModel('Todo 5', false),
    new TodoModel('Todo 6', true),
    new TodoModel('Todo 7', false),
    new TodoModel('Todo 8', true),
    new TodoModel('Todo 9', true),
    new TodoModel('Todo 10', true),
    new TodoModel('Todo 11', false),
    new TodoModel('Todo 12', false),
    new TodoModel('Todo 13', true),
    new TodoModel('Todo 14', false),
    new TodoModel('Todo 15', true),
    new TodoModel('Todo 16', false),
    new TodoModel('Todo 17', false),
    new TodoModel('Todo 18', false),
    new TodoModel('Todo 19', false),
    new TodoModel('Todo 20', false),
    new TodoModel('Todo 21', true),
    new TodoModel('Todo 22', true),
    new TodoModel('Todo 23', true),
    new TodoModel('Todo 24', true),
    new TodoModel('Todo 25', false),
    new TodoModel('Todo 26', true),
    new TodoModel('Todo 27', false),
    new TodoModel('Todo 28', true),
    new TodoModel('Todo 29', false),
    new TodoModel('Todo 30', true),
  ];

  int get tab => _tab;

  void setTab(int value) {
    _tab = value;
    notifyListeners();
  }

  List<TodoModel> get todos => _todos;

  void update(TodoModel model, int index) {
    _todos[index] = model;
    notifyListeners();
  }
}
