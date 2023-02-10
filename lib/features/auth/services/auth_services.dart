import 'dart:convert';

import 'package:amazon_app/constants/error_handling.dart';
import 'package:amazon_app/constants/global_variable.dart';
import 'package:amazon_app/constants/utils.dart';
import 'package:amazon_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          address: "",
          id: "",
          email: email,
          name: name,
          password: password,
          token: "",
          type: "");

      http.Response res = await http.post(
        Uri.parse("$uri/user/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          "Content_Type": "application/json; charset=UTF-8",
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Account created, Login with the same credential");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// SIGN IN
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/user/api/signin"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          "Content_Type": "application/json; charset=UTF-8",
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Account created, Login with the same credential");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
