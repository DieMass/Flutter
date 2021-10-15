import 'dart:math';

import 'package:dio/dio.dart';
import 'package:first/post.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'api_client.dart';

// Include generated file
part 'post_store.g.dart';

// This is the class used by rest of your codebase
class PostStore = _PostStore with _$PostStore;

// The store-class
abstract class _PostStore with Store {

  RestClient restClient = RestClient(Dio());

  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  Map<String, MaterialColor> authorColors = Map();

  @action
  void updatePosts() {
    restClient.getPosts().then((List<Post> posts) {
        this.posts = ObservableList.of(posts);
        posts.forEach((element) {
          if (!authorColors.containsKey(element.author)) {
            authorColors[element.author] = [Colors.red, Colors.blue, Colors.green, Colors.brown].elementAt(Random().nextInt(4));
          }
        });
    }).catchError((error) {
      print("I WAS HERE");
      print(error.toString());
    });
  }
}