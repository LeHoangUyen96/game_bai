import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';

PreferredSize buildAppBar(String text) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 55),
    child: InitialWidget(
      child: Container(),
      titleAppBar: text,
      backgroundAppBar: Colors.black26,
      isShowBack: true,
      iconBack: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: WHITE,
        ),
      ),
      isAdd: true,
      iconAdd: Container(
        padding: EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.search,
            color: WHITE,
          ),
        ),
      ),
    ),
  );
}
