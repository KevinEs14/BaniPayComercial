
import 'package:banipay_comercial/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: Get.height * 0.07,
                margin: const EdgeInsets.only(top: 3),
                child: Image.asset('assets/images/appbar_label.png')),

            SizedBox(
              height: Get.height*0.05,
              width: Get.height*0.05,
              child:
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(royalPurple)),
            ),
          ],
        ),
      ),
    );
  }
}
