class UpdateRoleRequest {
  String? name;
  List<int>? permissions;

  UpdateRoleRequest({
    this.name,
    this.permissions,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['permissions'] = this.permissions;
    return data;
  }
}
