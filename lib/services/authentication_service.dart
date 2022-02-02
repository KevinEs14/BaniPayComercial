import 'dart:convert';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/models/user_credentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthenticationService{
  Future<UserAccount?> login(UserCredentials user) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.post(
        Uri.parse('https://v2.banipay.me/api/auth/api/authenticate'),
        headers: headers,
        body: jsonEncode(user.toJson()));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return UserAccount.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}