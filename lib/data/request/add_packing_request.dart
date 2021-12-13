class AddPackingRequest {
  String? name;
  int? status;
  String? packingFee;

  AddPackingRequest({
    this.name,
    this.packingFee,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['packing_fee'] = this.packingFee;
    return data;
  }
}
