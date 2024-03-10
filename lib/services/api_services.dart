import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spin_to_win/constant/api_endpoints.dart';
import 'package:spin_to_win/models/base_response.dart';

class ApiServices {
  Future<BaseResponse?> getApiRequest({required String url}) async {
    var response = await http.get(Uri.parse(url));
    return returnResponse(response);
  }

  Future<BaseResponse?> postRequest(
      {required String url, required Map<String,dynamic> params}) async {
        debugger();
    var response =
        await http.post(Uri.parse(url), body: json.encode(params),
        
        
        );
    return returnResponse(response);
  }

  Future<BaseResponse?> deleteRequest(
      {required String url, required Map params}) async {
    var response =
        await http.delete(Uri.parse(url), body: params);
    return returnResponse(response);
  }
}

returnResponse(var response) {
  if (response.statusCode == 200) {
    debugger();
    var res = json.decode(response.body);
    debugger();
    return BaseResponse(
        statusCode: res['statusCode'].toString(),
        data: res['data'],
        message: res['message']);
  } else {
    return BaseResponse(
        statusCode: response.statusCode.toString(),
        data: {},
        message: 'Something Went Wrong, Please try again');
  }
}
