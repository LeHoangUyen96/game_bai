class UpdateStatusBagRequest {
  String? parent_pack_status_code;

  UpdateStatusBagRequest(
      {this.parent_pack_status_code
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_pack_status_code'] = this.parent_pack_status_code;

    return data;
  }
}