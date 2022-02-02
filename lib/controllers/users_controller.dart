import 'package:banipay_comercial/controllers/user_data_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/models/user_credentials.dart';
import 'package:banipay_comercial/persistent_data/credentials_data.dart';
import 'package:banipay_comercial/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UsersController extends GetxController {
  final listUsers = Rx<List<User>>([]);

  //SERVICE
  // final AuthenticationService authenticationService;
  // AuthController({required this.authenticationService});



  String authUrl =
      dotenv.env['BASE_API_HOST']! + ':' + dotenv.env['LOGIN_PORT']!;

  //CONTROLLER FUNCTIONS
  @override
  void onInit() async {
    obtainUsers();
    super.onInit();
  }

  Future<void> obtainUsers() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listUsers.value=users;
      // print("Response List users");
      // print(users[0]);
      // return users;
    }
    // return null;
  }

  // Future<List<User>?> getUsers() async {
  //   try {
  //     UserAccount? user = await authenticationService.login(userCredentials);
  //     bool credentials = await saveCredentialData(userCredentials.email, userCredentials.password);
  //     if (user != null && credentials) {
  //       await _userDataController.setUserAccount(user);
  //       Get.offNamedUntil('/home', (route) => false);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
