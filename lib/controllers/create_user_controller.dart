import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:banipay_comercial/models/button_select_option.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/models/user_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;

class CreateUserController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final userInput = Rx<ButtonSelectOption?>(null);
  final listUsers=Rx<List<UserSelection>>([]);
  final createUser=Rx<User>(User.initEmpty());

  //Direction of EndPoints
  String createUserUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['CREATE_USER']!;

  @override
  void onInit() {
    initUsers();
    super.onInit();
  }

  void initUsers() {
    listUsers.value = [
      UserSelection(
          index: 1,
          name: "Administrador",
          role: "ROLE_ADMIN"
      ),
      UserSelection(
          index: 1,
          name: "Vendedor",
          role: "ROLE_SELLER"
      ),
      UserSelection(
          index: 1,
          name: "Cliente",
          role: "ROLE_CUSTOMER"
      ),
    ];
  }

  UserSelection getUser(int index) {
    return listUsers.value.firstWhere((element) => element.index == index);
  }

  void addAffiliate(){
     createUser.value.affiliate=Affiliate(
      id: '',
      legalName: '',
      nit: '',
      legalAddress: '',
      contactNumber: '',
      reportEmail: '',
      industry: '',
      imageUrl: '',
      activated: true,
      withInvoice: true,
      bankAccountNumberBolivian: '',
      bolivianBank: '',
      bankAccountNumberUsDollar: '',
      idCommercial: '',
      createdAt: '',
      usDollarBank: ''
    );
  }

  Future<bool> creatUserEndpoint() async {
    // final encodedCard = encodeCard(cardNumberInput.value, monthInput.value,
    //     yearInput.value.substring(2, yearInput.value.length));
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      createUser.toJson()
    });
    var request = await http.post(
        Uri.parse(createUserUrl),
        headers: headers,
        body: body);
    if (request.statusCode == 200 || request.statusCode == 201) {
      print("Exito en la creacion de usuario");
      return true;
    }
    return false;
  }
}



