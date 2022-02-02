import 'package:banipay_comercial/controllers/user_data_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/models/user_credentials.dart';
import 'package:banipay_comercial/persistent_data/credentials_data.dart';
import 'package:banipay_comercial/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController with CredentialData {

  //SERVICE
  final AuthenticationService authenticationService;
  AuthController({required this.authenticationService});

  //OTHER CONTROLLERS
  final UserDataController _userDataController = Get.find();


  String authUrl =
      dotenv.env['BASE_API_HOST']! + ':' + dotenv.env['LOGIN_PORT']!;

  //CONTROLLER FUNCTIONS
  @override
  void onInit() async {
    checkLogin();
    super.onInit();
  }


  Future<void> checkLogin() async {
    print("check");
    await GetStorage.init('Credentials');
    try {
      UserCredentials? credentials = getCredentialData();
      if (credentials != null) {
        UserAccount? user = await authenticationService.login(credentials);
        if (user != null) {
          await _userDataController.setUserAccount(user);
          Get.offNamedUntil('/home', (route) => false);
        } else {
          Get.offNamedUntil('/login', (route) => false);
        }
      } else {
        Get.offNamedUntil('/login', (route) => false);
      }
    } catch (e) {
      Get.offNamedUntil('/login', (route) => false);
    }
  }

  logout() async {
    await removeCredentialData();
  }

  Future<bool> login(UserCredentials userCredentials) async {
    try {
      UserAccount? user = await authenticationService.login(userCredentials);
      bool credentials = await saveCredentialData(userCredentials.email, userCredentials.password);
      if (user != null && credentials) {
        await _userDataController.setUserAccount(user);
        Get.offNamedUntil('/home', (route) => false);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
