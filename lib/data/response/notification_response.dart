import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class NotificationListResponse{
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
  String? content;
  String? redirect_link;
  String? createTime;
  String? moment;
  String? image;
  int? status;

  NotificationResponse({this.id, this.title, this.content, this.createTime, this.moment, this.redirect_link, this.image,  this.status});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.title = json["title"] != null ? json["title"] : '';
    this.content = json["content"] != null ? json["content"] : '';
    this.redirect_link = json["redirect_link"] != null ? json["redirect_link"] : '';
    this.createTime = json["created_at"] != null ? json["created_at"] : '';
    this.moment = json["moment_string"] != null ? json["moment_string"] : '';
    this.image = json["image"] != null ? json["image"] : '';
    this.status = ParseNumber.parseInt(json['status']);
  }

  // "id": 378,
  // "title": "Thông báo từ Báo đen",
  // "sender": {
  // "id": 63,
  // "name": "Admin Master",
  // "user_no": null,
  // "avatar": "/uploads/avatar/10092021215203_vn.png"
  // },
  // "receiver": {
  // "id": 161,
  // "name": "xsss",
  // "user_no": "2080",
  // "avatar": null
  // },
  // "status": 0,
  // "content": "Đơn hàng mã #KIN1 đã được cập nhật phí vận chuyển TQ - VN - 0",
  // "type": 3,
  // "permission_id": null,
  // "redirect_link": "order-detail/264",
  // "user_id": null,
  // "created_at": "03:52 21/09/2021",
  // "updated_at": "03:52 21/09/2021",
  // "moment_string": " 1 ngày trước",
  // "click_action": "FLUTTER_NOTIFICATION_CLICK",
  // "image": "https://gd2.alicdn.com/imgextra/i1/2206604154499/O1CN0104lByK1j6aZzVFcdO_!!2206604154499.jpg"


}

class DataSender{
  int? id;
  String? name;
  dynamic user_no;
  String? avatar;
  // "id": 63,
  // "name": "Admin Master",
  // "user_no": null,
  // "avatar": "/uploads/avatar/10092021215203_vn.png"
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