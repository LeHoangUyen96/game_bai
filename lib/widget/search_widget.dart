import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? searchController;

  const SearchTextField({
    Key? key,
    this.searchController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchTextFieldState();
  }
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
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
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: GRAY),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        controller: widget.searchController,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 14,
          fontFamily: SanFranciscoUIText,
        ),
        onTap: () {
          setState(() {
            _enabled = true;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Tìm kiếm khách hàng',
          prefixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 22,
                color: Colors.black,
              )),
        ),
        maxLines: 1,
        textAlign: TextAlign.left,
      ),
    );
  }
}
