import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_product_reponsitory/dashboard_product_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/product_detail_response.dart';

class DashboardProductImpl extends GetConnect
    implements DashboardProductRepositories {
  @override
  Future<ForgotPassResponse> onAddProduct(String name) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.addProduct;
    Map body = {"name": name};
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onDeleteProduct(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.deleteProduct + id;
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onUpdateProduct(String id, String name) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateProduct + id;
    Map body = {"name": name};
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ProductDetailResponse> onGetProductDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.productDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ProductDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
