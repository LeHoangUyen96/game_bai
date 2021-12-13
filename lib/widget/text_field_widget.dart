import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/styles.dart';

class TextFieldCustom extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? path;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? invalid;
  final String? errorText;
  final bool? isObscured;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool? borderTop;
  final bool? borderBottom;
  final FocusNode? focusNode;
  final bool? filled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool Function()? validator;

  TextFieldCustom(
      {this.invalid,
      this.textInputAction,
      this.path,
      this.textInputType,
      this.title,
      this.errorText,
      this.hint,
      this.textController,
      this.isObscured,
      this.suffixIcon,
      this.borderTop,
      this.borderBottom,
      this.focusNode,
      this.filled,
      this.onChanged,
      this.validator,
      this.onSubmitted,
      this.icon});

  @override
  State<StatefulWidget> createState() {
    return _TextFieldCustomizedState();
  }
}

class _TextFieldCustomizedState extends State<TextFieldCustom> {
  FocusNode _focusNode = FocusNode();
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _enabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: Get.width,
      child: TextField(
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: boderTextFieldEnabledColor,
              fontSize: normalSize,
              fontFamily: SanFranciscoTextLight),
          controller: widget.textController,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isObscured ?? false,
          maxLines: 1,
          focusNode: _focusNode,
          onTap: () {
            setState(() {
              _enabled = true;
            });
          },
          textAlign: TextAlign.left,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            // errorText: widget.errorText ?? null,
            filled: widget.filled,
            fillColor: BLACK,
            hintText: widget.hint,
            hintStyle: hintTextStyle,
            errorStyle: errorTextStyle,
            border: InputBorder.none,
            //focusedBorder: InputBorder.none,
            //enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: GRAY4),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: GRAY4),
            ),
          )),
    );
  }
}
