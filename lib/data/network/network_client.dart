import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NetworkClient {


  static Future<Response> onPostFile(String url,
      {required Map<String, String> header, required String keyName, required File file}) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      http.MultipartFile(
        keyName,
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path,
        contentType: MediaType('image','jpeg'),
      ),
    );
    request.headers.addAll(header);
    StreamedResponse res = await request.send();
    var response = await http.Response.fromStream(res);
    return response;
  }

  static Future<Response> onPostImage(String url,
      {required Map<String, String> header, required String keyName, required File file,required double amount,required String transaction_type}) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      http.MultipartFile(
        keyName,
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path,
        contentType: MediaType('image','jpeg'),
      ),
    );
    request.headers.addAll(header);
    request.fields['amount'] = amount.toString();
    request.fields['type_transaction'] = transaction_type;
    StreamedResponse res = await request.send();
    var response = await http.Response.fromStream(res);
    return response;
  }
  
    static Future<Response> onSendImage(String url,
      {required Map<String, String> header, 
      required String keyName, 
      required File file,
       String? text,
       int? type,
       int? is_admin,
       int? relation_id,
      }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      http.MultipartFile(
        keyName,
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path,
        contentType: MediaType('image','jpeg'),
      ),
    );
    request.headers.addAll(header);
    request.fields['text'] = text.toString();
    request.fields['type'] = type.toString();
    request.fields['is_admin'] = is_admin.toString();
    request.fields['relation_id'] = relation_id.toString();

    StreamedResponse res = await request.send();
    var response = await http.Response.fromStream(res);
    return response;
  }
}
