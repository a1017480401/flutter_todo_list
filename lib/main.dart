import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Scaffold, FloatingActionButton;
import 'package:flutter_todo_list/entity/todo_item.dart';
import 'package:flutter_todo_list/widget/add_todo_dialog.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1200, 800);
    appWindow.minSize = const Size(360, 720);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = ('TodoList');
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todoList = [];

  void addTodoDialog() async {
    final TodoItem? result = await showDialog(
        context: context,
        builder: (context) => const AddTodoDialog(),
        barrierDismissible: false);
    if (result != null) {
      todoList.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Button(
                  onPressed: addTodoDialog,
                  child: const Text('新增'),
                )
              ],
            ),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.red,
                              child: Text(
                                todoList[index].title,
                              ),
                            ),
                        childCount: todoList.length),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
