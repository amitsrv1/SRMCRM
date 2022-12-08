import 'dart:convert';
import 'dart:io';

import 'package:crmsrv/dto/api_handling/alert_messqage.dart';
import 'package:crmsrv/dto/api_handling/app_excetion/app_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  Future<dynamic> post(
    String url,
    Object body,
    String? accessToken,
  ) async {
    var responseJson;
    var link = Uri.parse(url);
    var data = jsonEncode(body);
    var head = {
      "Content-Type": "application/json",
      "x-access-token": "$accessToken"
    };
    try {
      final response = await http.post(link, headers: head, body: data);
      responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      AlertDialog(
        title: Text("No Internet connection"),
      );
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(
    String url,
    String accessToken,
  ) async {
    var responseJson;
    var link = Uri.parse(url);
    var token = accessToken;
    var head = {"Content-Type": "application/json", "x-access-token": token};
    try {
      final response = await http.get(link, headers: head);
      responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      AlertDialog(
        title: Text("No Internet connection"),
      );
      //showAlertErrorDialog(context, "No Internet connection", "Ok", () {});
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(
    String url,
    String accessToken,
    Object body,
  ) async {
    var responseJson;
    var link = Uri.parse(url);
    var data = jsonEncode(body);
    var head = {
      "Content-Type": "application/json",
      "x-access-token": accessToken
    };
    try {
      final response = await http.put(link, headers: head, body: data);
      // responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      AlertDialog(
        title: Text("No Internet connection"),
      );
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    } else {
      throw UniversalException("${response.body} : ${response.statusCode}");
    }
  }

  dynamic _returnMessage(http.Response response) {
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 400:
        return AlertDialog(
          title: Text("${body['message']}"),
        );
      case 404:
        return AlertDialog(
          title: Text("Invalid Input"),
        );
      case 502:
        return AlertDialog(
          title: Text("Server Error\nPlease Try Again After Some Time"),
        );
    }
  }
}
