class TransportAdminDetailResponse {
  List<DataTransportFormAdminDetail>? data;

  TransportAdminDetailResponse({
    this.data,
  });

  TransportAdminDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataTransportFormAdminDetail>(
                (e) => DataTransportFormAdminDetail.fromJson(e))
            .toList()
        : [];
  }
}

class DataTransportFormAdminDetail {
  int? id;
  int? productId;
  String? productName;
  String? unit;
  String? from;
  String? to;
  String? transportFeeHN;
  String? transportFeeDN;
  String? transportFeeSG;

  DataTransportFormAdminDetail({
    this.productId,
    this.id,
    this.unit,
    this.from,
    this.to,
    this.transportFeeHN,
    this.transportFeeDN,
    this.transportFeeSG,
    this.productName,
  });
  DataTransportFormAdminDetail.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] ?? 0;
    productName = json['product_name'] ?? '';
    id = json['id'] ?? 0;
    unit = json['unit'] ?? '';
    from = json['from'] ?? '';
    to = json['to'] ?? '';
    transportFeeHN = json['transport_fee_HN'] ?? '';
    transportFeeDN = json['transport_fee_DN'] ?? '';
    transportFeeSG = json['transport_fee_SG'] ?? '';
  }
}
