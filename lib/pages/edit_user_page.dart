import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
// import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EditUserPage extends StatelessWidget {
  final UsersController _usersController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textSecondColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0,left: 20,top: 30,bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Text("prueba edit",style: TextStyles.buttonTextStyle,)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].email,
                            labelText: "Email",icon: Icons.email
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                          if(isNumeric(value) == null){
                            return "Numero no válido";
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].phone,
                            labelText: "Teléfono",icon: Icons.phone_android
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                          if(isNumeric(value) == null){
                            return "Numero no válido";
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].documentNumber,
                            labelText: "Ci",icon: Icons.credit_card
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalName,
                            labelText: "Nombre Legal",icon: Icons.drive_file_rename_outline
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                          if(isNumeric(value) == null){
                            return "Numero no válido";
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.nit,
                            labelText: "NIT",icon: Icons.picture_as_pdf
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalAddress,
                            labelText: "Dirección",icon: Icons.drive_file_rename_outline
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                          if(isNumeric(value) == null){
                            return "Numero no válido";
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.contactNumber,
                            labelText: "Telf. Contacto",icon: Icons.phone
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.reportEmail,
                            labelText: "Email Empresa",icon: Icons.email
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                          if(isNumeric(value) == null){
                            return "Numero no válido";
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberBolivian,
                            labelText: "N° cuenta Boliviana",icon: Icons.account_balance
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bolivianBank,
                            labelText: "Banco",icon: Icons.food_bank_sharp
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value){},
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return 'Por favor llene este campo';
                          }
                        },
                        decoration: InputDecorations.authInputDecoration(
                            hintText: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.industry,
                            labelText: "Industria",icon: Icons.business
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height*0.11,
                width: Get.width,
                // color: textColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                        onPressed: (){},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // minWidth: Get.width*0.9,

                      color: royalPurple,
                      elevation: 0,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Guardar",style: TextStyles.buttonTextStyle,),
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        Get.back();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // minWidth: Get.width*0.9,

                      color: royalPurple,
                      elevation: 0,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Cancelar",style: TextStyles.buttonTextStyle,),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

int? isNumeric(String s) {
  try
  {
    return int.parse(s);
  }
  catch(e){
    return null;
  }
}