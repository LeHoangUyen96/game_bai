class DataCheckWarehouse {
  int? id;
  String? name;
  int? warehouseId;
  int? status;
  bool? isCheck;

  DataCheckWarehouse({
    this.id,
    this.name,
    this.status,
    this.warehouseId,
    this.isCheck,
  });

  DataCheckWarehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    warehouseId = json['warehouse_id'] ?? 0;
    status = json['status'] ?? 0;
    if (status == 1) {
      isCheck = true;
    }
    {
      isCheck = false;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['warehouse_id'] = this.warehouseId;
    data['status'] = this.status;
    return data;
  }
}
