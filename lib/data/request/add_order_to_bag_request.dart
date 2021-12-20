import 'package:viet_trung_mobile/data/request/create_bag_request.dart';

class AddOrderToBagRequest {
  int? parent_pack_id;
  List<DataOrderCreateBag>? orders;
  AddOrderToBagRequest({
    this.parent_pack_id,
    this.orders,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_pack_id'] = this.parent_pack_id;
    data['orders'] = this.orders!.map((e) => e.toJson()).toList();
    return data;
  }
}
