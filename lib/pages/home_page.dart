import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersController _usersController=Get.put<UsersController>(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Obx((){
        return Container(
          child: (_usersController.listUsers().isNotEmpty)?
          Container(child: Text("Exito"),):
          Container(child: Text("Fracaso"),),
        );
      })
    );
  }
}
