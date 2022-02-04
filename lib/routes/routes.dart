
import 'package:banipay_comercial/pages/edit_user_page.dart';
import 'package:banipay_comercial/pages/home_page.dart';
import 'package:banipay_comercial/pages/login_page.dart';
import 'package:banipay_comercial/pages/specific_user_page.dart';
import 'package:banipay_comercial/pages/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: '/splash',
    page: () => SplashScreen(),
  ),
  GetPage(
    name: '/login',
    page: () => LoginPage(),
  ),
  GetPage(
    name: '/home',
    page: () => HomePage(),
  ),
  GetPage(
    name: '/specific-user',
    page: () => SpecificUserPage()
  ),
  GetPage(
      name: '/edit-user',
      page: () => EditUserPage()
  ),
];
