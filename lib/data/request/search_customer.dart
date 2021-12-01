class SearchCustomerRequest {
  String? valueSearch;
  SearchCustomerRequest({
    this.valueSearch,
  });

  SearchCustomerRequest.fromJson(Map<String, dynamic> json) {
    valueSearch = json['value_search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value_search'] = valueSearch;
    return data;
  }
}
