import 'package:viet_trung_mobile/data/response/admin_add_image_enter_warehouse_response.dart';

class VerifiOrderWaitConfirmRequest {
  int? orderId;
  int? transportId;
  int? type;
  dynamic transportFee;
  int? packingId;
  String? note;
  List<String>? image;

  VerifiOrderWaitConfirmRequest({
    this.transportId,
    this.orderId,
    this.packingId,
    this.transportFee,
    this.type,
    this.note,
    this.image,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['transport_form_id'] = this.transportId;
    data['transport_fee'] = this.transportFee;
    data['packing_form_id'] = this.packingId;
    data['type'] = this.type;
    data['images'] = this.image;
    data['note'] = this.note;
    return data;
  }
}
