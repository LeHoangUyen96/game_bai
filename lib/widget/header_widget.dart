import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';

class HeaderWidget extends StatelessWidget {
  final Widget? centerWidget;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool? isShowBack;
  final bool? isTittleCenter;
  final List<Widget>? actions;

  HeaderWidget({
    this.centerWidget,
    this.onPressed,
    this.backgroundColor,
    this.isShowBack,
    this.isTittleCenter,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (isShowBack != null && isShowBack == true)
          ? Container(
        margin: EdgeInsets.only(left: 16),

        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: BUTTON_HEADER_COLOR,
            size: 30,
          ),
          onPressed: (){
            onPressed != null ? onPressed!() : Get.back(result: 1);
          },
        ),
      )
          : Container(),
      backgroundColor: backgroundColor ?? BG_HEADER_COLOR,
      title: centerWidget ?? Center(),
      titleSpacing: 0,
      actions: actions ?? [],
      centerTitle: isTittleCenter ?? false,
      flexibleSpace: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(
                'assets/images/img_background.png',
              ),
              fit: BoxFit.cover,
            )),
      )
    );
  }
}
