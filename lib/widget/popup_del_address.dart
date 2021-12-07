import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/response/address_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DialogDelAddressCustomized extends StatefulWidget{
   int  ? idAddress;
   DialogDelAddressCustomized({required this.idAddress});
   @override
  State<StatefulWidget> createState() => _popupDelAddress();

}
class _popupDelAddress extends State<DialogDelAddressCustomized> {
  late AddressRepository addressRepository;
  List<DataAddress>? mdatas = [];
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              child:  Column(
                children:[ 
                TextCustomized(
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                      size: normalSize,
                      color: BLACK_1,
                      text: "Xoá địa chỉ",
                      isCenter: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[ 
                  ButtonCustomized(
                    BT_CANCEL,
                    width: 100,
                    backgroundColor: BT_GRAY,
                    textColor: BLACK_1,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  ButtonCustomized(
                    CONTINUE_DELETE_IN_CART,
                    width: 100,
                    backgroundColor: BT_CONFIRM,
                    textColor: WHITE,
                    onTap: (){
                    Get.find<AddressController>().onDeleteAddress(widget.idAddress);
                    Navigator.of(context).pop();
                    },
                  ),
                  ]
                ),
                
                ]
              )
              ),   
          ),
          Positioned(
            child: SvgPicture.asset(IC_CANCEl_CRICLE),
            top: 30,
            ),
          Positioned(
            right: 15,
            top : 15,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(IC_CANCEL),
              ),
          ),  
        ],
      ),
    );
  }
}
 
  