import 'package:flutter/material.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/common/widget/scaffold/transparent_scaffold.dart';

class BottomDialogScaffold extends StatelessWidget {
  final Widget body;
  const BottomDialogScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return TransparentScaffold(
     backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            // color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
          ),
          child: body,
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        child: Text('저장'),
      ).p(20),
    );
  }
}
