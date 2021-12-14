import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class NotificationAdminResponse {
  List<DataNotificationAdminResponse>? data;

  NotificationAdminResponse({this.data});

  NotificationAdminResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null
        ? <DataNotificationAdminResponse>[]
        : json['data']
            .map<DataNotificationAdminResponse>(
                (e) => DataNotificationAdminResponse.fromJson(e))
            .toList();
  }
}

class DataNotificationAdminResponse {
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

  DataNotificationAdminResponse({
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

  DataNotificationAdminResponse.fromJson(Map<String, dynamic> json) {
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
