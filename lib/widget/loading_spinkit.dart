import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinKit extends StatelessWidget {
  final String? title;

  LoadingSpinKit({this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 110,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextCustomized(
                  size: customSize,
                  text: title ?? BASE_NAME,
                  font: fOpenSan,
                  color: BLACK,
                ),
                const SizedBox(height: 20,),
                const SpinKitCircle(
                  color: BLACK,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
