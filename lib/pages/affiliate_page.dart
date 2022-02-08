import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AffiliatePage extends StatefulWidget {
  @override
  State<AffiliatePage> createState() => _AffiliatePageState();
}

class _AffiliatePageState extends State<AffiliatePage> {
  // final UsersController _usersController=Get.put<UsersController>(UsersController());
  final UsersController _usersController=Get.find();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        body: Obx((){
          return Container(
            child: (_usersController.listAffiliates().isNotEmpty)?
            ListView.builder(
                itemCount: _usersController.listAffiliates().length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      // _usersController.indexAffiliate.value=index;
                      _usersController.editUser.value=_usersController.listAffiliates.value[index];
                      Get.toNamed("/specific-user");
                      // print("prueba objeto");
                      // print(_usersController.editUser.value);
                    },
                    child: CardUser(_usersController.listAffiliates.value[index]),
                  );
                }
            ):
            Center(
                child: Container(
                  child: const Text("Aún no se tienen afiliados registrados",
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
