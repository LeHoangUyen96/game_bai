class RamdomBillOrderResponse{
  DataRamdomBillOrder? data;
  
  RamdomBillOrderResponse({
    this.data,
    });

  RamdomBillOrderResponse.fromJson(Map<String, dynamic> json){
    this.data = json['data'] != null ? DataRamdomBillOrder.fromJson(json['data']) : null;
  }

}


class DataRamdomBillOrder{
  String? bill_code;

  DataRamdomBillOrder({
    this.bill_code,
  });
   DataRamdomBillOrder.empty(){
    this.bill_code = '' ;
  }
   DataRamdomBillOrder.fromJson(Map<String, dynamic> json){
    bill_code = json["bill_code"] != null ? json["bill_code"] : '';
  }
}