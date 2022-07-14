import 'package:flutter/material.dart';
import 'package:flutter_todo_list/color.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          constraints: const BoxConstraints(
              maxHeight: 600, maxWidth: 600, minWidth: 100, minHeight: 100),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        Text(
                          '标题',
                          style:
                              TextStyle(color: TColor.textWithe, fontSize: 16),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 470,
                          ),
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                                hintText: '请输入标题，尽量短点吧',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.6)),
                                filled: true,
                                fillColor: const Color(0xFF1C1F22),
                                focusColor: const Color(0xFF1C1F22),
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder()),
                            style: TextStyle(
                                color: TColor.textWithe, fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
