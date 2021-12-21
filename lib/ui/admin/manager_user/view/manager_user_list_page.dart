import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:viet_trung_mobile_admin/data/response/list_user_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/controller/manager_user_list_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/view/create_user_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/view/detail_user_page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class ManagerUserPage extends GetView<ManagerUserController> {
  BuildContext? mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ManagerUserController>(
      init: ManagerUserController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body: controller.mDataListUserResponse != null
            ? buildBody()
            : LoadingSpinKit(),
        backgroundColor: BT_GRAY,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        //centerTitle: true,
        title: TextCustomized(
          text: MANAGE_PACKAGE_CUSTOMER,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
        ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(CreateUserPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset(
                IC_PLUS,
                color: WHITE,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Container(
            color: WHITE,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: WHITE,
                    border: Border.all(color: GRAY),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    controller.onSearchListUser();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IC_SEARCH,
                        width: Get.width * 0.1 - 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.searchNamePhone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ENTER_NAME_OR_PHONE,
                            hintStyle: TextStyle(
                                color: GRAY, fontFamily: SanFranciscoUIText),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //SizedBox(height: 25),
          Expanded(
            child: Container(
              height: Get.height * 0.8,
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: controller.onListRefresh,
                header: WaterDropHeader(
                  refresh: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 30,
                  ),
                  complete: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 40,
                  ),
                ),
                onLoading: controller.onListLoading,
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Container();
                    } else if (mode == LoadStatus.loading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: controller.refreshController,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return __buildItemStaff(
                          controller.mDataListUserResponse![index]);
                    },
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.mDataListUserResponse!.length,
                  ),
                ),
                // onLoading: controller.onListLoading,
                // footer: CustomFooter(
                //   builder: (BuildContext context, LoadStatus? mode) {
                //     Widget body;
                //     if (mode == LoadStatus.idle) {
                //       body = Container();
                //     } else if (mode == LoadStatus.loading) {
                //       body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                //     } else if (mode == LoadStatus.failed) {
                //       body = Text("Load Failed!Click retry!");
                //     } else if (mode == LoadStatus.canLoading) {
                //       body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                //     } else {
                //       body = Text("No more Data");
                //     }
                //     return Container(
                //       height: 55.0,
                //       child: Center(child: body),
                //     );
                //   },
                // ),
                // controller: controller.refreshController,
                // child: Container(
                //   padding: EdgeInsets.all(15),
                //   child: ListView.separated(
                //     itemBuilder: (BuildContext context, int index) {
                //       return __buildItemStaff(
                //           controller.listUserResponse!.data![index]);
                //     },
                //     shrinkWrap: true,
                //     separatorBuilder: (context, index) {
                //       return SizedBox(height: 10);
                //     },
                //     physics: BouncingScrollPhysics(),
                //     itemCount: controller.listUserResponse!.data!.length,
                //   ),
                //),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget __buildItemStaff(DataListUserResponse data) {
    return Container(
      child: InkWell(
        onTap: () {
          Get.to(DetailUserPage(), arguments: data.id);
        },
        child: Slidable(
          key: const ValueKey(0),
          // actionPane: SlidableDrawerActionPane(),
          // actionExtentRatio: 0.17,
          closeOnScroll: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: WHITE, borderRadius: BorderRadius.circular(16)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          child: ClipOval(
                            child: data.avatar == null || data.avatar == ''
                                ? ImageCustomized(
                                    path: LOGO_IMG,
                                    height: 60,
                                    width: 60,
                                  )
                                : ImageCustomized(
                                    path: data.avatar,
                                    height: 60,
                                    width: 60,
                                  ),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                              text: data.name.toString(),
                              color: BLACK_1,
                              size: normalSize,
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 5.0),
                            TextCustomized(
                              text: data.phone.toString(),
                              color: BT_GRAY,
                              size: smallSize,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SizedBox(width: 5.0),
              Container(
                  width: Get.width * 0.22,
                  height: Get.height,
                  decoration: BoxDecoration(
                      color: GREEN1, borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                      onTap: () {
                        //Get.to(EditStaffPage(), arguments: data.id!);
                      },
                      child: Center(
                        child: SvgPicture.asset(IC_EDIT_ADDRESS,
                            height: 30, width: 30),
                      ))),
              Spacer(),
              Container(
                  width: Get.width * 0.22,
                  height: Get.height,
                  decoration: BoxDecoration(
                      color: MAIN_DELETE_ADDRESS,
                      borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    onTap: () {
                      controller.onDeleteStaff(data.id!);
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        IC_DELETE_ADDRESS,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
