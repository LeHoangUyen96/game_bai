import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/ui/address/controller/add_address_controller.dart';
import 'package:viet_trung_mobile/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile/ui/address/controller/update_address_controller.dart';
import 'package:viet_trung_mobile/ui/admin/dashboard_admin/controller/dashboard_admin_controller.dart';
import 'package:viet_trung_mobile/ui/admin/finding_customers/controller/finding_customer_controller.dart';
import 'package:viet_trung_mobile/ui/admin/general_management/controller/general_management_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/controller/add_image_enter_warehouse_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/controller/enter_warehouse_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/create_bag_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/manager_bag_controller.dart';
import 'package:viet_trung_mobile/ui/auth/login/controller/login_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_1_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_2_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_3_controller.dart';
import 'package:viet_trung_mobile/ui/dashboard_user/controller/dashboard_user_controller.dart';
import 'package:viet_trung_mobile/ui/home/controller/home_controller.dart';
import 'package:viet_trung_mobile/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile/ui/notification/controller/notification_controller.dart';
import 'package:viet_trung_mobile/ui/notification/view/conffirm_order_page.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_inventory_list_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/controller/valid_order_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerless_confirm_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerless_controller.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_edit_controller.dart';
import 'package:viet_trung_mobile/ui/splash/controller/splash_controller.dart';
import 'package:viet_trung_mobile/ui/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp(); //wait for add google-services.json
  runApp(_app());
}

Widget _app() => LayoutBuilder(
      builder: (context, constraints) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: MAIN_COLOR,
              ),
              initialBinding: _Binding(),
            );
          },
        );
      },
    );

class _Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<AddressController>(() => AddressController(), fenix: true);
    Get.lazyPut<AddAddressController>(() => AddAddressController(),
        fenix: true);
    Get.lazyPut<UpdateAddressController>(() => UpdateAddressController(),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<ProfileEditController>(() => ProfileEditController(),
        fenix: true);
    Get.lazyPut<OrderManagementController>(() => OrderManagementController(),
        fenix: true);
    Get.lazyPut<ValidOrderController>(() => ValidOrderController(),
        fenix: true);
    Get.lazyPut<RegisterStepOneController>(() => RegisterStepOneController(),
        fenix: true);
    Get.lazyPut<RegisterStepTwoController>(() => RegisterStepTwoController(),
        fenix: true);
    Get.lazyPut<RegisterStepThreeController>(
        () => RegisterStepThreeController(),
        fenix: true);
    Get.lazyPut<FindingCustomerController>(() => FindingCustomerController(),
        fenix: true);
    Get.lazyPut<EnterWarehouseController>(() => EnterWarehouseController(),
        fenix: true);
    Get.lazyPut<EnterWarehouseUploadImageController>(
        () => EnterWarehouseUploadImageController(),
        fenix: true);
    Get.lazyPut<GenaralManageController>(() => GenaralManageController(),
        fenix: true);
    Get.lazyPut<ManagerBagController>(() => ManagerBagController(),
        fenix: true);
    Get.lazyPut<CreateBagController>(() => CreateBagController(), fenix: true);
    Get.lazyPut<NotificationListController>(() => NotificationListController(),
        fenix: true);
    Get.lazyPut<DashboardUserController>(() => DashboardUserController(),
        fenix: true);
    Get.lazyPut<OrderOwnerlessController>(() => OrderOwnerlessController(),
        fenix: true);
    Get.lazyPut<OrderOwnerlessConfirmController>(
        () => OrderOwnerlessConfirmController(),
        fenix: true);
    Get.lazyPut<ConfirmOrderPage>(() => ConfirmOrderPage(), fenix: true);
    Get.lazyPut<DashboardAdminController>(() => DashboardAdminController(),
        fenix: true);
    Get.lazyPut<ManagerBagController>(() => ManagerBagController(),
        fenix: true);
    Get.lazyPut<OrderInventoryListController>(
        () => OrderInventoryListController(),
        fenix: true);
  }
}
