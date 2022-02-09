import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:banipay_comercial/models/button_select_option.dart';
import 'package:banipay_comercial/models/user_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;

class CreateUserController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final bankInput = Rx<ButtonSelectOption?>(null);
  final listUsers=Rx<List<UserSelection>>([]);

  @override
  void onInit() {
    initUsers();
    super.onInit();
  }

  // Future<bool> saveCard() async {
  //   final encodedCard = encodeCard(cardNumberInput.value, monthInput.value,
  //       yearInput.value.substring(2, yearInput.value.length));
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = json.encode({
  //     "base": encodedCard,
  //     "user": _userDataController.loggedUserAccount.id
  //   });
  //   var request = await http.post(
  //       Uri.parse('https://v2.banipay.me/api/auth/api/user/details'),
  //       headers: headers,
  //       body: body);
  //   if (request.statusCode == 200 || request.statusCode == 201) {
  //     PaymentCard paymentCard = PaymentCard(
  //         cardNumberInput.value.substring(
  //             cardNumberInput.value.length - 4, cardNumberInput.value.length),
  //         "${monthInput.value}/${yearInput.value}",
  //         listBank.value.firstWhere(
  //             (element) => element.index == bankInput.value!.index));
  //     saveList(paymentCard);
  //     resetData();
  //     return true;
  //   }
  //   return false;
  // }


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


  // void initTransactionsList() async {
  //   double addAccount = 0;
  //   List<SimpleTransaction> transactions = [];
  //   var headers = {
  //     'Content-Type': 'application/json',
  //   };
  //
  //   if (_userDataController.loggedUserAccount.affiliate != null) {
  //     final response = await http.get(
  //         Uri.parse(
  //             'https://v2.banipay.me/api/pagos/customer/payments/${_userDataController.loggedUserAccount.affiliate!.id}'),
  //         headers: headers);
  //     if (response.statusCode == 200) {
  //       for (var data in jsonDecode(response.body)) {
  //         transactions.add(SimpleTransaction.fromJson(data));
  //         int paymentDate = SimpleTransaction.fromJson(data).dateTimestamp;
  //         int date = DateTime.now().millisecondsSinceEpoch;
  //         if (paymentDate >= (date - 86400000) && paymentDate <= date) {
  //           addAccount += SimpleTransaction.fromJson(data).paymentAmount;
  //         }
  //       }
  //       sumAccount.value = addAccount;
  //       transactionsList.value = transactions;
  //     }
  //     debugPrint(response.body);
  //   }
}



