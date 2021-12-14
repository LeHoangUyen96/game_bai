import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class NotificationListResponse {
  List<NotificationResponse>? data;
  DataPaginateResponse? paginate;

  NotificationListResponse({this.data, this.paginate});

  NotificationListResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null
        ? <NotificationListResponse>[]
        : json['data']
            .map<NotificationResponse>((e) => NotificationResponse.fromJson(e))
            .toList();
    this.paginate = json['paginate'] != null
        ? DataPaginateResponse.fromJson(json['paginate'])
        : null;
  }
}

class NotificationResponse {
  int? id;
  String? title;
  DataSender? sender;
  DataReceiver? receiver;
  String? content;
  int? status;
  int? type;
  int? permission_id;
  int? relation_id;
  String? created_at;
  String? updated_at;
  String? moment_string;
  String? click_action;
  String? image;

  NotificationResponse({
    this.id,
    this.title,
    this.content,
    this.sender,
    this.receiver,
    this.permission_id,
    this.relation_id,
    this.image,
    this.status,
    this.click_action,
    this.created_at,
    this.moment_string,
    this.type,
    this.updated_at,
  });

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.title = json["title"] != null ? json["title"] : '';
    this.content = json["content"] != null ? json["content"] : '';
    this.sender = json["sender"] != null
        ? DataSender.fromJson(json["sender"])
        : DataSender.empty();
    this.receiver = json["receiver"] != null
        ? DataReceiver.fromJson(json["receiver"])
        : DataReceiver.empty();
    this.status = ParseNumber.parseInt(json['status']);
    this.content = json["content"] != null ? json["content"] : '';
    this.type = ParseNumber.parseInt(json['type']);
    this.permission_id = ParseNumber.parseInt(json['permission_id']);
    this.relation_id = ParseNumber.parseInt(json['relation_id']);
    this.created_at = json["created_at"] != null ? json["created_at"] : '';
    this.updated_at = json["updated_at"] != null ? json["updated_at"] : '';
    this.moment_string =
        json["moment_string"] != null ? json["moment_string"] : '';
    this.click_action =
        json["click_action"] != null ? json["click_action"] : '';
    this.image = json["image"] != null ? json["image"] : '';
  }
}

class DataSender {
  int? id;
  String? name;
  String? user_code;
  String? avatar;
  DataSender({
    this.id,
    this.name,
    this.user_code,
    this.avatar,
  });

  DataSender.empty() {
    this.id = -1;
    this.name = '';
    this.user_code = '';
    this.avatar = '';
  }

  DataSender.fromJson(Map<String, dynamic> json) {
    print(' DataSender.fromJson ${json}');
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json["name"] != null ? json["name"] : '';
    this.user_code = json["user_code"] != null ? json["user_code"] : '';
    this.avatar = json["avatar"] != null ? json["avatar"] : '';
  }
}

class DataReceiver {
  int? id;
  String? name;
  String? user_code;
  String? avatar;
  DataReceiver({
    this.id,
    this.name,
    this.user_code,
    this.avatar,
  });

  DataReceiver.empty() {
    this.id = -1;
    this.name = '';
    this.user_code = '';
    this.avatar = '';
  }

  DataReceiver.fromJson(Map<String, dynamic> json) {
    print(' DataReceiver.fromJson ${json}');
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json["name"] != null ? json["name"] : '';
    this.user_code = json["user_code"] != null ? json["user_code"] : '';
    this.avatar = json["avatar"] != null ? json["avatar"] : '';
  }
}

class DataPaginateResponse {
  int? total;
  int? per_page;
  int? current_page;
  int? last_page;
  int? next;
  int? prev;

  DataPaginateResponse({
    this.total,
    this.per_page,
    this.current_page,
    this.last_page,
    this.next,
    this.prev,
  });

  DataPaginateResponse.fromJson(Map<String, dynamic> json) {
    print('DataOrderResponse.fromJson ${json}');
    this.total = json["total"] != null
        ? (json["total"] is int ? json["total"] : int.parse(json["total"]))
        : -1;
    this.per_page = json["per_page"] != null
        ? (json["per_page"] is int
            ? json["per_page"]
            : int.parse(json["per_page"]))
        : -1;
    this.current_page = json["current_page"] != null
        ? (json["current_page"] is int
            ? json["current_page"]
            : int.parse(json["current_page"]))
        : -1;
    this.last_page = json["last_page"] != null
        ? (json["last_page"] is int
            ? json["last_page"]
            : int.parse(json["last_page"]))
        : -1;
    this.next = json["next"] != null
        ? (json["next"] is int ? json["next"] : int.parse(json["next"]))
        : -1;
    this.prev = json["prev"] != null
        ? (json["prev"] is int ? json["prev"] : int.parse(json["prev"]))
        : -1;
  }
}
