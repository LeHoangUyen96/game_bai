class ConfirmOrderRequest {
  int? order_id;
  int? type;
  String? note;
  int? address_id;

  ConfirmOrderRequest(
      {this.order_id,
        this.type,
        this.note,
        this.address_id,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.order_id;
    data['type'] = this.type;
    data['note'] = this.note;
    data['address_id'] = this.address_id;
    return data;
  }
}