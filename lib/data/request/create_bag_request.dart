import 'package:viet_trung_mobile_admin/data/response/order_add_bag_response.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class CreateBagRequest {
  String? parent_pack_type;
  String? warehouse_back_code;
  int? user_id;
  int? transport_form_id;
  int? packing_form_id;
  int? weight;
  double? total_cod;
  List<DataOrderCreateBag>? orders;
  CreateBagRequest({
    this.parent_pack_type,
    this.warehouse_back_code,
    this.user_id,
    this.transport_form_id,
    this.weight,
    this.orders,
    this.packing_form_id,
    this.total_cod,
  });

  CreateBagRequest.empty() {
    this.parent_pack_type = '';
    this.warehouse_back_code = '';
    this.transport_form_id = -1;
    this.user_id = -1;
    this.weight = -1;
    this.packing_form_id = -1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_pack_type'] = this.parent_pack_type;
    data['warehouse_back_code'] = this.warehouse_back_code;
    data['user_id'] = this.user_id;
    data['transport_form_id'] = this.transport_form_id;
    data['weight'] = this.weight;
    data['total_cod'] = this.total_cod;
    data['packing_form_id'] = this.packing_form_id;
    data['orders'] = this.orders!.map((e) => e.toJson()).toList();
    return data;
  }
}

class DataOrderCreateBag {
  int? order_id;
  int? number_package;

  DataOrderCreateBag({
    this.order_id,
    this.number_package,
  });
  DataOrderCreateBag.empty() {
    this.order_id = -1;
    this.number_package = -1;
  }
  DataOrderCreateBag.fromJson(Map<String, dynamic> json) {
    this.order_id = ParseNumber.parseInt(json['order_id']);
    this.number_package = ParseNumber.parseInt(json['number_package']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.order_id;
    data['number_package'] = this.number_package;
    return data;
  }
}
