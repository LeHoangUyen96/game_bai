class ReportRequest {
  int? type;
  String? from_date;
  String ? to_date; 
  ReportRequest({
    this.type,
    this.from_date,
    this.to_date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['from_date'] = this.from_date;
    data['to_date'] = this.to_date;
    return data;
  }
}