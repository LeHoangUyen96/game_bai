// import 'dart:ui';
// import 'package:baoden/res/colors.dart';
// import 'package:baoden/res/dimens.dart';
// import 'package:baoden/res/fonts.dart';
// import 'package:baoden/res/styles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class TextFieldCustomized extends StatefulWidget {
//   final String? title;
//   final String? hint;
//   final String? path;
//   final TextEditingController? textController;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final bool? invalid;
//   final String? errorText;
//   final bool? isObscured;
//   final Widget? suffixIcon;
//   final Widget? icon;
//   final bool? borderTop;
//   final bool? borderBottom;
//   final FocusNode? focusNode;
//   final bool? filled;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmitted;
//   final bool Function()? validator;
//
//   TextFieldCustomized(
//       {
//         this.invalid,
//         this.textInputAction,
//         this.path,
//         this.textInputType,
//         this.title,
//         this.errorText,
//         this.hint,
//         this.textController,
//         this.isObscured,
//         this.suffixIcon,
//         this.borderTop,
//         this.borderBottom,
//         this.focusNode,
//         this.filled,
//         this.onChanged,
//         this.validator,
//         this.icon,
//         this.onSubmitted
//       });
//
//   @override
//   State<StatefulWidget> createState() {
//     return _TextFieldCustomizedState();
//   }
// }
//
// class _TextFieldCustomizedState extends State<TextFieldCustomized> {
//   FocusNode _focusNode = FocusNode();
//   bool _enabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       if(!_focusNode.hasFocus) {
//         setState(() {
//           _enabled = false;
//         });
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 48,
//         width:  Get.width,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(
//               color: _enabled == false
//                   ? widget.errorText != null ?   boderTextFieldErrorColor : greyColor
//                   : widget.errorText == null ? boderTextFieldEnabledColor : boderTextFieldErrorColor,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(5))
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: 20,),
//             Expanded(
//               flex: 10,
//               child: TextField(
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: boderTextFieldEnabledColor,
//                       fontSize: customSize,
//                       fontFamily: SanFranciscoTextLight),
//                   controller: widget.textController,
//                   keyboardType: widget.textInputType,
//                   textInputAction: widget.textInputAction,
//                   obscureText: widget.isObscured ?? false,
//                   maxLines: 1,
//                   focusNode: _focusNode,
//                   onTap: (){
//                     setState(() {
//                       _enabled = true;
//                     });
//                   },
//                   textAlign: TextAlign.left,
//                   onChanged: widget.onChanged,
//                   onSubmitted: widget.onSubmitted,
//                   decoration:InputDecoration(
//                     // errorText: widget.errorText ?? null,
//                     filled: widget.filled,
//                     fillColor: blackColor,
//                     hintText: widget.hint,
//                     hintStyle: hintTextStyle,
//                     errorStyle: errorTextStyle,
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                   )),
//             ),
//           ],
//         ));
//   }
// }
import 'dart:ui';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TextFieldCustomized extends StatefulWidget {
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
  final bool? isSuffixIcon;

  TextFieldCustomized({this.invalid, this.textInputAction, this.path, this.textInputType, this.title, this.errorText, this.hint, this.textController, this.isObscured, this.suffixIcon, this.borderTop, this.borderBottom, this.focusNode, this.filled, this.onChanged, this.validator, this.onSubmitted, this.icon, this.isSuffixIcon, });

  @override
  State<StatefulWidget> createState() {
    return _TextFieldCustomizedState();
  }
}

class _TextFieldCustomizedState extends State<TextFieldCustomized> {
  FocusNode _focusNode = FocusNode();
  bool _enabled = false;
  bool _obscureText = true;

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
  void _toggleObscured() {
    setState(() {
      _obscureText = !_obscureText;
      if (_focusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      _focusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _enabled == false
                ? widget.errorText != null
                    ? BLACK
                    : GRAY
                : widget.errorText == null
                    ? BLACK
                    : GRAY,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        children: [
          // widget.path != null
          //     ? Expanded(
          //         flex: 2,
          //         child: SvgPicture.asset(
          //           widget.path.toString(),
          //           height: 25.0,
          //           width: 25.0,
          //           color: _enabled == false
          //               ? widget.errorText != null
          //                   ? RED
          //                   : GRAY
          //               : widget.errorText == null
          //                   ? RED
          //                   : GRAY,
          //           allowDrawingOutsideViewBox: true,
          //         ),
          //       )
          //     : SizedBox(),
          // widget.path != null
          //     ? Container(
          //         height: 48,
          //         width: 1,
          //         decoration: BoxDecoration(
          //           color: _enabled == false
          //               ? widget.errorText != null
          //                   ? RED
          //                   : GRAY
          //               : widget.errorText == null
          //                   ? RED
          //                   : GRAY,
          //         ),
          //       )
          //     : SizedBox(),
          // widget.path != null
          //     ? Container(
          //         height: 48,
          //         width: 1,
          //         decoration: BoxDecoration(
          //           color: _enabled == false
          //               ? widget.errorText != null
          //                   ? RED
          //                   : GRAY
          //               : widget.errorText == null
          //                   ? RED
          //                   : GRAY,
          //         ),
          //       )
          //     : SizedBox(),
          SizedBox(
            width: widget.path != null ? 10 : 10,
          ),
          Expanded(
            flex: 10,
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: BLACK,
                fontSize: customSize,
                fontFamily: SanFranciscoUIText,
              ),
              controller: widget.textController,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              obscureText: widget.isObscured ==null ? false : _obscureText,
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
                //fillColor: greyColor,
                fillColor: GRAY4,
                hintText: widget.hint,
                //hintStyle: hintTextStyle,
                hintStyle: TextStyle(
                   fontWeight: FontWeight.w100,
                   color: GRAY,
                   fontSize: smallSize,
                   fontFamily: SanFranciscoTextLight
                ),
                errorStyle: errorTextStyle,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon : widget.isSuffixIcon != null 
                ? GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                  _obscureText
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
                  // : Icons.visibility_off_rounded,
                  color: GRAY,
                  size: 24,
                )
               ) : SizedBox(),
              ),
              
            ),
          ),
         
        ],
      ),
    );
  }
}
