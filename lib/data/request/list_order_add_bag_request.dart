class ListOrderAddBagRequest {
  String? warehouse_back_code;
  int? user_id;
  int? transport_form_id;
  int? packing_form_id;
  String? bill_code;
  ListOrderAddBagRequest(
      { 
        this.warehouse_back_code,
        this.user_id,
        this.transport_form_id,
        this.bill_code,
        this.packing_form_id,
      });

 ListOrderAddBagRequest.empty(){
  this.warehouse_back_code = '';
  this.transport_form_id = -1;
  this.packing_form_id = -1;
  this.user_id = -1;
  this.bill_code = '';
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouse_back_code'] = this.warehouse_back_code;
    data['user_id'] = this.user_id;
    data['transport_form_id'] = this.transport_form_id;
    data['bill_code'] = this.bill_code;
    data['packing_form_id'] = this.packing_form_id;
    return data;
  }
}