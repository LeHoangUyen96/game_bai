import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/report_reponsitory/report_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/request/report_request.dart';
import 'package:viet_trung_mobile_admin/data/response/report_response.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/dateTime_helper.dart';

class ReportController extends GetxController  {
  int ? typeTime ;
  ReportResponse ? reportResponse;
  ReportRepositories ? reportRepositories;
  String ? excelUrl ;
  String? fileUrl;
  bool downloading = false;
  String downloadingStr = "No data";
  String savePath = "";
  var progressString = "";
  String filename = 'test.xlsx';
  bool isCheckTime = false;
  DateTime? fromDay;
  DateTime? toDay;

  String? toDateTime;
  String? fromDateTime;
  @override
  void onInit() {
    super.onInit();
    reportRepositories = Injector().report;
    fromDay = DateTime.now();
    toDay = DateTime.now();
    onGetDataReport();
  }
  pickFromDate (BuildContext context) async {
     DateTime? date = await showDatePicker(
       context: context,
       initialDate: fromDay!,
       firstDate: DateTime(DateTime.now().year-10),
       lastDate: DateTime(DateTime.now().year+10),
     );
     if(date != null) {
       fromDay = date;
       print(date.toString());
       fromDateTime = DateTimeHelper.toDayMonthYear(
           fromDay!.toIso8601String());
       update();
     }
   }

   pickToDate (BuildContext context) async {
     DateTime? date = await showDatePicker(
       context: context,
       initialDate: toDay!,
       firstDate: DateTime(DateTime.now().year-10),
       lastDate: DateTime(DateTime.now().year+10),
     );
     if(date != null) {
       toDay = date;
       print(date.toString());
       toDateTime = DateTimeHelper.toDayMonthYear(
           toDay!.toIso8601String());
       update();
     }
   }
  void onGetDataReport(){
    ReportRequest request = ReportRequest(
      type: 1,
      to_date: "",
      from_date: ""
    );
    reportRepositories!.onGetDataReport(request).then((value) {
      reportResponse = value; 
      update();
    }).catchError((onError){
      Get.defaultDialog(title: onError.message.toString(), middleText: '');
    });
  }
    
  void onChangeTypeTime(){
    if(typeTime != 5){
      ReportRequest request = ReportRequest(
      type: typeTime,
      to_date: "",
      from_date: ""
    );
    reportRepositories!.onGetDataReport(request).then((value) {
      reportResponse = value; 
      update();
    }).catchError((onError){
      Get.defaultDialog(title: onError.message.toString(), middleText: '');
    });
    } 
  }
  void onCheckTime() {
    if(typeTime == 5){
      isCheckTime = !isCheckTime;
      update();
    }
    
  }
    void onExportReport(){
      if(typeTime != 5){
      ReportRequest request = ReportRequest(
      type: typeTime,
      to_date: "",
      from_date: ""
     );
      reportRepositories!.onExportReport(request).then((value) {
        excelUrl = value.data.toString();
        fileUrl = NetworkConfig.URL_SERVER_BASE_CDN + "/" + excelUrl!;
        //downloadFile();
        _launchInBrowser(fileUrl!);
        // openFile();
        update();
      }).catchError((onError){
        Get.defaultDialog(title: onError.message.toString(), middleText: '');
      });
      
      update();
      }
    }
    Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
    Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }
  Future<void> downloadFile() async {
  try {
    Dio dio = Dio();

    String fileName = fileUrl!.substring(fileUrl!.lastIndexOf("/") + 1);

    savePath = await getFilePath(fileName);
    await dio.download(fileUrl!, savePath, onReceiveProgress: (rec, total) {
      downloading = true;
      //download = (rec / total) * 100;
      print("Rec: $rec , Total: $total");
        downloadingStr =
            "Downloading : ${((rec / total) * 100).toStringAsFixed(0)} + %" ;
            print("$downloadingStr");

      update();
      });
      downloading = false;
      downloadingStr = "Completed";
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      //raf.writeFromSync(response.data);
      await raf.close();
      openFile();
      update();
      print("$downloadingStr");
  } catch (e) {
    print(e.toString());
  }
 }
  Future<void> openFile() async {
    var filePath = savePath;
    FilePickerResult ? result = await FilePicker.platform.pickFiles();
    if (result != null) {
       filePath = result.files.single.path!;
    } else {
      // User canceled the picker
    }
     final _result = await OpenFile.open(filePath);
    print(_result.message);
  }
}