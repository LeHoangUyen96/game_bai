class SearchCustomerResponse {
  List<DataSearchCustomer>? data;

  SearchCustomerResponse({
    this.data,
  });

  SearchCustomerResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataSearchCustomer>((e) => DataSearchCustomer.fromJson(e))
            .toList()
        : [];
  }
}

class DataSearchCustomer {
  String? name;
  String? phone;
  String? avatar;
  String? userCode;

  DataSearchCustomer({
    this.name,
    this.phone,
    this.avatar,
    this.userCode,
  });
  DataSearchCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    avatar = json['avatar'] ?? '';
    userCode = json['user_code'] ?? '';
  }
}
