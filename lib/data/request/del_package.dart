import 'package:viet_trung_mobile_admin/data/request/create_bag_request.dart';

class DelOrderToBagRequest {
  int? parent_pack_id;
  int? order_id;

  DelOrderToBagRequest({
    this.parent_pack_id,
    this.order_id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_pack_id'] = this.parent_pack_id;
    data['order_id'] = this.order_id;
    return data;
  }
}