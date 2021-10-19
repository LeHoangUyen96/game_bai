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
// final ValueChanged<String>? onSubmitted;
//   final bool Function()? validator;
//
//   TextFieldCustomized(
//       {
//         this.invalid,
//       this.textInputAction,
//         this.path,
//       this.textInputType,
//       this.title,
//       this.errorText,
//       this.hint,
//       this.textController,
//       this.isObscured,
//       this.suffixIcon,
//       this.borderTop,
//       this.borderBottom,
//       this.focusNode,
//       this.filled,
//       this.onChanged,
//       this.validator,
//       this.onSubmitted,
//       this.icon
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
//       height: 48,
//       width:  Get.width,
//         decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//         color: _enabled == false
//         ? widget.errorText != null ?   boderTextFieldErrorColor : greyColor
//             : widget.errorText == null ? boderTextFieldEnabledColor : boderTextFieldErrorColor,
//         ),
//           borderRadius: BorderRadius.all(Radius.circular(9))
//       ),
//       child: Row(
//        children: [
//          Expanded(
//            flex: 2,
//            child: SvgPicture.asset(
//              widget.path.toString(),
//              height: 25.0,
//              width: 25.0,
//              color: _enabled == false
//                  ? widget.errorText != null ?   boderTextFieldErrorColor : greyColor
//                  : widget.errorText == null ? boderTextFieldEnabledColor : boderTextFieldErrorColor,
//              allowDrawingOutsideViewBox: true,
//            ),
//          ),
//          Container(
//            height: 48,
//            width: 1,
//            decoration: BoxDecoration(
//                color: _enabled == false
//                    ? widget.errorText != null ?   boderTextFieldErrorColor : greyColor
//                    : widget.errorText == null ? boderTextFieldEnabledColor : boderTextFieldErrorColor,
//           ),
//          ),
//          SizedBox(width: 20,),
//          Expanded(
//            flex: 10,
//            child: TextField(
//                style: TextStyle(
//                    fontWeight: FontWeight.w700,
//                    color: boderTextFieldEnabledColor,
//                    fontSize: mediumSize,
//                    fontFamily: SanFranciscoTextLight),
//                controller: widget.textController,
//                keyboardType: widget.textInputType,
//                textInputAction: widget.textInputAction,
//                obscureText: widget.isObscured ?? false,
//                maxLines: 1,
//                focusNode: _focusNode,
//                onTap: (){
//                  setState(() {
//                    _enabled = true;
//                  });
//                },
//                textAlign: TextAlign.left,
//                onChanged: widget.onChanged,
//                onSubmitted: widget.onSubmitted,
//                decoration:InputDecoration(
//                  // errorText: widget.errorText ?? null,
//                  filled: widget.filled,
//                  fillColor: blackColor,
//                  hintText: widget.hint,
//                  hintStyle: hintTextStyle,
//                  errorStyle: errorTextStyle,
//                  border: InputBorder.none,
//                  focusedBorder: InputBorder.none,
//                  enabledBorder: InputBorder.none,
//                  errorBorder: InputBorder.none,
//                  disabledBorder: InputBorder.none,
//                )),
//          ),
//       ],
//     ));
//   }
// }
