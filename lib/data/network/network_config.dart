import 'dart:io';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:get_storage/get_storage.dart';

class NetworkConfig {

   //static const String URL_SERVER = "https://viet_trung_mobile.tekup.vn/api/v2";
  static const String URL_SERVER = "http://backend-viettrung.tekup.vn/api/v1";
  //static const String URL_SERVER_BASE_CDN = "https://viet_trung_mobile.tekup.vn";
  static const String URL_SERVER_BASE_CDN = "http://backend-viettrung.tekup.vn";

  static Map<String, String> onBuildHeader({bool? isMultipart})  {
    String? token = GetStorage().read(KEY_TOKEN);
    final header = {
      HttpHeaders.contentTypeHeader: isMultipart != null && isMultipart
          ? 'multipart/form-data'
          : "application/json",
      HttpHeaders.authorizationHeader: (token != null) ? "Bearer $token" : ""
    };

    return header;
  }

  //auth
  static const String LOGIN = URL_SERVER + "/auth/login";
  static const String FORGOT_PASSWORD = URL_SERVER + "/auth/forgot";
  static const String REGISTER = URL_SERVER + "/auth/signup";
  static const String ADDRESSES = URL_SERVER + "/addresses/all";
  static const String DELETE_ADDRESS = URL_SERVER + "/addresses/delete";
  static const String CITY_ADDRESS = URL_SERVER + "/city";
  static const String DISTRICT_ADDRESS = URL_SERVER + "/district";
  static const String WARDS_ADDRESS = URL_SERVER + "/wards";
  static const String REGISTER_ADDRESS = URL_SERVER + "/addresses/make";
  static const String UPDATE_ADDRESS = URL_SERVER + "/addresses/update";
  static const String LOGOUT = URL_SERVER + "/auth/logout";
  static const String REGISTER_STEP_1 = URL_SERVER + "/auth/signup-step1";
  static const String REGISTER_STEP_2 = URL_SERVER + "/auth/signup-step2";

  //cart
  static const String CARTS = URL_SERVER + "/carts";
  static const String CARTS_UPDATE_QUANTITY = URL_SERVER + "/carts/update/change-quantity";
  static const String CARTS_TOGGLE_FAVORITE = URL_SERVER + "/carts/favorite";
  static const String CARTS_DELETE_SHOP = URL_SERVER + "/carts/delete-shop";
  static const String CARTS_ADD_TO_CART = URL_SERVER + "/shoppingcart/add_to_cart";

  // Service setting
  static const String SERVICE_FEE = URL_SERVER + "/service-fee/list";

  // Order
  static const String ORDER_CREATE = URL_SERVER + "/order";
  static const String ORDER_LIST = URL_SERVER + "/order/list";
  static const String ORDER_LISTS = URL_SERVER + "/order";
  static const String ORDER_LIST_PARCEL = URL_SERVER + "/order/package";
  static const String ORDER_LIST_HISTORY = URL_SERVER + "/order/transaction-history";
  static const String ORDER_PAYMENT = URL_SERVER + "/payment/order";
  static const String ORDER_PAYMENT_ALL = URL_SERVER + "/payment/orders";
  static const String ORDER_JOURNEYS = URL_SERVER + "/order/status-history";
  static const String ORDER_LIST_REQUEST_DELIVERY = URL_SERVER + "/order-package/request-delivery";
  static const String ORDER_BUYBACK = URL_SERVER + "/order/buyback";
  static const String ORDER_SAVE_LINK= URL_SERVER + "/order/save-link";
  static const String ORDER_LIST_SHOP = URL_SERVER + "/list-shop-domain";
  static const String ORDER_LIST_STATUS = URL_SERVER + "/order/list-status-order";
  static const String WAREHOUSE = URL_SERVER + "/order/list-storage-receive";
  static const String PACKING_ORDER = URL_SERVER + "/order/change-type";

  //Wallet
  static const String WALLET_INFO = URL_SERVER + "/wallet/check-wallets";
  static const String WALLET_WITHDRAWAL = URL_SERVER + "/wallet/withdrawal";
  static const String WALLET_DEPOSIT = URL_SERVER + "/wallet/recharge";
  static const String WALLET_TRANSACTION = URL_SERVER + "/transactions";
  static const String WALLET_TRANSACTION_TYPE = URL_SERVER + "/transaction-type";
  static const String WALLET_LIST_TRANSACTION_TYPE = URL_SERVER + "/transactions/transaction-type";
  static const String WALLET_TRANSACTION_STATUS = URL_SERVER + "/transactions/transaction-status";

  //Profile
  static const String PROFILE_INFO = URL_SERVER + "/auth/me";
  static const String PROFILE_EDIT = URL_SERVER + "/users/update";
  static const String PROFILE_UPLOAD_IMAGE = URL_SERVER + "/users/upload-avatar";
  static const String UPLOAD_IMAGE = URL_SERVER + "/uploads/image";
  static const String PROFILE_CHANGE_PASSWORD = URL_SERVER + "/users/change-password";
  static const String PROFILE_BANK_LIST = URL_SERVER + "/bank/linked-bank";
  static const String PROFILE_BANK_LIST_VN = URL_SERVER + "/list-bank";
  static const String PROFILE_DELETE_BANK_LINKED = URL_SERVER + "/bank/linked-bank/delete";
  static const String PROFILE_ADD_BANK_LINKED = URL_SERVER + "/bank/linked-bank/create";
  
  //Complaint
  static const String COMPLAINT_LIST = URL_SERVER + "/contacts";
  static const String COMPLAINT_LIST_ANOTHER_REASON = URL_SERVER + "/contacts/list-another-reason";
  static const String COMPLAINT_LIST_REASON = URL_SERVER + "/contacts/list-reason";
  static const String COMPLAINT_LIST_STATUS = URL_SERVER + "/contacts/list-status";


  //PackageDelivery
  static const String DELIVERY_CREATE = URL_SERVER + "/delivery/create";
  static const String DELIVERY_FORM = URL_SERVER + "/delivery/forms";
  static const String DELIVERY_FEE = URL_SERVER + "/delivery/transport-fee";
  static const String DELIVERY_LIST = URL_SERVER + "/order-package";
  static const String DELIVERY_LIST_STATUS = URL_SERVER + "/delivery/list-status";
  static const String COMPLAINT_CREATE = URL_SERVER + "/contacts/create";
  static const String UPDATE_IMAGE_COMPLAINT_CREATE = URL_SERVER + "/contacts";
  static const String PARCEL_LIST_DELIVERY_NOTE = URL_SERVER + "/delivery/list";
  static const String PARCEL_LIST_DELIVERY_STORE = URL_SERVER + "/delivery/store";
  static const String PACKAGE_LIST_STATUS = URL_SERVER + "/order-package/list-status";



  //Consignment
  static const String CONSIGNMENT_LIST = URL_SERVER + "/order-checkins/";
  static const String CONSIGNMENT_CREATE = URL_SERVER + "/order-checkins/create";
  static const String CONSIGNMENT_LIST_STATUS = URL_SERVER + "/order-checkins/list-status-code";


  //Favorite
  static const String FAVORITE_LIST = URL_SERVER + "/product/list-favorite";
  static const String UN_FAVORITE_LIST = URL_SERVER + "/product/unfavorite";

  //Discount_code
  static const String DISCOUNT_CODE = URL_SERVER + "/discount-code";

  //Level
  static const String ACCOUNT_LEVEL = URL_SERVER + "/users/level";

  //Home
  static const String HOME = URL_SERVER + "/dashboard";

  //FAQ
  static const String FAQ_LIST = URL_SERVER + "/f-a-q";

  //Notification
  static const String NOTIFICATION_LIST = URL_SERVER + "/notifications/list";
  static const String NOTIFICATION_UNREAD_COUNT = URL_SERVER + "/notifications/unread";
  static const String NOTIFICATION_READ_ALL = URL_SERVER + "/notifications/read-all";
  static const String NOTIFICATION_READ_ONE = URL_SERVER + "/notifications/read-detail";

  //ExchangeRate
  static const String EXCHANGE_RATE = URL_SERVER + "/exchange-rate";

  static const String UPDATE_TOKEN = URL_SERVER + "/users/device-token";

  //Chat
  static const String Create_Conversation = URL_SERVER + "/admin/chat/create-conversation";
  static const String Get_Conversation = URL_SERVER + "/admin/chat/get-conversation";
  static const String SEND_MESSEGER = URL_SERVER + "/admin/chat/send-message";

  //Bag
  static const String BAG_LIST_STATUS = URL_SERVER + "/admin/bag/list-status";
  static const String BAG_LIST_WAREHOUSE_BACK = URL_SERVER + "/admin/bag/list-warehouse-back";

  //Setting
  static const String SETTING_PACKING_FORM = URL_SERVER + "/admin/setting/packing-form/list";
  static const String SETTING_TRANSPORT_FORM = URL_SERVER + "/admin/setting/transport-form/list";

  //Find_User
  static const String FIND_USER = URL_SERVER + "/admin/order/find-user";
  //EnterWarehouse
  static const String ENTER_WAREHOUSE = URL_SERVER + "/admin/order/import-storage";
  //Ramdom Bill Order
  static const String RAMDOM_BILL_ORDER = URL_SERVER + "/admin/order/random-bill-code";
}
