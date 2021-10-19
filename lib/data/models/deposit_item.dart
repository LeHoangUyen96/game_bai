class DepositItem {
  String? code;
  String? name;
  int? numContainer;
  String? shipUnit;
  String? typeProduct;
  int? numProduct;
  double? totalPrice;
  String? note;

  DepositItem(
      {this.code,
      this.name,
      this.numContainer,
      this.shipUnit,
      this.typeProduct,
      this.numProduct,
      this.totalPrice,
      this.note});

  // DepositItem.empty(){
  //   this.code = '';
  //   this.name = '';
  //   this.numContainer = 0;
  //   this.shipUnit = '';
  //   this.typeProduct = '';
  //   this.numProduct = 0;
  //   this.totalPrice = 0.0;
  //   this.note = '';
  // }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['landing_code'] = this.code;
    data['item_name'] = this.name;
    data['pack_quantity'] = this.numContainer;
    data['carrier'] = this.shipUnit;
    data['category'] = this.typeProduct;
    data['quantity'] = this.numProduct;
    data['value_of_goods'] = this.totalPrice;
    data['note'] = this.note;
    return data;
  }





}
