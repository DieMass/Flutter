import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'image_store.dart';

class HomeWork3 extends StatefulWidget {
  const HomeWork3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork3State createState() => _HomeWork3State();
}

class _HomeWork3State extends State<HomeWork3> {
  ImageStore imageStore = ImageStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Observer(builder: (context) {
                  return GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: imageStore.images.map((item) {
                        return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: item.image,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return InteractiveViewer(
                                  panEnabled: false,
                                  boundaryMargin: EdgeInsets.all(100),
                                  minScale: 0.5,
                                  maxScale: 5,
                                  child: item,
                                );
                              }));
                            });
                      }).toList());
                }),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.add_photo_alternate),
                      onTap: () {
                        imageStore.getFromGallery();
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.camera_enhance),
                      onTap: () {
                        imageStore.getFromCamera();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    imageStore.uploadImages();
  }
}
