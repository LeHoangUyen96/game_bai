import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:money2/money2.dart';

class ServiceFeeResponse {
  DataServiceFee? dataServiceFee;

  ServiceFeeResponse({this.dataServiceFee});

  ServiceFeeResponse.fromJson(Map<String, dynamic> json) {
    dataServiceFee = json['data'] != null ? DataServiceFee.fromJson(json['data']) : null;
  }
}

class DataServiceFee {
  double? from_amount;
  double? to_amount;
  double? service_fee;
  String? service_fee_type_status_code;

  DataServiceFee({
    this.from_amount,
    this.to_amount,
    this.service_fee,
    this.service_fee_type_status_code,
  });

  DataServiceFee.empty() {
    this.from_amount = 0.0;
    this.to_amount = 0.0;
    this.service_fee = 0.0;
    this.service_fee_type_status_code = '';
  }

  DataServiceFee.fromJson(Map<String, dynamic> json) {
    from_amount = ParseNumber.parseDouble(json["from_amount"]);
    to_amount = ParseNumber.parseDouble(json["to_amount"]);
    service_fee = ParseNumber.parseDouble(json["service_fee"]);
    service_fee_type_status_code = json["service_fee_type_status_code"] != null ? json["service_fee_type_status_code"] : 'percent';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["from_amount"] = from_amount;
    map["to_amount"] = to_amount;
    map["service_fee"] = service_fee;
    map["service_fee_type_status_code"] = service_fee_type_status_code;
    return map;
  }

  String toStringFee(Currency currency) {
    // print('toStringFee service_fee $service_fee');
    if( service_fee_type_status_code == 'percent'){
      return '$service_fee%';
    } else if( service_fee_type_status_code == 'money'){
      Money moneyFee = Money.from(service_fee ?? 0, currency); // CNY
      // print('toStringFee moneyFee $moneyFee');
      // print('toStringFee moneyFee.format  ${moneyFee.format('###,###,###,###S')}');
      return '${moneyFee.format('###,###,###,###S')}';
    }
    return '0đ';
  }

}
