class ProductDetailResponse {
  DataProductDetail? data;
  ProductDetailResponse({this.data});
  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataProductDetail.fromJson(json['data']) : null;
  }
}

class DataProductDetail {
  int? id;
  String? name;
  DataProductDetail({
    this.id,
    this.name,
  });
  DataProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
  }
}
