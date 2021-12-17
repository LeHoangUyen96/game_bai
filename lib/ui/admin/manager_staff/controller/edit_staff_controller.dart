import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/detail_staff_response.dart';
import 'package:viet_trung_mobile/data/response/list_role_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class EditStaffController extends GetxController  {
RoleResponse ? roleResponse;
List<DataRole>? mDataRole =[];
RoleAdminRepositories ? roleAdminRepositories;
ManagerStaffRepositories ? managerStaffRepositories;
DetailStaffResponse ? detailStaffResponse;
int? id;
bool isStatus  = true;
int? role_id;
int? status;
  @override
  void onInit() {
    super.onInit();
    roleAdminRepositories = Injector().role;
    managerStaffRepositories = Injector().managerStaff;
    id = Get.arguments;
    print("$id");
    onGetListRole();
    onGetDetailAdmin();
  }
  void onGetDetailAdmin(){
    managerStaffRepositories!.onGetDetailAdmin(id!).then((value) {
      detailStaffResponse = value;
      update();
    }).catchError((onError){
      print("-----------------$onError");
    });
  }
  void onGetStatusStaff (bool value){
    isStatus = value;
    if( isStatus == true){
      status = 1;
    } else { status = 0;}
    onChangeStatusAdmin();
    print("$status");
    update();
  }
  void onChangeStatusAdmin(){
    managerStaffRepositories!.onChangeStatusAdmin(id!, status!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      onGetDetailAdmin();
      update();
    }).catchError((onError){
      //Get.defaultDialog(title: onError.toString(), middleText: '');
    });
  }
  Future<List<DataRole>>  onGetListRole() async{
    roleAdminRepositories!.onGetListRole().then((value) {
      roleResponse = value;
      mDataRole!.addAll(roleResponse!.data!);
      update();
    }).catchError((onError) {
    });
    return mDataRole!;
    
  }
}