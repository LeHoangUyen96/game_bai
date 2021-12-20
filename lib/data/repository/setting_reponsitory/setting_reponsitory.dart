import 'package:viet_trung_mobile_admin/data/response/list_packing_form_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_form_response.dart';

abstract class SettingRepositories {
  Future<ListPackingFormResponse> onGetListPackingForm();
  Future<ListTransportFormResponse> onGetListTransport();
}
