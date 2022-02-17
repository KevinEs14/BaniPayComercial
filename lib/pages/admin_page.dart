import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // final UsersController _usersController=Get.put<UsersController>(UsersController());
  final UsersController _usersController=Get.find();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        body: Obx((){
          return Container(
            child: (_usersController.listAdmins().isNotEmpty)?
            ListView.builder(
                itemCount: _usersController.listAdmins().length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      // _usersController.indexAdmin.value=index;
                      _usersController.editUser.value=_usersController.listAdmins.value[index];
                      print("id: ${_usersController.listAffiliates.value[index].id}");
                      Get.toNamed("/specific-user");
                    },
                    child: CardUser(_usersController.listAdmins.value[index]),
                  );
                }
            ):
            Center(
                child: Container(
                  child: const Text("Aún no se tienen administradores registrados",
                    style: TextStyles.labelTextStyle,),
                )
            ),
          );
        }),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: (){
        //         _authController.logout();
        //         Get.offNamedUntil('/login', (route) => false);
        //       },
        //       heroTag:'Tag1',
        //       elevation: 5,
        //       backgroundColor: coolCyan,
        //       child: const Icon(Icons.exit_to_app,color: textSecondColor,),
        //     ),
        //     const SizedBox(height: 10,),
        //     FloatingActionButton(
        //       onPressed: (){},
        //       heroTag:'Tag2',
        //       elevation: 5,
        //       backgroundColor: coolCyan,
        //       child: const Icon(Icons.add,color: textSecondColor,),
        //     ),
        //   ],
        // )

    );
  }
}
