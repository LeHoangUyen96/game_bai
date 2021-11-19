class PackingOrderRequest {
  List<int>? order_ids;
  String? note;
  String? delivery_form_code;
  int? address_id;
  String? storage_receive_code;


  PackingOrderRequest(
      {this.order_ids,
        this.note,
        this.delivery_form_code,
        this.address_id,
        this.storage_receive_code
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_ids'] = this.order_ids;
    data['note'] = this.note;
    data['delivery_form_code'] = this.delivery_form_code;
    data['address_id'] = this.address_id;
    data['storage_receive_code'] = this.storage_receive_code;

    return data;
  }
}