import 'package:banipay_comercial/controllers/user_data_controller.dart';
import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/models/user_credentials.dart';
import 'package:banipay_comercial/persistent_data/credentials_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginController extends GetxController with CredentialData {
  LoginController();

  //OTHER CONTROLLERS
  final UserDataController _userDataController = Get.find();
  final AuthController _authController=Get.find();

  //VARIABLES
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email = '';
  get getEmail => _email;
  void setEmail(email) => _email = email;

  String _password = '';
  get getPassword => _password;
  void setPassword(password) => _password = password;

  String authUrl =
      dotenv.env['BASE_API_HOST']! + ':' + dotenv.env['LOGIN_PORT']!;

  //CONTROLLER FUNCTIONS


  //FUNCTIONS
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }


  Future<bool> loginForm() async {
      UserCredentials userCredentials = UserCredentials(getEmail, getPassword);
      bool user = await _authController.login(userCredentials);
      return user;
  }
}
