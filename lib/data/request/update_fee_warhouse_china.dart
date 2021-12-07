class UpdateFeeWarhouseChina {
  String? surcharge;
  dynamic transportFee;
  int? isProhibitedItem;
  List<String>? image;

  UpdateFeeWarhouseChina({
    this.isProhibitedItem,
    this.transportFee,
    this.surcharge,
    this.image,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport_fee'] = this.transportFee;
    data['is_prohibited_item'] = this.isProhibitedItem;
    data['surcharge'] = this.surcharge;
    data['images'] = this.image;
    return data;
  }
}
