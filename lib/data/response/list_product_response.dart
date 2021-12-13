class ListProductResponse {
  List<ItemProduct>? data;

  ListProductResponse({this.data});

  ListProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemProduct>[];
      json['data'].forEach((v) {
        data!.add(ItemProduct.fromJson(v));
      });
    }
  }
}

class ItemProduct {
  String? name;
  int? id;

  ItemProduct({
    this.name,
    this.id,
  });

  ItemProduct.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
