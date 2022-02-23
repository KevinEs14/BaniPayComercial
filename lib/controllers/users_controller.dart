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
  final formKey = GlobalKey<FormState>();
  final listUsers = Rx<List<User>>([]);
  final listAdmins = Rx<List<User>>([]);
  final listAffiliates = Rx<List<User>>([]);
  final listCustomers = Rx<List<User>>([]);
  final indexRole=Rx<int>(0);
  final indexCustomer=Rx<int>(0);
  final indexAdmin=Rx<int>(0);
  final indexAffiliate=Rx<int>(0);
  final editUser=Rx<User?>(null);

  //Direction of EndPoints
  String obtainUsersUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['GET_USERS']!;
  String obtainAdminUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['GET_ADMIN']!;
  String obtainAffiliateUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['GET_AFFILIATE']!;
  String obtainCustomerUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['GET_CUSTOMER']!;
  String updateUserUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['UPDATE_USER']!;
  String searchUserUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['SEARCH_USER']!;

  //CONTROLLER FUNCTIONS
  @override
  void onInit() async {
    obtainAdmins();
    obtainUsers();
    obtainAffiliate();
    obtainCustomer();
    super.onInit();
  }

  Future<void> obtainUsers() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse(obtainUsersUrl),
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

  Future<void> obtainAdmins() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse(obtainAdminUrl),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listAdmins.value=users;
      // return users;
    }
    // return null;
  }

  Future<void> obtainAffiliate() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse(obtainAffiliateUrl),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listAffiliates.value=users;
      // return users;
    }
    // return null;
  }


  Future<void> obtainCustomer() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse(obtainCustomerUrl),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listCustomers.value=users;
      // return users;
    }
    // return null;
  }

  Future<void> updateUser() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };
  // print("${updateUserUrl}${editUser.value!.id}");
    final response = await http.put(
      Uri.parse("${updateUserUrl}${editUser.value!.id}"),
      headers: headers,
      body: jsonEncode(editUser.value!.toJson())
    );
    // debugPrint(response.body);
    if (response.statusCode == 200) {
      // print("${updateUserUrl}${editUser.value!.id}");
      // print("prueba");
      // print(editUser.value!.toJson());
      // print(response.body);
      // print("hecho update");
      Get.offNamedUntil('/home', (route) => false);
      // return users;
    }
    // return null;
  }

  Future<void> searchAdmin(String word) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse("${searchUserUrl}${word}"),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      print("prueba body search");
      print(response.body);
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listAdmins.value=users;
      // return users;
    }
    // return null;
  }
  Future<void> searchAffiliates(String word) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse("${searchUserUrl}${word}"),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      print("prueba body search");
      print(response.body);
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listAffiliates.value=users;
      // return users;
    }
    // return null;
  }
  Future<void> searchCustomers(String word) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer null'
    };

    final response = await http.get(
      // Uri.parse('https://v2.banipay.me/api/auth/api/user/?_='),
      Uri.parse("${searchUserUrl}${word}"),
      headers: headers,
      // body: jsonEncode(user.toJson())
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<User> users=[];
      print("prueba body search");
      print(response.body);
      for(var unitUser in jsonDecode(response.body)){
        users.add(User.fromJson(unitUser));
      }
      listCustomers.value=users;
      // return users;
    }
    // return null;
  }
}
