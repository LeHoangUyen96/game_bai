import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:game_bai/res/images.dart';

import 'package:game_bai/widget/image_customized.dart';

class GamePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      imgBackGround(),
      Container(
          width: Get.width,
          alignment: Alignment.center,
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 60),
                child: ImageCustomized(
                  path: logo,
                  height: Get.height * 0.3,
                  width: Get.width * 0.8,
                )),
            SizedBox(height: Get.height * 0.075),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              launch('https://68a.club/?code=12962219');
                            },
                            child: Image.asset(
                              register,
                              width: Get.width * 0.7,
                              height: Get.height * 0.1,
                              alignment: Alignment.center,
                            )),
                        SizedBox(height: 5),
                        InkWell(
                            onTap: () {
                              launch('https://t.me/code68club');
                            },
                            child: Image.asset(
                              gift,
                              height: Get.height * 0.1,
                              width: Get.width * 0.71,
                              alignment: Alignment.center,
                            )),
                        SizedBox(height: 5),
                        InkWell(
                            onTap: () {
                              launch('https://t.me/fun68gamebai');
                            },
                            child: Image.asset(
                              discount,
                              height: Get.height * 0.1,
                              width: Get.width * 0.71,
                              alignment: Alignment.center,
                            )),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  launch('https://t.me/baolasvegas3');
                                },
                                child: Image.asset(
                                  take_care1,
                                  width: Get.width * 0.35,
                                  height: Get.height * 0.075,
                                  alignment: Alignment.center,
                                )),
                            InkWell(
                                onTap: () {
                                  launch('https://t.me/giaitri68gamebai');
                                },
                                child: Image.asset(
                                  take_care2,
                                  width: Get.width * 0.35,
                                  height: Get.height * 0.075,
                                  alignment: Alignment.center,
                                )),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ])),
    ]);
  }

  Widget imgBackGround() {
    return Image.asset(
      bg,
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
    );
  }
}
