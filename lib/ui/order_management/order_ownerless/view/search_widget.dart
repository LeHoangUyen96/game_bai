import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerleess_confirm_controller_step1.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/view/order_ownerless_confirm_page_step2.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

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
  final FocusNode focusNode = FocusNode();
  bool enabled = false;
  bool onSelect = false;
  bool onInput = false;
  bool onSearch = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          enabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: GRAY),
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
              enabled = true;
            });
          },
          onSubmitted: (value) {
            setState(() {
              onSearch = true;
            });
          },
          onChanged: (text) {
            if (widget.searchController!.text.isEmpty) {
              setState(() {
                onInput = false;
              });
            } else {
              if (widget.searchController!.text.length >= 3) {
                Get.find<OrderOwnerlessConfirmControllerStep1>()
                    .onGetListSearch(widget.searchController!.text);
              } else {
                setState(() {});
              }
              setState(() {
                onInput = true;
              });
            }
          },
          focusNode: focusNode,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: searchCustomer,
            prefixIcon: Icon(
              Icons.search,
              size: 22,
              color: Colors.black,
            ),
            suffixIcon: onInput
                ? InkWell(
                    onTap: () {
                      widget.searchController!.clear();
                    },
                    child: Icon(
                      Icons.clear,
                      color: BLACK,
                      size: 20,
                    ),
                  )
                : SizedBox(),
          ),
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
      ),
      widget.searchController!.text != '' &&
              widget.searchController!.text.length >= 3
          ? _buildResultSearch()
          : SizedBox(),
    ]);
  }

  Widget _buildResultSearch() {
    return Get.find<OrderOwnerlessConfirmControllerStep1>()
            .searchResponse!
            .isNotEmpty
        ? SingleChildScrollView(
            child: Container(
                color: GRAY_BG,
                child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    borderOnForeground: true,
                    child: ListView.builder(
                      itemCount:
                          Get.find<OrderOwnerlessConfirmControllerStep1>()
                              .searchResponse!
                              .length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _itemSearch(
                            Get.find<OrderOwnerlessConfirmControllerStep1>()
                                .searchResponse![index]);
                      },
                    ))))
        : Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: TextCustomized(
              text: noResult,
              color: Colors.black,
              weight: FontWeight.w400,
              size: 16,
            ),
          );
  }

  Widget _itemSearch(DataSearchCustomer response) {
    return InkWell(
        onTap: () {
          Get.to(OwneslessOrderConfirmPageStep2(
            userCode: response.userCode!,
            userName: response.name!,
            userPhone: response.phone!,
          ));
        },
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: response.avatar == null ||
                                  response.avatar == ''
                              ? ImageCustomized(
                                  path: LOGO_IMG,
                                  fit: BoxFit.fill,
                                )
                              : SvgPicture.network(
                                  NetworkConfig.URL_SERVER + response.avatar!,
                                  fit: BoxFit.fill,
                                ),
                        )),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(
                          text: response.name!,
                          color: Colors.black,
                          weight: FontWeight.w500,
                          size: 16,
                        ),
                        SizedBox(height: 3),
                        TextCustomized(
                          text: response.phone!,
                          color: GRAY8,
                          size: 14,
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              height: 0.5,
              color: GRAY8,
            )
          ],
        ));
  }
}
