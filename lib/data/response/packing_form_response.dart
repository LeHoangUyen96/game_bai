class PackingFormResponse {
  List<DataPackingForm>? data;

  PackingFormResponse({
    this.data,
  });

  PackingFormResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataPackingForm>((e) => DataPackingForm.fromJson(e))
            .toList()
        : [];
  }
}

class DataPackingForm {
  int? id;
  String? name;
  dynamic packingFee;

  DataPackingForm({
    this.name,
    this.id,
    this.packingFee,
  });
  DataPackingForm.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? 0;
    packingFee = json['packing_fee'] ?? 0;
  }
}
