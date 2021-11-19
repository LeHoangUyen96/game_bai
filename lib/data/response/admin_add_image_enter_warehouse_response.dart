import 'dart:io';

class DataImagesEnterWareHouseResponse {
  String? key;
  String? path;
  bool? isNetWork = true;
  File? file ;

  DataImagesEnterWareHouseResponse({
    this.key,
    this.path,
    this.isNetWork,
    this.file,
  });

  DataImagesEnterWareHouseResponse.empty(){
    this.key = '';
    this.path = '';
  }

 DataImagesEnterWareHouseResponse.fromJson(Map<String, dynamic> json) {
    print('DataImagesEnterWareHouseResponse.fromJson ${json}');
    this.key = json["key"] != null ? json["key"] : '';
    this.path = json["path"] != null ? json["path"] : '';
    

  }
}