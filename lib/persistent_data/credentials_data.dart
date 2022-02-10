import 'package:banipay_comercial/models/user_credentials.dart';
import 'package:get_storage/get_storage.dart';

mixin CredentialData {
  Future<bool> saveCredentialData(String? email, String? password) async {
    final credential = GetStorage('Credentials');
    await credential.write('email', email);
    await credential.write('password', password);
    // await credential.write('firstName', firstName);
    // await credential.write('lastName', lastName);
    return true;
  }

  UserCredentials? getCredentialData() {
    final credential = GetStorage('Credentials');
    if(credential.read("email")==null||credential.read("password")==null){
      return null;
    }
    else{
      UserCredentials credentials=UserCredentials(
          credential.read('email'),
          credential.read('password')
          // credential.read('firstName'),
          // credential.read('lastName')
      );
      return credentials;
    }
  }

  Future<void> removeCredentialData() async {
    final credential = GetStorage('Credentials');
    await credential.remove('email');
    await credential.remove('password');
    // await credential.remove('firstName');
    // await credential.remove('lastName');
  }
}

enum CacheManagerKey { TOKEN }