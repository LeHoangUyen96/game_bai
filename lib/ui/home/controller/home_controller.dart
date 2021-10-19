import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/excharge_rate_response.dart';
import 'package:viet_trung_mobile/data/response/home_response.dart';
import 'package:viet_trung_mobile/data/response/profile_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/home/contract/home_contract.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController
    with WidgetsBindingObserver
    implements HomeContract {
  ExchangeRateResponse? exchangeRateResponse;
  DataExchangeRate? mdataExchangeRate;
  TextEditingController searchTextController = TextEditingController();

  ProfileRepositories? profileRepositories;
  ProfileResponse? profile;

  HomeRepositories? homeRepositories;
  HomeResponse? homeResponse;
  DataHome? mdata;
  HomeContract? contract;
  List<DataOrders>? mOrders = [];
  List<DataNotifications>? mNotifications = [];
  Color? color;
  bool haveCopy = false;

  TextEditingController? linkProductcontroller;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
    linkProductcontroller = TextEditingController(
        text: 'https://detail.1688.com/offer/645533509435.html');
    homeRepositories = Injector().home;
    profileRepositories = Injector().profile;
    contract = this;
    onGetProfile();
    onGetHome();
    checkHaveCopy();
    Future.delayed(Duration(milliseconds: 250), (){
      onUpdateDeviceToken();
    });
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  void onGetProfile() {
    // print('Call onGetProfile');
    profileRepositories!.onGetProfile().then((value) {
      // print('Call onGetProfile $value');
      profile = value;
    }).catchError((onError) {
      print('onGetProfile onError $onError');
      // profile = ProfileResponse.fromJson({});
      update();
      // Get.defaultDialog(
      //     title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }

  void onGetHome() {
    homeRepositories!.onGetHome().then((value) {
      homeResponse = value;
      print('${homeResponse!.data!}');
      mOrders!.addAll(homeResponse!.data!.orders!);
      mNotifications!.addAll(homeResponse!.data!.notifications!);
      print('-----------------------');
      update();
      // return contract.onSuccess(value);
    }).catchError((onError) {
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
      print(onError.toString());
    });
    update();
  }

  void onUpdateDeviceToken() {
    String? token = GetStorage().read(DEVICE_TOKEN);
    print('onDeviceToken $token');
    if(token != null) {
      homeRepositories!.onUpdateToken(token).then((value) {

        // return contract.onSuccess(value);
      }).catchError((onError) {

      });
    }
  }

  void onGetExchangeRate() {
    // exchangeRateRepositories!.onGetExchangeRate().then((value) {
    //   exchangeRateResponse = value;
    //   print('${exchangeRateResponse!.data!}');
    //   update();
    // }).catchError((onError) {
    //   Get.defaultDialog(
    //       title: (onError as ErrorResponse).message.toString(), middleText: '');
    //   print(onError.toString());
    // });
    // update();
  }

  void openSearchURL() {
    final String urlProduct = linkProductcontroller!.text;
    if (urlProduct.length == 0) {
      onGetHomeError(ErrorResponse(message: HOME_URL_PRODUCT_EMPTY));
    }
    if (profile == null) return;
    // if (urlProduct.indexOf('tmall.com') > 0) {
    //   Get.to(
    //     () => ProductViewTMallPage(),
    //     arguments: {
    //       'page_url': urlProduct,
    //       'profile': profile!,
    //     },
    //   );
    // } else if (urlProduct.indexOf('item.taobao.com') > 0) {
    //   Get.to(
    //     () => ProductViewTaoBaoPage(),
    //     arguments: {
    //       'page_url': urlProduct,
    //       'profile': profile!,
    //     },
    //   );
    // } else if (urlProduct.indexOf('1688.com') > 0) {
    //   Get.to(
    //     () => ProductViewCN1688Page(),
    //     arguments: {
    //       'page_url': urlProduct,
    //       'profile': profile!,
    //     },
    //   );
    // }
  }

  Color colorButton(String order_status_name) {
    switch (order_status_name) {
      case ORDER_PURCHASING:
        color = COLOR_ORDER_PURCHASING;
        break;
      case ORDER_PENDING_DEPOSIT:
        color = COLOR_ORDER_PENDING_DEPOSIT;
        break;
      case ORDER_LOST:
        color = COLOR_ORDER_LOST;
        break;
      case ORDER_ITEM_RECEIVED:
        color = COLOR_ORDER_ITEM_RECEIVED;
        break;
      case ORDER_DELIVERY_REQUEST:
        color = COLOR_ORDER_DELIVERY_REQUEST;
        break;
      case ORDER_DELIVERING:
        color = COLOR_ORDER_DELIVERING;
        break;
      case ORDER_ORDER_CANCEL:
        color = COLOR_ORDER_ORDER_CANCEL;
        break;
      case ORDER_CHINESE_WAREHOUSE:
        color = COLOR_ORDER_CHINESE_WAREHOUSE;
        break;
      case ORDER_PURCHASED:
        color = COLOR_ORDER_PURCHASED;
        break;
      case ORDER_VIETNAM_WAREHOUSE:
        color = COLOR_ORDER_VIETNAM_WAREHOUSE;
        break;
      case ORDER_WAITING_CONFIRM:
        color = COLOR_ORDER_WAITING_CONFIRM;
        break;
      case ORDER_DELIVERED_BY_SELLER:
        color = COLOR_ORDER_DELIVERED_BY_SELLER;
        break;
      case ORDER_INTERNATIONAL_SHIPPING:
        color = COLOR_ORDER_INTERNATIONAL_SHIPPING;
        break;
      case ORDER_DEPOSIT:
        color = COLOR_ORDER_DEPOSIT;
        break;
      case ORDER_RECEIVED:
        color = COLOR_ORDER_ITEM_RECEIVED;
        break;
    }
    return color!;
  }

  @override
  void onGetHomeError(ErrorResponse msg) {
    Get.snackbar(
      NOTIFY,
      msg.message.toString(),
    );
  }

  @override
  void onGetHomeSuccess(HomeResponse data) {
    // TODO: implement onGetHomeSuccess
  }

  void onSearchClick() {
    Clipboard.getData(Clipboard.kTextPlain).then((value) {
      if (value != null) {
        String? data = value.text;
        if (data != null) {

          String productLink = '';
          RegExp exp = RegExp(r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
          final match = exp.firstMatch(data);

          if(match == null) return;

          productLink = data.substring(match.start, match.end);
          print('Detect link' + productLink);



          // if (productLink.contains('tmall.com') ) {
          //   Get.to(
          //     () => ProductViewTMallPage(),
          //     arguments: {
          //       'page_url': productLink,
          //       'profile': Get.find<CartController>().profile!,
          //     },
          //   );
          // } else if (productLink.contains('item.taobao.com') ||
          //     productLink.contains('intl.taobao.com') || productLink.contains('.tb.cn/')) {
          //   Get.to(
          //     () => ProductViewTaoBaoPage(),
          //     arguments: {
          //       'page_url': productLink,
          //       'profile': Get.find<CartController>().profile!,
          //     },
          //   );
          // } else if (productLink.contains('1688.com')) {
          //   print('data copy $productLink');
          //   Get.to(
          //     () => ProductViewCN1688Page(),
          //     arguments: {
          //       'page_url': productLink,
          //       'profile': Get.find<CartController>().profile!,
          //     },
          //   );
          // } else {
          //   contract!.onGetHomeError(ErrorResponse(message: HOME_URL_PRODUCT_EMPTY));
          // }
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('$state');
    if (state == AppLifecycleState.resumed) {
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        checkHaveCopy();
      });
    }
  }

  void checkHaveCopy() {
    Clipboard.getData(Clipboard.kTextPlain).then((value) {
      if (value != null) {
        String? text = value.text;
        print("DATA FROM COPY + $text");
        if (text != null) {
          if (text.isNotEmpty) {
            if (text.contains('.com') || text.contains('.cn')) {
              haveCopy = true;
            } else {
              haveCopy = false;
            }
          } else {
            haveCopy = false;
          }
        } else {
          haveCopy = false;
        }
      } else {
        print("NULL DATA FROM CLIPBOARD");
      }
      update();
    });
  }
}
