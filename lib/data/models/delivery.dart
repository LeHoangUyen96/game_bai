class Delivery {
  int? id;
  String? name;
  String? code;

  Delivery({
    this.id,
    this.name,
    this.code,
  });

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.code;
    return data;
  }
}

