class RoleDetailResponse {
  DataRoleDetail? data;

  RoleDetailResponse({this.data});

  RoleDetailResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataRoleDetail.fromJson(json['data']) : null;
  }
}

class DataRoleDetail {
  int? id;
  String? name;
  List<Permissions>? permissions;

  DataRoleDetail({
    this.id,
    this.name,
    this.permissions,
  });

  DataRoleDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['permissions'] = this.permissions;
    return data;
  }
}

class Permissions {
  int? id;
  String? name;
  bool? checked;

  Permissions({
    this.id,
    this.name,
    this.checked,
  });

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    checked = json['checked'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['checked'] = this.checked;
    return data;
  }
}
