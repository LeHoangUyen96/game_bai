import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/bag_details_controller.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class BagDeatailsPage extends GetView<BagDetailsController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<BagDetailsController>(
      init: BagDetailsController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: controller.bagDetailsResponse != null
            ? SingleChildScrollView(
                child: buildBody(),
                physics: BouncingScrollPhysics(),
              )
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
          text: MANAGE_PACKAGE_DETAILS_BAG,
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
      ),
    );
  }

  Widget buildBody() {
    final Color color;
    color = controller.ColorStatusName(controller
        .bagDetailsResponse!.data!.parent_pack_status_name
        .toString());
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: WHITE,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: BT_GRAY)),
                ),
                child: TextCustomized(
                  text: MANAGE_PACKAGE_INFO_BAG,
                  font: SanFranciscoUIText,
                  size: normalSize,
                  weight: FontWeight.w600,
                  color: BLACK_1,
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: BT_GRAY))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextCustomized(
                            text: controller.bagDetailsResponse!.data!.code
                                .toString(),
                            font: SanFranciscoText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                            size: normalSize,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: TextCustomized(
                              text: controller.bagDetailsResponse!.data!
                                  .parent_pack_status_name
                                  .toString(),
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextCustomized(
                      text: controller.bagDetailsResponse!.data!.created_at
                          .toString(),
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_TYPE_BAG,
                          font: SanFranciscoUIText,
                          weight: FontWeight.w500,
                          size: normalSize,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller
                              .bagDetailsResponse!.data!.parent_pack_name
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_NUMBER_PACKAGE,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller.bagDetailsResponse!.data!.item_number
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_WARE_HOUSE_MOVE_BACK,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller
                              .bagDetailsResponse!.data!.warehouse_back_name
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_TRANSFER_FORM,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller
                              .bagDetailsResponse!.data!.transport_form
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: RED_1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_NUMBER_OF_CUSTOMER,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller
                              .bagDetailsResponse!.data!.customer_number
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_UPDATE_DAY,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: controller.bagDetailsResponse!.data!.updated_at
                              .toString(),
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                    ],
                  ),
                  SizedBox(height: 5,),     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        text: MANAGE_PACKAGE_TOTAL_COD,
                        font: SanFranciscoUIText,
                        size: normalSize,
                        weight: FontWeight.w500,
                        color: BLACK_1,
                        ),
                        TextCustomized(
                        text: "¥" +  controller.bagDetailsResponse!.data!.total_cod.toString(),
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                        ),
                    ],
                  ),
                  SizedBox(height: 5,),     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        text: DELIVERY_NOTE_WEIGHT,
                        font: SanFranciscoUIText,
                        size: normalSize,
                        weight: FontWeight.w500,
                        color: BLACK_1,
                        ),
                        TextCustomized(
                        text: controller.bagDetailsResponse!.data!.weight.toString(),
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                        ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  ],
                ),
              ),
              SizedBox(height: 15),
              controller.bagDetailsResponse!.data!.parent_pack_status_code == "warehouse_china"?
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    controller.onAddProduct();
                  },
                  child: Wrap(
                    spacing: 5.0,
                    children: [
                      SvgPicture.asset(
                        IC_ADD_CIRCLE,
                        color: GRAY8,
                      ),
                      TextCustomized(
                        text: MANAGE_PACKAGE_MOVE_GOOD,
                        size: normalSize,
                        color: GRAY8,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ) : Container(),
              ]
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            color: WHITE,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: STATUS_TRANFORM,
                  font: SanFranciscoUIText,
                  size: normalSize,
                  weight: FontWeight.w600,
                  color: BLACK_1,
                ),
                SizedBox(height: 15),
                Container(
                  child: DropdownSearch<DataListStatusBagResponse>(
                    mode: Mode.MENU,
                    maxHeight: 120,
                    popupSafeArea: PopupSafeArea(),
                    onFind: (String? filter) => controller.getDataStatusBag(),
                    hint: controller
                        .bagDetailsResponse!.data!.parent_pack_status_name
                        .toString(),
                    onChanged: (data) {
                      print('$data');
                      controller.item_code = data!.status_code!;
                      controller.onUpdateStatusBag();
                      controller.update();
                    },
                    itemAsString: (DataListStatusBagResponse u) =>
                        u.status_name!,
                    dropdownButtonBuilder: (_) => Container(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        IC_ARROW_DOWN,
                        color: GRAY,
                      ),
                    ),
                    popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    popupItemBuilder: _customDropdownBagStatus,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: WHITE,
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: BT_GRAY),
              )),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                              text: MANAGE_PACKAGE_LIST_BILL,
                              font: SanFranciscoUIText,
                              size: normalSize,
                              weight: FontWeight.w600,
                              color: BLACK_1,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.onChange(1);
                                },
                                child: controller.changeBill == true
                                    ? Icon(Icons.keyboard_arrow_up)
                                    : Icon(Icons.keyboard_arrow_down)),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                controller.changeBill == true
                    ? Container(
                      color: WHITE,
                      child: ListView.separated(
                        itemCount: controller.bagDetailsResponse!.data!.orders!.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return _buildListBill(controller.bagDetailsResponse!.data!.orders![index]);
                        }
                        )
                    )
                    : Container(),
              ]),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: WHITE,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextCustomized(
                    text: "Hành trình đơn hàng",
                    size: 16,
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: BLACK,
                  ),
                  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: WHITE 
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                              text: ORDER_LIST_JOURNEY,
                              size: normalSize,
                              weight: FontWeight.w600,
                              color: BLACK_1,
                              ),
                              SizedBox(height: 20,),
                            ListView.builder(
                              itemCount: controller.bagDetailsResponse!.data!.packing_journey!.length,
                              shrinkWrap: true,
                              reverse: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, index){
                                return _buildListJourney(index);
                              }
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          itemCount: controller.bagDetailsResponse!.data!
                              .packing_journey!.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return _buildListJourney(index);
                          }),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 10,bottom: 10),
                //   child: Column(
                //     children: [
                //       TimelineTile(
                //         isFirst: true,
                //         alignment: TimelineAlign.manual,
                //         lineXY: 0.4,
                //         indicatorStyle: IndicatorStyle(
                //           color: Colors.green,
                //           height: 10,
                //           width: 10,
                //           drawGap: false,
                //           indicatorXY: 0,
                //         ),
                //         beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 2) ,
                //         endChild: Container(
                //           padding: EdgeInsets.only(left: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               TextCustomized(
                //                 text: "Kho Trung Quốc, đang đóng hàng về",
                //                 font: SanFranciscoTextLight,
                //                 weight: FontWeight.w400,
                //                 color: Colors.green,
                //               ),
                //               SizedBox(height: 50,),
                //             ],
                //           ),
                //         ),
                //         startChild: Container(
                //           child: Container(
                //             alignment: const Alignment(0.7, -0.800),
                //             child: TextCustomized(
                //               text: "11/11/2021",
                //               font: SanFranciscoTextLight,
                //               weight: FontWeight.w400,
                //               color: MAIN_GRAY,
                //             ),
                //           ),
                //         ),
                //       ),
                //       TimelineTile(
                //         alignment: TimelineAlign.manual,
                //         lineXY: 0.4,
                //         indicatorStyle: IndicatorStyle(
                //           color: Colors.green,
                //           height: 10,
                //           width: 10,
                //           drawGap: false,
                //           indicatorXY: 0,
                //         ),
                //         beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 2) ,
                //         endChild: Container(
                //           padding: EdgeInsets.only(left: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               TextCustomized(
                //                 text: "Kho Trung Quốc ",
                //                 font: SanFranciscoTextLight,
                //                 weight: FontWeight.w400,
                //                 color: Colors.green,
                //               ),
                //               SizedBox(height: 50,),
                //             ],
                //           ),
                //         ),
                //         startChild: Container(
                //           child: Container(
                //             alignment: const Alignment(0.7, -0.800),
                //             child: TextCustomized(
                //               text: "11/11/2021",
                //               font: SanFranciscoTextLight,
                //               weight: FontWeight.w400,
                //               color: MAIN_GRAY,
                //             ),
                //           ),
                //         ),
                //       ),
                //        TimelineTile(
                //         isLast: true,
                //         alignment: TimelineAlign.manual,
                //         lineXY: 0.4,
                //         indicatorStyle: IndicatorStyle(
                //           color: Colors.green,
                //           height: 10,
                //           width: 10,
                //           drawGap: false,
                //           indicatorXY: 0,
                //         ),
                //         beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 2) ,
                //         endChild: Container(
                //           padding: EdgeInsets.only(left: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               TextCustomized(
                //                 text: "Kho Trung Quốc, đang đóng hàng về",
                //                 font: SanFranciscoTextLight,
                //                 weight: FontWeight.w400,
                //                 color: Colors.green,
                //               ),
                //               SizedBox(height: 50,),
                //             ],
                //           ),
                //         ),
                //         startChild: Container(
                //           child: Container(
                //             alignment: const Alignment(0.7, -0.800),
                //             child: TextCustomized(
                //               text: "11/11/2021",
                //               font: SanFranciscoTextLight,
                //               weight: FontWeight.w400,
                //               color: MAIN_GRAY,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildListBill(DataListOrderAddBagResponse data){
    return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             Container(
               padding: EdgeInsets.only(top: 5,bottom: 10),
               decoration: BoxDecoration(
                 border: Border(
                   top: BorderSide(color: BT_GRAY),
                   //bottom: BorderSide(color: BT_GRAY)
                 )
               ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[ 
              TextCustomized(
                text: data.bill_code.toString(),
                font: SanFranciscoText,
                weight: FontWeight.w700,
                color: MAIN_BLACK,
                size: normalSize,
                ),
                controller.bagDetailsResponse!.data!.parent_pack_status_code == "warehouse_china"?
                InkWell(
                      onTap: (){
                        controller.onDelPackage(data.id!);
                      },
                      child: TextCustomized(
                      text: delete,
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: RED_1,
                      ),
                    ): Container(),
              ]
            ),
                   
              SizedBox(height: 5,),     
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: MANAGE_PACKAGE_PACKING_FORM,
                    font: SanFranciscoUIText,
                    weight: FontWeight.w500,
                    size: normalSize,
                    color: BLACK_1,
                    ),
                    TextCustomized(
                    text: data.packing_form.toString(),
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: ORDER_LIST_PARCELS,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                    ),
                    TextCustomized(
                    text: controller.onGetNumberPackageInBag(data),
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),   
              SizedBox(height: 5,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextCustomized(
              //       text: BAG_WEIGHT,
              //       font: SanFranciscoUIText,
              //       size: normalSize,
              //       weight: FontWeight.w500,
              //       color: BLACK_1,
              //       ),
              //       TextCustomized(
              //       text: data.surcharge.toString(),
              //       font: SanFranciscoText,
              //       weight: FontWeight.w400,
              //       color: BLACK,
              //       ),
              //   ],
              // ),   
              // SizedBox(height: 5,),      
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: ORDER_LIST_COD,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                    ),
                    TextCustomized(
                    text: "¥" + data.transport_fee.toString(),
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: MANAGE_PACKAGE_SURCHARGE,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                    ),
                    TextCustomized(
                    text: data.surcharge.toString(),
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK_1,
                    ),
                ],
              ), 
              SizedBox(height: 5,),     
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextCustomized(
              //       text: DELIVERY_FEE_TRANSACTION,
              //       font: SanFranciscoUIText,
              //       size: normalSize,
              //       weight: FontWeight.w500,
              //       color: BLACK_1,
              //       ),
              //       TextCustomized(
              //       text: ORDER_NULL,
              //       font: SanFranciscoText,
              //       weight: FontWeight.w400,
              //       color: BLACK,
              //       ),
              //   ],
              // ), 
                ]
              ),
            ]),
          )
        ]));
  }

  Widget _customDropdownBagStatus(
      BuildContext context, DataListStatusBagResponse item, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: GRAY, width: 1.0)),
        //borderRadius: BorderRadius.circular(5),
        //color: bdredColor,
      ),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: TextCustomized(
                text: item.status_name?.toString() ?? '',
                font: SanFranciscoUIText,
                weight: FontWeight.w400,
              )),
              //  Flexible(
              //    child: SvgPicture.asset(IC_CHECK1),
              //    )
            ],
          )),
    );
  }

   );
 }
 Widget _buildListJourney(index){
   return Center(
     child: TimelineTile(
               isLast: index == 0,
               isFirst: index == controller.bagDetailsResponse!.data!.packing_journey!.length -1,
               hasIndicator: true,
              axis: TimelineAxis.vertical,
              alignment: TimelineAlign.center,
              lineXY: 0.1,
              indicatorStyle: IndicatorStyle(
                color: TEXT_DATETIME_NT,
                height: 10,
                width: 10,
                drawGap: true,
                indicatorXY: 0.3,
              ),
              beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 1),
              endChild: Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child:  TextCustomized(
                            text: controller.bagDetailsResponse!.data!.packing_journey![index].status_name.toString(),
                            font: SanFranciscoTextLight,
                            size: normalSize,
                            weight: FontWeight.w400,
                            color: COLOR_ORDER_DELIVERY_SUCCESSFULL,
                          ),
              ),
              startChild: Container(
                height: 50,
                padding: EdgeInsets.only(left: 30),
                child: TextCustomized(
                  text: controller.bagDetailsResponse!.data!.packing_journey![index].created_at.toString(),
                  font: SanFranciscoTextLight,
                  size: smallSize,
                  weight: FontWeight.w400,
                  color: TITLE_POPUP,
                  ),
              ),
              
            ),
   );
 }
}