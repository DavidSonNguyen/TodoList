import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screen/complete_screen.dart';
import 'package:todo_list/screen/incomplete_screen.dart';
import 'package:todo_list/screen/todo_screen.dart';

import 'app_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AppProvider>(
        builder: (context) => AppProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final screens = [
    TodoScreen(key: PageStorageKey<String>('Tab1')),
    CompleteScreen(key: PageStorageKey<String>('Tab2')),
    InCompleteScreen(key: PageStorageKey<String>('Tab3')),
  ];

  final PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: PageView(
        children: screens,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tab) {
          provider.setTab(tab);
          pageController.jumpToPage(tab);
        },
        currentIndex: provider.tab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('All'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            title: Text('Complete'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clear_all),
            title: Text('Incomplete'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
