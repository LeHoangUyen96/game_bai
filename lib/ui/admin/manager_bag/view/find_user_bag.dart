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
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/create_bag_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerless_confirm_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class SearchTextFieldUser extends GetView<CreateBagController> {
  final TextEditingController? searchController;

  const SearchTextFieldUser({
    Key? key,
    this.searchController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateBagController>(
        init: CreateBagController(),
        builder: (value) => Column(children: [
              Container(
                //margin: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: GRAY),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: SanFranciscoUIText,
                  ),
                  onTap: () {
                    controller.enabled = true;
                  },
                  onSubmitted: (value) {
                    controller.onSearch = true;
                  },
                  onChanged: (text) {
                    if (searchController!.text.isEmpty) {
                      controller.onInput = false;
                    } else {
                      if (searchController!.text.length >= 3) {
                        controller.onGetListSearch(searchController!.text);
                      }
                      controller.onInput = true;
                    }
                  },
                  focusNode: controller.focusNode,
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
                    suffixIcon: controller.onInput
                        ? InkWell(
                            onTap: () {
                              searchController!.clear();
                              controller.searchResponse!.clear();
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
              searchController!.text.length >= 3
                  ? _buildResultSearch()
                  : SizedBox(),
            ]));
  }

  Widget _buildResultSearch() {
    return controller.searchResponse!.isNotEmpty
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
                      itemCount: controller.searchResponse!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _itemSearch(controller.searchResponse![index]);
                      },
                    ))))
        : Container(
            // padding: EdgeInsets.symmetric(vertical: 5),
            // child: TextCustomized(
            //   text: noResult,
            //   color: Colors.black,
            //   weight: FontWeight.w400,
            //   size: 16,
            // ),
          );
  }

  Widget _itemSearch(DataSearchCustomer response) {
    return InkWell(
        onTap: () {
           controller.isShowCard(response.phone!);
           controller.searchResponse!.clear();
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
