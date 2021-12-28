import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:game_bai/ui/game_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(_app());
}

Widget _app() => LayoutBuilder(
      builder: (context, constraints) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: GamePage(),
              initialBinding: _Binding(),
            );
          },
        );
      },
    );

class _Binding extends Bindings {
  @override
  void dependencies() {}
}
