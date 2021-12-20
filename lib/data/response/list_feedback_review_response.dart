class ListFeedbackReviewResponse {
  List<DataFeedbackReviewResponse>? data;
  Paginate? paginate;

  ListFeedbackReviewResponse({
    this.data,
    this.paginate,
  });

  ListFeedbackReviewResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataFeedbackReviewResponse>(
                (e) => DataFeedbackReviewResponse.fromJson(e))
            .toList()
        : [];
    paginate =
        json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
}

class DataFeedbackReviewResponse {
  int? id;
  String? billCode;
  int? star;
  String? createdAt;
  String? comment;
  String? orderCompleteAt;

  DataFeedbackReviewResponse({
    this.billCode,
    this.id,
    this.star,
    this.createdAt,
    this.comment,
    this.orderCompleteAt,
  });
  DataFeedbackReviewResponse.fromJson(Map<String, dynamic> json) {
    billCode = json['bill_code'] ?? '';
    id = json['id'] ?? 0;
    star = json['star'] ?? 0;
    createdAt = json['created_at'] ?? '';
    comment = json['comment'] ?? '';
    orderCompleteAt = json['order_complete_at'] ?? '';
  }
}

class Paginate {
  int? total;
  Paginate({
    this.total,
  });
  Paginate.fromJson(Map<String, dynamic> json) {
    total = json['total'] ?? 0;
  }
}
