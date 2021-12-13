import 'package:viet_trung_mobile/data/response/transport_admin_detail_response.dart';

class TransportFeeDetailResponse {
  final DataTransportFormAdminDetail? data;

  TransportFeeDetailResponse({this.data});

  TransportFeeDetailResponse.fromJson(Map<String, dynamic> json)
      : data = json['data'] != null
            ? DataTransportFormAdminDetail.fromJson(json['data'])
            : null;
}
