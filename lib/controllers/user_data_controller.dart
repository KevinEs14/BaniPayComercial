import 'package:banipay_comercial/models/user_account.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {
  User loggedUserAccount = User(
    id: '',
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email',
    activated: false,
    documentNumber: '',
    documentType: '',
    imageUrl: '',
    password: '',
    phone: '',
  );

  get userAccount => loggedUserAccount;

  Future<void> setUserAccount(UserAccount loggedAccount) async {
    loggedUserAccount = loggedAccount.user;
    print(loggedUserAccount.id);
  }
}
