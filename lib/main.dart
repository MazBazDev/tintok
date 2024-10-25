import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool blockDebounce = false;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ASSE", style: TextStyle(
              color: CupertinoColors.white,
            ),
          ),
          backgroundColor: CupertinoColors.activeGreen,
          actions: [
            IconButton(onPressed: test, icon: const Icon(CupertinoIcons.add))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(12),
            children: [
              SafeArea(child: Text("Hello"))
            ],
          )),
        body: GestureDetector(
          onPanEnd: (details) {
            blockDebounce = false;
          },
          onPanUpdate: (details) {
            if (blockDebounce) return;

            if (details.delta.dy > 0)
              debugPrint("Up");
            else
              debugPrint("Down");

            if (details.delta.dx > 0)
              debugPrint("Right");
            else
              debugPrint("left");

            blockDebounce = true;
          },
          child: const Expanded(
              flex: 1,
              child: Center(
                child: Text("data"),
              ) ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bubble_left),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.hammer_fill),
                label: 'School',
              ),
            ],
        )
      ),
    );
  }

  void test() {
    debugPrint("Button pressed");
  }

  void Dragged(DragEndDetails details) {
    debugPrint("Button pressed");
    debugPrint(details.toString());
  }
}

