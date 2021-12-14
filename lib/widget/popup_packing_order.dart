import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/models/delivery.dart';
import 'package:viet_trung_mobile_admin/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/packing_order_requets.dart';
import 'package:viet_trung_mobile_admin/data/response/address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class PackingOrderWidget extends StatefulWidget {
  List<int>? listOrderId;
  PackingOrderWidget({required this.listOrderId});

  @override
  State<StatefulWidget> createState() => _packingOrder();
}

class _packingOrder extends State<PackingOrderWidget> {
  TextEditingController noteController = TextEditingController();
  int? checkDelivery = 0;

  List<Delivery> dataDelivery = [
    Delivery(id: 0, name: "Giao hàng tại nhà", code: 'receive_house'),
    Delivery(id: 1, name: "Nhận hàng tại kho", code: 'receive_storage'),
  ];

  Delivery? selectedDelivery;
  OrderRepositories? orderRepositories;
  WarehouseResponse? warehouseResponse;
  DataWarehouse? selectedWarehouse;
  AddressRepository? addressRepository;
  List<DataAddress>? mdatas = [];
  DataAddress? selectedAddress;

  @override
  void initState() {
    super.initState();
    orderRepositories = Injector().order;
    addressRepository = Injector().address;
    onGetAddressAll();
    onGetListWarehouse();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.all(0),
      title: Container(
        height: 48,
        width: Get.width,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9),
            topRight: Radius.circular(9),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: GRAY8,
        ),
        child: Center(
          child: TextCustomized(
            text: "Đóng hàng gửi về",
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: Get.height * 0.55,
          width: Get.width,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TextCustomized(
                //   text: "Bạn đã chọn đóng 2 đơn hàng gửi về!",
                //   color: Colors.black,
                //   size: 16,
                //   weight: FontWeight.w800,
                // ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustomized(
                        text: "Hình thức giao hàng", weight: FontWeight.w700),
                    SizedBox(height: 5),
                    Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: MAIN_LINE),
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: MAIN_LINE,
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      value: selectedDelivery,
                                      items: dataDelivery.map((Delivery value) {
                                        return DropdownMenuItem<Delivery>(
                                          value: value,
                                          child: Container(
                                            child: Text(
                                              value.name.toString(),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (Delivery? value) {
                                        setState(() {
                                          selectedDelivery = value;
                                          checkDelivery = value!.id;
                                        });
                                      },
                                      hint: Text("Chọn hình thức giao hàng"),
                                    )),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 5),
                    // controller.cityValid == false
                    //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                    //     : Container(),
                  ],
                ),
                SizedBox(height: 16),
                checkDelivery == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(
                              text: "Địa chỉ nhận hàng",
                              weight: FontWeight.w700),
                          SizedBox(height: 5),
                          Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1.0, color: MAIN_LINE),
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: MAIN_LINE,
                                            ),
                                            iconSize: 24,
                                            elevation: 16,
                                            isExpanded: true,
                                            value: selectedAddress,
                                            items: mdatas!
                                                .map((DataAddress value) {
                                              return DropdownMenuItem<
                                                  DataAddress>(
                                                value: value,
                                                child: Container(
                                                  child: TextCustomized(
                                                    text: value.full_address
                                                        .toString(),
                                                    maxLine: 3,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (DataAddress? value) {
                                              setState(() {
                                                selectedAddress = value;
                                                // bankId = value!.id;
                                              });
                                            },
                                            hint:
                                                Text("Chọn địa chỉ nhận hàng"),
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 5),
                          // controller.cityValid == false
                          //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                          //     : Container(),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(
                              text: "Kho hàng", weight: FontWeight.w700),
                          SizedBox(height: 5),
                          Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1.0, color: MAIN_LINE),
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: MAIN_LINE,
                                            ),
                                            iconSize: 24,
                                            elevation: 16,
                                            isExpanded: true,
                                            value: selectedWarehouse,
                                            items: warehouseResponse!.data!
                                                .map((DataWarehouse value) {
                                              return DropdownMenuItem<
                                                  DataWarehouse>(
                                                value: value,
                                                child: Container(
                                                  child: Text(
                                                    value.status_name
                                                        .toString(),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (DataWarehouse? value) {
                                              setState(() {
                                                selectedWarehouse = value;
                                                // bankId = value!.id;
                                              });
                                            },
                                            hint: Text("Chọn kho hàng"),
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 5),
                          // controller.cityValid == false
                          //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                          //     : Container(),
                        ],
                      ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustomized(text: "Ghi chú", weight: FontWeight.w700),
                    SizedBox(height: 5),
                    TextFieldCustomized(
                      textController: noteController,
                      hint: "Ghi chú",
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      // textController: controller.usernameController,
                    ),
                    SizedBox(height: 5),
                    // controller.nameValid == false
                    //     ? TextCustomized(text: controller.nameError.toString(), color: Colors.red,)
                    //     : Container(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      ButtonCustomized(
                        BT_CANCEL,
                        textColor: Colors.black,
                        onTap: () {
                          Get.back();
                        },
                        backgroundColor: MAIN_BT_CANCEL_ADDRESS,
                        height: 48,
                        width: Get.width * 0.3,
                      ),
                      Spacer(),
                      ButtonCustomized(
                        BT_REGISTER,
                        onTap: () {
                          onPackingOrder();
                        },
                        backgroundColor: BT_CONFIRM,
                        height: 48,
                        width: Get.width * 0.3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onGetListWarehouse() async {
    orderRepositories!.onGetListWarehouse().then((value) {
      setState(() {
        warehouseResponse = value;
      });
      print(warehouseResponse!.data!.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<void> onGetAddressAll() async {
    addressRepository!.onGetAddress().then((value) {
      setState(() {
        mdatas!.clear();
        mdatas!.addAll(value);
      });
      print(warehouseResponse!.data!.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void onPackingOrder() {
    PackingOrderRequest request;
    if (selectedDelivery!.code! == "receive_storage") {
      request = PackingOrderRequest(
          order_ids: widget.listOrderId,
          note: noteController.text,
          delivery_form_code: selectedDelivery!.code,
          storage_receive_code: selectedWarehouse!.status_code != null
              ? selectedWarehouse!.status_code
              : "");
    } else {
      request = PackingOrderRequest(
          order_ids: widget.listOrderId,
          note: noteController.text,
          delivery_form_code: selectedDelivery!.code,
          address_id: selectedAddress!.id != null ? selectedAddress!.id : null);
    }

    orderRepositories!.onPackingOrder(request).then((value) {
      Get.back(result: true);
      //Get.back();
      Get.snackbar(NOTIFY, "Đóng hàng về thành công.");
    }).catchError((onError) {
      print("Lỗiiiii");
    });
  }
}
