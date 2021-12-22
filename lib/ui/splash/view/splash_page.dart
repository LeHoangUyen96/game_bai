import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/ui/splash/controller/splash_controller.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (value) => Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(BG_IMG_ADMIN),
                  fit: BoxFit.cover,
                )),
                child: Center(
                  child: ImageCustomized(
                    path: IMG_LOGO,
                    width: 178,
                    height: 250,
                  ),
                ),
              ),
            ));
  }
}
