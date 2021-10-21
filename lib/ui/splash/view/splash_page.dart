import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/ui/splash/controller/splash_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (value) => InitialWidget(
          child: Center(
                child: ImageCustomized(
                  path: viet_trung_mobile_logo,
                  width: 178,
                  height: 250,
                ),
              ),
        ));
  }
}
