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
  final typeDocumentInput = Rx<ButtonSelectOption?>(null);
  final listUsers=Rx<List<UserSelection>>([]);
  final listTypeDocument=Rx<List<UserSelection>>([]);
  final createUser=Rx<User>(User.initEmpty());

  //Direction of EndPoints
  String createUserUrl =
      dotenv.env['BASE_API_HOST']! + dotenv.env['CREATE_USER']!;

  @override
  void onInit() {
    initUsers();
    initTypeDocument();
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
  void initTypeDocument() {
    listTypeDocument.value = [
      UserSelection(
          index: 1,
          name: "CI",
          role: "ci"
      ),
      UserSelection(
          index: 1,
          name: "PASAPORTE",
          role: "pasaporte"
      ),
      UserSelection(
          index: 1,
          name: "NIT",
          role: "nit"
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
     // createUser.value.authority=Authority(id: "");
  }
  void addAuthority(){
    createUser.value.authority=Authority(id: "");
  }

  Future<bool> creatUserEndpoint() async {
    // final encodedCard = encodeCard(cardNumberInput.value, monthInput.value,
    //     yearInput.value.substring(2, yearInput.value.length));
    var headers = {'Content-Type': 'application/json'};
    var body2 = json.encode(
      createUser.value.toJson()
    );
    var response = await http.post(
        Uri.parse(createUserUrl),
        headers: headers,
        body: body2);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if(response.body.isEmpty){
        Get.snackbar("Registro incorrecto", "El correo, el número de documento o su teléfono ya fueron registrados, intente cambiarlos",);
      }else{
        print("Exito en la creacion de usuario");
        Get.offNamedUntil('/home', (route) => false);
      }
      return true;
    }
    return false;
  }
}



