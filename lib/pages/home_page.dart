import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersController _usersController=Get.put<UsersController>(UsersController());
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Obx((){
            return Container(
              child: (_usersController.listUsers().isNotEmpty)?
              ListView.builder(
                  itemCount: _usersController.listUsers().length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){},
                      child: CardUser(_usersController.listUsers.value[index]),
                    );
                  }
              ):
              Container(child: Text("Fracaso"),),
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              _authController.logout();
              Get.offNamedUntil('/login', (route) => false);
            },
            heroTag:'Tag1',
            elevation: 5,
            backgroundColor: royalPurple,
            child: const Icon(Icons.exit_to_app,color: textSecondColor,),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){},
            heroTag:'Tag2',
            elevation: 5,
            backgroundColor: royalPurple,
            child: const Icon(Icons.add,color: textSecondColor,),
          ),
        ],
      )

    );
  }
}
