class RatingOrderResponse{
      String? message;
  RatingOrderResponse({this.message});

  RatingOrderResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
  }
}