class RatingOrderRequest {
  int? order_id;
  int? star;
  String? comment;


  RatingOrderRequest(
      {this.order_id,
        this.star,
        this.comment,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.order_id;
    data['star'] = this.star;
    data['comment'] = this.comment;

    return data;
  }
}