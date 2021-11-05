import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class LoadingDialogWidget extends StatelessWidget {
  final String? title;
  final String? text;
  LoadingDialogWidget({this.title, this.text});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 192,
          width: 294,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 44,
                    width: 44,
                    child: SvgPicture.asset(IC_CHECK_CRICLE)
                ),
                SizedBox(height: 20,),
                TextCustomized(
                  size: normalXSize,
                  weight: FontWeight.w700,
                  color: Colors.black,
                  text: title  ?? "Thông báo" ,
                ),
                SizedBox(height: 20,),
                TextCustomized(
                  size: verySmallSize,
                  weight: FontWeight.w300,
                  color: Colors.black,
                  text: text  ?? "Thành công",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}