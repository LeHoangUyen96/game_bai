import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/cart.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/response/address_error_response.dart';
import 'package:viet_trung_mobile/data/response/address_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/service_fee_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/contract/address_contract.dart';

class AddressController extends GetxController implements AddressContract {
  late AddressContract contract;
  late AddressRepository addressRepository;
  List<DataAddress>? mdatas = [];
  bool onChange = false;
  bool check = false;
  int defaultIndexAddress = 0;

  ProfileResponse? profile;
  List<DataServiceFee>? serviceFee;

  List<ShoppingCart>? cart;
  late bool isFromCart;

  @override
  void onInit() {
    super.onInit();
    addressRepository = Injector().address;
    contract = this;
    onGetAddressAll();
  }

  void onGetAddressAll() {
    addressRepository.onGetAddress().then((value) {
      mdatas!.clear();
      mdatas!.addAll(value);
      update();

      // print('AddressController mdatas ${mdatas}');
      if (mdatas!.length > 0) {
        for (int i = 0; i < mdatas!.length; i++) {
          print('AddressController mdatas![i] ${mdatas![i]}');
          if (mdatas![i].defaults == 1) {
            defaultIndexAddress = i;
            break;
          }
        }
      }
      print(mdatas!.length.toString());
      update();
    }).catchError((onError) {
      // Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
      print("Error");
    });
    update();
  }

  void onDeleteAddress(int? index) {
    addressRepository.onDeleteAddress(index!).then((value) {
      Get.snackbar(NOTIFY, value.message.toString());
      onGetAddressAll();
      update();
    }).catchError((onError) {
      Get.snackbar(NOTIFY, onError.toString());
    });
  }

  @override
  void onError(AddressErrorResponse msg) {
    // TODO: implement onError
  }

  @override
  void onSuccess(RegisterAddressResponse response) {
    // TODO: implement onSuccess
  }
}
