import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class HomeResponse {
  DataHome? data;

  HomeResponse({this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] != null ? DataHome.fromJson(json['data']) : null;
  }
}

class DataHome {
  double? current_balance;
  int? number_order;
  int? number_product;
  int? complain;
  List<DataOrders>? orders;
  List<DataNotifications>? notifications;

  DataHome({
    this.current_balance,
    this.number_order,
    this.number_product,
    this.complain,
    this.orders,
    this.notifications,
  });

  DataHome.fromJson(Map<String, dynamic> json) {
    this.current_balance = ParseNumber.parseDouble(json['current_balance']);
    this.number_order = ParseNumber.parseInt(json['number_order']);
    this.number_product = ParseNumber.parseInt(json['number_product']);
    this.complain = ParseNumber.parseInt(json['complain']);
    this.orders = json["orders"] == null
        ? <DataOrders>[]
        : json['orders']
            .map<DataOrders>((e) => DataOrders.fromJson(e))
            .toList();
    this.notifications = json["notifications"] == null
        ? <DataNotifications>[]
        : json['notifications']
            .map<DataNotifications>((e) => DataNotifications.fromJson(e))
            .toList();
  }
}

class DataNotifications {
  int? id;
  String? title;
  String? content;
  String? image;
  String? created_at;

  DataNotifications({
    this.id,
    this.title,
    this.content,
    this.image,
    this.created_at,
  });
  DataNotifications.empty() {
    this.id = -1;
    this.title = '';
    this.content = '';
    this.image = '';
    this.created_at = '';
  }

  DataNotifications.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.title = json['title'] != null ? json['title'] : '';
    this.content = json['content'] != null ? json['content'] : '';
    this.image = json['image'] != null ? json['image'] : '';
    this.created_at = json['created_at'] != null ? json['created_at'] : '';
  }
}

class DataOrders {
  int? id;
  String? order_code;
  String? order_status_code;
  String? order_status_name;
  String? updated_at;

  DataOrders({
    this.id,
    this.order_code,
    this.order_status_code,
    this.order_status_name,
    this.updated_at,
  });
  DataOrders.empty() {
    this.id = -1;
    this.order_code = '';
    this.order_status_code = '';
    this.order_status_name = '';
    this.updated_at = '';
  }

  DataOrders.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.order_code = json['order_code'] != null ? json['order_code'] : '';
    this.order_status_code =
        json['order_status_code'] != null ? json['order_status_code'] : '';
    this.order_status_name =
        json['order_status_name'] != null ? json['order_status_name'] : '';
    this.updated_at = json['updated_at'] != null ? json['updated_at'] : '';
  }
}
