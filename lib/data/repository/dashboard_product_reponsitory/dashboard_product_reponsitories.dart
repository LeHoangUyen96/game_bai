import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/product_detail_response.dart';

abstract class DashboardProductRepositories {
  Future<ForgotPassResponse> onAddProduct(String name);
  Future<ForgotPassResponse> onDeleteProduct(String id);
  Future<ForgotPassResponse> onUpdateProduct(String id, String name);
  Future<ProductDetailResponse> onGetProductDetail(String id);
}
