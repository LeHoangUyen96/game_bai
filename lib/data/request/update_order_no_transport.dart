class UpdateOrderNoTransport {
  String? surcharge;
  dynamic transportFee;
  int? type;
  List<String>? image;
  String? note;

  UpdateOrderNoTransport({
    this.type,
    this.transportFee,
    this.surcharge,
    this.image,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport_fee'] = this.transportFee;
    data['type'] = this.type;
    data['surcharge'] = this.surcharge;
    data['images'] = this.image;
    data['note'] = this.note;
    return data;
  }
}
