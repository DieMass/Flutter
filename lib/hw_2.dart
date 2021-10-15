import 'package:dio/dio.dart';
import 'package:first/post.dart';
import 'package:first/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'api_client.dart';

class HomeWork2 extends StatefulWidget {
  const HomeWork2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork2State createState() => _HomeWork2State();
}

class _HomeWork2State extends State<HomeWork2> {

  RestClient restClient = RestClient(Dio());
  PostStore postStore = PostStore();

  TextEditingController _textEditingController = TextEditingController();
  String currentButtonValue = "John";

  void _addToList(String text) {
    restClient.sendPost(Post(author: currentButtonValue, message: text)).then((value) => postStore.updatePosts());
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    postStore.authorColors[""];
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
                    child: Observer(
                      builder: (context) {
                        return ListView(
                          children: postStore.posts.map((item) {
                              return ListTile(
                                leading: Text(
                                  item.author,
                                  style: TextStyle(
                                      color: postStore.authorColors[item.author], fontSize: 10),
                                ),
                                title: Text(
                                  item.message,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              );
                            }).toList(),
                  );
                      }
                    )),
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

  @override
  void initState() {
    super.initState();
    postStore.updatePosts();
  }
}