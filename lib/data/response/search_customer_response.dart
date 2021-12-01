class SearchCustomerResponse {
  String? message;

  SearchCustomerResponse({
    this.message,
  });

  SearchCustomerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
  }
}

class DataSearchCustomer {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? avatar;
  String? userCode;
  int? isAdmin;

  DataSearchCustomer({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.avatar,
    this.userCode,
    this.isAdmin,
  });
  DataSearchCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    avatar = json['avatar'] ?? '';
    userCode = json['user_code'] ?? '';
    isAdmin = json['is_admin'] ?? 0;
  }
}
