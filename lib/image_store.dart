import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'image_store.g.dart';

// This is the class used by rest of your codebase
class ImageStore = _ImageStore with _$ImageStore;

// The store-class
abstract class _ImageStore with Store {
  @observable
  ObservableList<Image> images = ObservableList.of([]);

  Map<String, MaterialColor> authorColors = Map();

  @action
  void addImage(Image image) {
    images.add(image);
  }

  @action
  void uploadImages() {
    images.addAll([
      Image.asset('assets/images/frostpunk.png'),
      Image.asset('assets/images/cyberpunk.png'),
      Image.asset('assets/images/witcher.png'),
      Image.asset('assets/images/zomboid.png'),

    ]);
  }

  /// Get from gallery
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
        addImage(Image.file(File(pickedFile.path)));
    }
  }


  /// Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
        addImage(Image.file(File(pickedFile.path)));
    }
  }
}
