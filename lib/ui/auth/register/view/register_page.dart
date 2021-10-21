import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
        builder: (value) => InitialWidget(
          child: Container(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageCustomized(
                    path: viet_trung_mobile_logo,
                    height: 150,
                    width: 150,
                  ),
                  TextCustomized(
                    text: 'Let\'s Get Started',
                    font: SanFranciscoText,
                    size: 16,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  TextCustomized(
                    text: 'Tạo một tài khoản mới ',
                    font: SanFranciscoText,
                    size: 16,
                    color: BLACK,
                    weight: FontWeight.normal,
                  ),
                  SizedBox(height: 16),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Tên đăng nhập",
                        textController: controller.usernameController,
                        path: icon_user,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isUserNameValid == false
                            ? TextCustomized(
                          text: controller.userNameError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Email",
                        textController: controller.emailController,
                        path: icon_email,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isEmailValid == false
                            ? TextCustomized(
                          text: controller.emailError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Họ và tên",
                        textController: controller.nameController,
                        path: icon_user,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isNameValid == false
                            ? TextCustomized(
                          text: controller.nameError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Số điện thoại",
                        textController: controller.phoneNumberController,
                        path: icon_phone,
                        textInputType: TextInputType.phone,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isPhoneNumberValid == false
                            ? TextCustomized(
                          text: controller.phoneNumberError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Mật khẩu",
                        textController: controller.passwordController,
                        path: icon_password,
                        isObscured: true,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isPasswordValid == false
                            ? TextCustomized(
                          text: controller.passwordError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldCustomized(
                        hint: "Xác nhận lại mật khẩu",
                        textController: controller.confirmPassController,
                        path: icon_password,
                        isObscured: true,
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isConfirmPassValid == false
                            ? TextCustomized(
                          text: controller.confirmPassError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         width: Get.width,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(width: 1, color: greyColor),
                  //             borderRadius: BorderRadius.circular(10)
                  //         ) ,
                  //         child:DropdownButtonHideUnderline(
                  //           child: ButtonTheme(
                  //             alignedDropdown: true,
                  //             child: DropdownButton(
                  //               items: [
                  //                 DropdownMenuItem<String>(
                  //                   value: "1",
                  //                   child: Container(
                  //                     width: Get.width,
                  //                     decoration: BoxDecoration(
                  //                       border: Border(
                  //                         bottom: BorderSide( //                   <--- left side
                  //                           color: TEXT_GREY_IN_CART,
                  //                           width: 0.5,
                  //                         ),
                  //                       ),
                  //                     ) ,
                  //                     child: Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         TextCustomized(text: "Kho Đà Nẵng"),
                  //                         SizedBox(height: 10,)
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 DropdownMenuItem<String>(
                  //                   value: "2",
                  //                   child: Container(
                  //                     width: Get.width,
                  //                     decoration: BoxDecoration(
                  //                       border: Border(
                  //                         bottom: BorderSide( //                   <--- left side
                  //                           color: TEXT_GREY_IN_CART,
                  //                           width: 0.5,
                  //                         ),
                  //                       ),
                  //                     ) ,
                  //                     child: Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         TextCustomized(text: "Kho Hồ Chí Minh"),
                  //                         SizedBox(height: 10,)
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 DropdownMenuItem<String>(
                  //                   value: "3",
                  //                   child: Container(
                  //                     child: TextCustomized(text: "Kho Hà Nội"),
                  //                   ),
                  //                 ),
                  //               ],
                  //               onChanged: (value){},
                  //               hint: Container(child:
                  //               Row(mainAxisAlignment: MainAxisAlignment.start,
                  //                 children: [
                  //                   SizedBox(width: 2),
                  //                   SvgPicture.asset(IC_WAREHOUSE,),
                  //                   SizedBox(width: 16,),
                  //                   SvgPicture.asset(IC_LINE,),
                  //                   SizedBox(width: 16,),
                  //                   Text("Chọn kho hàng"),
                  //                 ],
                  //               )),
                  //               isExpanded: true,
                  //             )
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonCustomized(
                      "Đăng ký",
                      onTap: () {
                        controller.onRegister();
                      } ,
                      backgroundColor: GRAY,
                    ),
                  ),
                  SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        )
    );
  }
}