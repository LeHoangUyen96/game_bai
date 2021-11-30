import 'dart:io';

import 'package:viet_trung_mobile/data/request/confirm_order_request.dart';
import 'package:viet_trung_mobile/data/request/enter_warehouse_request.dart';
import 'package:viet_trung_mobile/data/request/packing_order_requets.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/data/response/ramdom_bill_order_response.dart';
import 'package:viet_trung_mobile/data/response/warehouse_response.dart';

abstract class OrderRepositories {
  Future<OrderResponse> onGetListOrder(int type);
  Future<OrderDetailsResponse> onGetDetailsOrder(int id);
  Future<WarehouseResponse> onGetListWarehouse();
  Future<bool> onPackingOrder(PackingOrderRequest request);
  Future<bool> onEnterWarehouse(EnterWareHouseRequest request);
  Future<RamdomBillOrderResponse> onRamdomBillOrder(int user_id);
  Future<String> onUploadImageEnterWarehouse(List<File> request);
  Future<bool> onConfirmOrder(ConfirmOrderRequest request);
}