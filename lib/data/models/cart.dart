import 'package:viet_trung_mobile/data/response/service_fee_response.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ShoppingCart {
  // ignore: non_constant_identifier_names
  String? shop_id;

  // ignore: non_constant_identifier_names
  String? shop_name;

  // ignore: non_constant_identifier_names
  String? shop_url;
  // ignore: non_constant_identifier_names
  String? page_logo;
  List<ShoppingCartProduct>? items;

  String? note;

  double? total_money_product;
  double? total_money_fee;
  double? total_money;
  DataServiceFee? current_service_fee;
  String? discount;
  double? purchase_discount;

  ShoppingCart({
    // ignore: non_constant_identifier_names
    this.shop_id,
    // ignore: non_constant_identifier_names
    this.shop_name,
    // ignore: non_constant_identifier_names
    this.shop_url,
    this.items,
    this.note,
    this.total_money_product,
    this.total_money_fee,
    this.total_money,
    this.current_service_fee,
    this.discount,
    this.purchase_discount
  });

  ShoppingCart.empty() {
    this.shop_id = '';
    this.shop_name = '';
    this.shop_url = '';
    this.note = '';
    this.items = <ShoppingCartProduct>[];
    this.total_money_product = 0.0;
    this.total_money_fee = 0.0;
    this.total_money = 0.0;
    this.current_service_fee = DataServiceFee.empty();
    this.discount = '';
    this.purchase_discount = 0.0;
  }

  ShoppingCart.fromJson(dynamic json) {
    total_money_product = 0.0;
    total_money_fee = 0.0;
    total_money = 0.0;
    current_service_fee = DataServiceFee.empty();
    shop_id = json["shop_id"] != null ? json["shop_id"].toString() : '';
    shop_name = json["shop_name"] != null ? json["shop_name"].toString() : '';
    shop_url = json["shop_url"] != null ? json["shop_url"].toString() : '';
    page_logo = json["page_logo"] != null ? json["page_logo"].toString() : '';
    items = <ShoppingCartProduct>[];
    if (json["items"] != null) {
      json["items"].forEach((v) {
        items?.add(ShoppingCartProduct.fromJson(v));
      });
    }
    note = json["note"] != null ? json["note"].toString() : '';
    discount = '';
    purchase_discount = 0.0;
  }
}

class ShoppingCartPrice {
  // ignore: non_constant_identifier_names
  double? value;

  // ignore: non_constant_identifier_names
  String? currencyUnit;

  ShoppingCartPrice({
    // ignore: non_constant_identifier_names
    this.value,
    // ignore: non_constant_identifier_names
    this.currencyUnit,
  });

  ShoppingCartPrice.empty() {
    this.value = 0.0;
    this.currencyUnit = '';
  }

  ShoppingCartPrice.fromJson(dynamic json) {
    value = ParseNumber.parseDouble(json["value"]);
    currencyUnit = json["currencyUnit"] != null ? json["currencyUnit"].toString() : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["value"] = value;
    map["currencyUnit"] = currencyUnit;
    return map;
  }
}

class ShoppingCartProduct {
  int? id;
  // ignore: non_constant_identifier_names
  String? product_id;
  // ignore: non_constant_identifier_names
  String? product_name;
  // ignore: non_constant_identifier_names
  String? product_color;
  // ignore: non_constant_identifier_names
  String? product_size;
  // ignore: non_constant_identifier_names
  String? product_image;
  int? quantity;
  ShoppingCartPrice? unitprice;
  ShoppingCartPrice? amount;
  // ignore: non_constant_identifier_names
  String? shop_id;
  // ignore: non_constant_identifier_names
  String? page_url;
  // ignore: non_constant_identifier_names
  String? page_name;
  String? note;
  int? favorite;

  bool? isSelected;

  ShoppingCartProduct({
    this.id,
    // ignore: non_constant_identifier_names
    this.product_id,
    // ignore: non_constant_identifier_names
    this.product_name,
    // ignore: non_constant_identifier_names
    this.product_color,
    // ignore: non_constant_identifier_names
    this.product_size,
    // ignore: non_constant_identifier_names
    this.product_image,
    this.quantity,
    this.unitprice,
    this.amount,
    // ignore: non_constant_identifier_names
    this.shop_id,
    // ignore: non_constant_identifier_names
    this.page_url,
    // ignore: non_constant_identifier_names
    this.page_name,
    this.note,
    this.favorite,
    this.isSelected,
  });

  ShoppingCartProduct.fromJson(dynamic json) {
    id = ParseNumber.parseInt(json["id"], fault: -1);
    product_id = json["product_id"] != null ? json["product_id"].toString() : '';
    product_name = json["product_name"] != null ? json["product_name"].toString() : '';
    product_color = json["product_color"] != null ? json["product_color"].toString() : '';
    product_size = json["product_size"] != null ? json["product_size"].toString() : '';
    product_image = json["product_image"] != null ? json["product_image"].toString() : '';
    quantity = ParseNumber.parseInt(json["quantity"]);
    unitprice = json["unitprice"] != null ? ShoppingCartPrice.fromJson(json["unitprice"]) : ShoppingCartPrice.empty();
    amount = json["amount"] != null ? ShoppingCartPrice.fromJson(json["amount"]) : ShoppingCartPrice.empty();
    shop_id = json["shop_id"] != null ? json["shop_id"].toString() : '';
    page_url = json["page_url"] != null ? json["page_url"].toString() : '';
    page_name = json["page_name"] != null ? json["page_name"].toString() : '';
    note = json["note"] != null ? json["note"].toString() : '';
    favorite = ParseNumber.parseInt(json["favorite"]);
    isSelected = true;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["product_id"] = product_id;
    map["product_name"] = product_name;
    map["product_color"] = product_color;
    map["product_size"] = product_size;
    map["product_image"] = product_image;
    map["quantity"] = quantity;
    map["unitprice"] = unitprice?.toJson();
    map["amount"] = amount?.toJson();
    map["shop_id"] = shop_id;
    map["page_url"] = page_url;
    map["page_name"] = page_name;
    map["note"] = note;
    map["favorite"] = favorite;
    return map;
  }

}