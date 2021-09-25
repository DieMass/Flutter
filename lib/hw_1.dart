import 'package:flutter/material.dart';

class HomeWork1 extends StatefulWidget {
  const HomeWork1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork1State createState() => _HomeWork1State();
}

class Message {
  
  const Message({required this.name, required this.content});
  
  final String name;
  final String content;
  
}

class _HomeWork1State extends State<HomeWork1> {
  List<Message> _messages = [Message(name: 'John', content: 'Просто здравствуй'),
  Message(name: 'Chad', content: 'Просто как дела'),
  Message(name: 'Stacy', content: 'Наверное так начну при встрече я')];

  TextEditingController _textEditingController = TextEditingController();
  String currentButtonValue = "John";
  
  void _addToList(String text) {
    setState(() {
      _messages.add(Message(name: currentButtonValue,content: text));
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
                      children: _messages.map((item) {
                        return ListTile(
                          leading: Text(
                            item.name,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                          title: Text(
                            item.content,
                            style: const TextStyle(
                                color: Colors.brown, fontSize: 16),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: currentButtonValue,
                        items: <String>['Chad', 'Stacy', 'John'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            currentButtonValue = value!;
                          });
                        },
                      ),
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