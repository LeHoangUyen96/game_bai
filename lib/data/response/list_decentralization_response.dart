class DecentralizationResponse {
  List<DataDecentralization>? data;

  DecentralizationResponse({this.data});

  DecentralizationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataDecentralization>[];
      json['data'].forEach((v) {
        data!.add(DataDecentralization.fromJson(v));
      });
    }
  }
}

class DataDecentralization {
  int? id;
  String? name;
  String? description;

  DataDecentralization({
    this.id,
    this.name,
    this.description,
  });

  DataDecentralization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
