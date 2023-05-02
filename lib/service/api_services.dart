import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String signupUrl = "https://test-auth-final.vercel.app/user/signup";
  static String signinUrl = "https://test-auth-final.vercel.app/user/signin";

  static Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static void signupApi(Map data) async {
    final response = await http.post(Uri.parse(ApiServices.signupUrl),
        headers: ApiServices.headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Registration Sucessful!");
    } else {
      log(response.statusCode.toString());
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  static void signinApi(Map data) async {
    final response = await http.post(Uri.parse(ApiServices.signinUrl),
        headers: ApiServices.headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Login Sucessful!");
    } else {
      log(response.statusCode.toString());
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }
}
