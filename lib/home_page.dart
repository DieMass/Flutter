import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _items = ['first', 'second', 'third'];

  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      _items.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text(
                            "HomeWork 1: Widgets",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 16),
                          ),
                          onTap: () {
                           Modular.to.pushNamed("/home1");
                          },
                        ),
                        ListTile(
                          title: Text(
                            "HomeWork 2: API",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 16),
                          ),
                          onTap: () {
                            Modular.to.pushNamed("/home2");
                          },
                        ),
                        ListTile(
                          title: Text(
                            "HomeWork 3: Gallery",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 16),
                          ),
                          onTap: () {
                            Modular.to.pushNamed("/home3");
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                        ),
                      ),
                      GestureDetector(
                        child: Icon(Icons.add),
                        onTap: () {
                          _addToList(_textEditingController.text);
                        },
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}