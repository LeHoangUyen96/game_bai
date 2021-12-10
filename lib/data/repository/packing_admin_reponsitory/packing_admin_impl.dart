// import 'package:get/get_connect.dart';
// import 'package:viet_trung_mobile/data/network/network_config.dart';
// import 'package:viet_trung_mobile/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
// import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
// import 'package:viet_trung_mobile/data/request/add_transport_form_fee_request.dart';
// import 'package:viet_trung_mobile/data/response/auth_response.dart';
// import 'package:viet_trung_mobile/data/response/error_response.dart';
// import 'package:viet_trung_mobile/data/response/list_product_response.dart';
// import 'package:viet_trung_mobile/data/response/list_transport_admin_response.dart';
// import 'package:viet_trung_mobile/data/response/transport_admin_detail_response.dart';
// import 'dart:convert';

// class PackingAdminImpl extends GetConnect
//     implements PackingAdminRepositories {
//   @override
//   Future<PackingFormAdminResponse> onGetListPacking() async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.listPacking;
//     final responseJson = await get(url, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return PackingFormAdminResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }

//   @override
//   Future<PackingAdminDetailResponse> onGetPackingDetail(String id) async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.transportDetail + id;
//     final responseJson = await get(url, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return PackingAdminDetailResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }

//   @override
//   Future<ForgotPassResponse> onDeletePacking(String id) async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.deletePacking + id;
//     final responseJson = await delete(url, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return ForgotPassResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }

//   @override
//   Future<ForgotPassResponse> onDeletePackingFee(String id) async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.deletePackingFee + id;
//     final responseJson = await delete(url, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return ForgotPassResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }

//   @override
//   Future<ListProductResponse> onGetListProduct() async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.listProduct;
//     final responseJson = await get(url, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return ListProductResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }

//   @override
//   Future<ForgotPassResponse> onAddPackingFee(
//       AddPackingFormFeeRequest request) async {
//     final header = NetworkConfig.onBuildHeader();
//     final url = NetworkConfig.addPackingFee;
//     final body = json.encode(request);
//     final responseJson = await post(url, body, headers: header);
//     if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
//       return ForgotPassResponse.fromJson(responseJson.body);
//     }
//     throw ErrorResponse.fromJson(responseJson.body);
//   }
// }
