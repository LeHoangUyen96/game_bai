import 'package:flutter/material.dart';

class TextCustomized extends StatelessWidget {
  final String text;
  final bool? isCenter;
  final int? maxLine;
  final String? font;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final double? lineSpacing;
  final FontStyle? style;

  TextCustomized(
      {required this.text,
      this.isCenter,
      this.maxLine,
      this.font,
      this.color,
      this.size,
      this.weight,
      this.textOverflow,
      this.textAlign,
        this.style,
      this.lineSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: lineSpacing ?? null,
          fontWeight: weight,
          fontFamily: font,
          fontSize: size,
          fontStyle: style,
          color: color ?? Colors.black.withOpacity(0.70)),
      textAlign: textAlign != null
          ? textAlign
          : (isCenter != null)
              ? TextAlign.center
              : null,
      maxLines: maxLine,
      overflow: textOverflow ?? null,
    );
  }
}
