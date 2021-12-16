import 'package:flutter_modular/flutter_modular.dart';

import 'home_module.dart';
import 'post_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => PostStore())];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: HomeModule())];
}