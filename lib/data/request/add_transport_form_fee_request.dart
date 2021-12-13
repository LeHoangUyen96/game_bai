class AddTransportFormFeeRequest {
  String? transportFormId;
  int? productId;
  String? from;
  String? to;
  String? unit;
  String? transportfeeHN;
  String? transportfeeDN;
  String? transportfeeSG;
  AddTransportFormFeeRequest({
    this.transportFormId,
    this.from,
    this.productId,
    this.to,
    this.transportfeeDN,
    this.transportfeeHN,
    this.transportfeeSG,
    this.unit,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport_form_id'] = this.transportFormId;
    data['product_id'] = this.productId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['unit'] = this.unit;
    data['transport_fee_HN'] = this.transportfeeHN;
    data['transport_fee_DN'] = this.transportfeeDN;
    data['transport_fee_SG'] = this.transportfeeSG;
    return data;
  }
}
