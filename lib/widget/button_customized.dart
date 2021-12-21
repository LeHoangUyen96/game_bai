import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustomized extends StatelessWidget {
  final String? text;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Function? onTap;
  final double? borderWidth;
  final double? width;
  final double? height;

  ButtonCustomized(this.text,
      {this.margin,
      this.borderRadius,
      this.textStyle,
      this.textColor,
      this.backgroundColor,
      this.onTap,
      this.borderColor,
      this.borderWidth,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!() : null,
      child: Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          padding: EdgeInsets.all(10),
          margin: margin,
          decoration: BoxDecoration(
            border: Border.all(
                width: borderWidth ?? 2.0,
                color: borderColor ?? (backgroundColor ?? GRAY)),
            color: backgroundColor ?? GRAY,
            borderRadius: borderRadius ?? BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              text!,
              style: textStyle ??
                  TextStyle(
                    fontSize: customSize,
                    fontFamily: inter,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
