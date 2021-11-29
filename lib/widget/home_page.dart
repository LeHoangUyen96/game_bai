import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/finding_customers/controller/finding_customer_controller.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class HomeViewsPage extends GetView<FindingCustomerController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<FindingCustomerController>(
      init: FindingCustomerController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        //body: SingleChildScrollView(child: buildBody()),
        body: buildBody(),
        backgroundColor: WHITE,
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: NAV_HOME,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
          ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: InkWell(
        //   onTap: (){
        //     Get.back();
        //   },
        //   child: Icon(Icons.arrow_back_ios, color: WHITE,),
        // ),
      ),
    );
  }
  Widget buildBody(){
    return Center();
  }
} 