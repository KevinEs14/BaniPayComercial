import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/user_data_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/widgets/auth_background.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:banipay_comercial/widgets/home_page_background.dart';
import 'package:banipay_comercial/widgets/type_users_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersController _usersController=Get.put<UsersController>(UsersController());
  final AuthController _authController = Get.find();
  final UserDataController _userDataController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolCyan,
      body: HomePageBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                // color: Colors.grey.withOpacity(0.2),
              ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¬°Bienvenido!',
                      style: GoogleFonts.titilliumWeb(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5,),
                    Text("${_userDataController.loggedUserAccount.firstName} ${_userDataController.loggedUserAccount.lastName}",
                      style: GoogleFonts.titilliumWeb(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text("Selecciona el tipo de usuario que desees",
                      style: GoogleFonts.titilliumWeb(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 90,),
                    _userDataController.loggedUserAccount.authority!.id=="ROLE_CUSTOMER"?
                    const SizedBox.shrink():
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TypeUsersCard(
                            iconSource: Icons.admin_panel_settings,
                            name: "Administradores",
                          onPressed: (){Get.toNamed("/admin");},
                        ),
                        TypeUsersCard(
                            iconSource: Icons.business,
                            name: "Afiliados",
                            onPressed: (){Get.toNamed("/affiliate");},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    _userDataController.loggedUserAccount.authority!.id=="ROLE_ADMIN"?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TypeUsersCard(
                            iconSource: Icons.person,
                            name: "Clientes",
                            onPressed: (){Get.toNamed("/customer");},
                        ),
                      ],
                    ):
                    const SizedBox.shrink(),
                  ],
                ),
              ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _userDataController.loggedUserAccount.authority!.id=="ROLE_CUSTOMER"?
          const SizedBox.shrink():
          FloatingActionButton(
            onPressed: (){Get.toNamed("/create-account");},
            heroTag:'Tag2',
            elevation: 5,
            backgroundColor: coolCyan2,
            child: const Icon(Icons.add,color: textSecondColor),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              _authController.logout();
              Get.offNamedUntil('/login', (route) => false);
            },
            heroTag:'Tag1',
            elevation: 5,
            backgroundColor: coolCyan2,
            child: const Icon(Icons.exit_to_app,color: textSecondColor,),
          ),

        ],
      )

    );
  }
}
