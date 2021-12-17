class UpdateFeeWarhouseVN {
  String? surcharge;
  dynamic transportFee;
  List<String>? image;
  dynamic vnFee;
  dynamic weight;
  dynamic volume;

  UpdateFeeWarhouseVN({
    this.transportFee,
    this.surcharge,
    this.image,
    this.vnFee,
    this.weight,
    this.volume,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport_fee'] = this.transportFee;
    data['transport_vn_fee'] = this.vnFee;
    data['weight'] = this.weight;
    data['volume'] = this.volume;
    data['images'] = this.image;
    return data;
  }
}
