import 'package:banipay_comercial/services/authentication_service.dart';
import 'package:banipay_comercial/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'controllers/user_data_controller.dart';
import 'routes/routes.dart' as routes;

void main()async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>with WidgetsBindingObserver {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    Get.put<UserDataController>(UserDataController(), permanent: true);
    Get.put<AuthController>(
        AuthController(authenticationService: AuthenticationService()));
  }
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BaniPay',
      debugShowCheckedModeBanner: false,
      theme: globalTheme(),
      getPages: routes.routes,
      initialRoute: '/splash',
    );
  }
}

