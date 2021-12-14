import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';

PreferredSize buildAppBar(String text, Widget icon) {
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
      iconAdd: icon,
    ),
  );
}
