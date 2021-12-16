import 'package:first/image_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'hw_1.dart';
import 'hw_2.dart';
import 'hw_3.dart';
import 'post_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind.singleton((i) => PostStore()), Bind.singleton((i) => ImageStore())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(
                  title: 'HomeModule',
                )),
        ChildRoute('/home1',
            child: (context, args) => HomeWork1(title: "HomeWork 1: Widgets"),
            transition: TransitionType.downToUp),
        ChildRoute('/home2',
            child: (context, args) => HomeWork2(title: "HomeWork 2: API"),
            transition: TransitionType.downToUp),
        ChildRoute('/home3',
            child: (context, args) => HomeWork3(title: "HomeWork 3: Gallery"),
            transition: TransitionType.downToUp),
      ];
}
