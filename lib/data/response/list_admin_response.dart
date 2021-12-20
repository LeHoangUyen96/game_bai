import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ListAdminResponse {
  List<DataListAdminResponse>? data;
  DataPaginateResponse? paginate;
  ListAdminResponse({this.data, this.paginate});
  ListAdminResponse.fromJson(Map<String, dynamic> json) {
    print('data.fromJson ${json} ');
    this.data = json["data"] == null
        ? <DataListAdminResponse>[]
        : json['data']
            .map<DataListAdminResponse>(
                (e) => DataListAdminResponse.fromJson(e))
            .toList();
    this.paginate = json['paginate'] != null
        ? DataPaginateResponse.fromJson(json['paginate'])
        : null;
  }
}

class DataListAdminResponse {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? avatar;
  String? user_code;
  DataListAdminResponse(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.avatar,
      this.user_code});
  DataListAdminResponse.empty() {
    this.id = -1;
    this.name = '';
    this.phone = '';
    this.email = '';
    this.avatar = '';
    this.user_code = '';
  }
  DataListAdminResponse.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json["name"] != null ? json["name"].toString() : '';
    this.phone = json["phone"] != null ? json["phone"].toString() : '';
    this.email = json["email"] != null ? json["email"].toString() : '';
    this.avatar = json["avatar"] != null ? json["avatar"].toString() : '';
    this.user_code =
        json["user_code"] != null ? json["user_code"].toString() : '';
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
