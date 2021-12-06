class EnterWareHouseRequest {
  int? user_id;
  String? phone;
  String? bill_code;
  String? item;
  double? transport_fee;
  int? number_package;
  String? images;
  int? is_prohibited_item;

  EnterWareHouseRequest(
      {this.user_id,
        this.phone,
        this.bill_code,
        this.item,
        this.transport_fee,
        this.number_package,
        this.images,
        this.is_prohibited_item,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['phone'] = this.phone;
    data['bill_code'] = this.bill_code;
    data['item'] = this.item;
    data['transport_fee'] = this.transport_fee;
    data['number_package'] = this.number_package;
    data['images'] = this.images;
    data['is_prohibited_item'] = this.is_prohibited_item;
    return data;
  }
}