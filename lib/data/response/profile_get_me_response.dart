class GetProfileResponse{
  DataGetProfile ? data;

  GetProfileResponse({this.data});

  GetProfileResponse.fromJson(Map<String, dynamic> json){
    this.data = json['data'] != null ? DataGetProfile.fromJson(json['data']) : null;

  }

}


class DataGetProfile{
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? user_code;

  
  
  

  DataGetProfile({
     this.name,
     this.email,
     this.phone,
     this.avatar,
     this.user_code,
    



  });

  DataGetProfile.fromJson(Map<String, dynamic> json){
    name = json["name"] != null ? json["name"] : '';
    email =  json["email"] != null ? json["email"] : '';
    phone = json["phone"] != null ? json["phone"] : '';
    avatar =  json["avatar"] != null ? json["avatar"] : '';
    user_code = json["user_code"] != null ? json["user_code"] : '';
  }
  

}