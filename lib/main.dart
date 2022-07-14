import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
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
      body: CustomScrollView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: addTodoDialog,
        tooltip: '新增事项',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
