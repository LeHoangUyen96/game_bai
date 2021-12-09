class RoleResponse {
  List<DataRole>? data;

  RoleResponse({this.data});

  RoleResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataRole>[];
      json['data'].forEach((v) {
        data!.add(DataRole.fromJson(v));
      });
    }
  }
}

class DataRole {
  int? id;
  String? name;
  String? description;

  DataRole({
    this.id,
    this.name,
    this.description,
  });

  DataRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
