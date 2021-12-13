class PackingDetailResponse {
  DataPackingDetail? data;
  PackingDetailResponse({this.data});
  PackingDetailResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataPackingDetail.fromJson(json['data']) : null;
  }
}

class DataPackingDetail {
  int? id;
  String? name;
  int? status;
  int? packingFee;
  DataPackingDetail({
    this.id,
    this.name,
    this.status,
    this.packingFee,
  });

  DataPackingDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    status = json['status'] ?? 0;
    packingFee = json['packing_fee'] ?? '';
  }
}
