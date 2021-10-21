class DeviceTokenRequest {
  String? deviceToken;

  DeviceTokenRequest(
      {this.deviceToken
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_token'] = this.deviceToken;

    return data;
  }
}
