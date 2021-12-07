class ManagerBagRequest {
  String? code;
  String? parent_pack_status_code;
  int? transport_form_id;
  String? from_date;
  String? to_date;
  String? sort;
 

  ManagerBagRequest(
      { 
        this.code,
        this.parent_pack_status_code,
        this.transport_form_id,
        this.from_date,
        this.to_date,
        this.sort,
      });

 ManagerBagRequest.empty(){
  this.code = '';
  this.parent_pack_status_code = '';
  this.transport_form_id = -1;
  this.from_date = '';
  this.to_date = '';
  this.sort = '';
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['parent_pack_status_code'] = this.parent_pack_status_code;
    data['transport_form_id'] = this.transport_form_id;
    data['from_date'] = this.from_date;
    data['to_date'] = this.to_date;
    data['sort'] = this.sort;
    return data;
  }
}