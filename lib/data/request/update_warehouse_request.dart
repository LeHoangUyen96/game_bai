class UpdateWarehouseRequest {
  int? warehouseId;
  List<int>? cityIds;

  UpdateWarehouseRequest({
    this.warehouseId,
    this.cityIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouse_id'] = this.warehouseId;
    data['city_ids'] = this.cityIds;
    return data;
  }
}
