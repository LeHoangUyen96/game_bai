class UploadStatusBagResponse{
      String? message;
  UploadStatusBagResponse({this.message});

  UploadStatusBagResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
  }
}