import 'dart:convert';
import 'dart:io';

import 'package:hava_havai_assessment/API_Helper/App_Exceptions.dart';
import 'package:http/http.dart'as http;

class APIHelper {
  Future<dynamic> getAPI({required String Url}) async {
    var uri = Uri.parse(Url);

    try {
      var res = await http.get(uri);
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      throw FetchDataException(errorMsg: "No Internet");
    }
  }

  dynamic returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var mData = jsonDecode(response.body);
          return mData;
        }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());

      case 401:
      case 403:
        throw UnAuthorizedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            errorMsg: "Error occured while communication with server with StatusCode: ${response.statusCode}");
    }
  }
}

