import 'package:banipay_comercial/controllers/create_user_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/widgets/create_account_page_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateAccountPage extends StatelessWidget {
  final CreateUserController _createUserController=Get.put<CreateUserController>(CreateUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolCyan,
      body: CreateAccountPageBackground(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20,top: 30,bottom: 5),
                    child: Form(
                      key: _createUserController.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Text("prueba edit",style: TextStyles.buttonTextStyle,)
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Email ",
                                labelText: "Email: ",icon: Icons.email
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                              if(isNumeric(value) == null){
                                return "Numero no válido";
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText:"Teléfono",
                                labelText: " Teléfono: ",icon: Icons.phone_android
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                              if(isNumeric(value) == null){
                                return "Numero no válido";
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText:"Ci ",
                                labelText: "Ci: ",icon: Icons.credit_card
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Nombre Legal ",
                                labelText: "Nombre Legal: ",
                                icon: Icons.drive_file_rename_outline
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                              if(isNumeric(value) == null){
                                return "Numero no válido";
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "NIT ",
                                labelText: "NIT: ",icon: Icons.picture_as_pdf
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Dirección ",
                                labelText: "Dirección: ",
                                icon: Icons.drive_file_rename_outline
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                              if(isNumeric(value) == null){
                                return "Numero no válido";
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Telf. Contacto ",
                                labelText: "Telf. Contacto:",
                                icon: Icons.phone
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Email de Empresa",
                                labelText: "Email de Empresa: ",
                                icon: Icons.email
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                              if(isNumeric(value) == null){
                                return "Numero no válido";
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "N° cuenta Boliviana ",
                                labelText: "N° cuenta Boliviana: ",
                                icon: Icons.account_balance
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Banco ",
                                labelText: "Banco: ",
                                icon: Icons.food_bank_sharp
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onChanged: (value){},
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return 'Por favor llene este campo';
                              }
                            },
                            decoration: InputDecorations.createInputDecoration(
                                hintText: "Tipo de industria ",
                                labelText: "Tipo de industria: ",
                                icon: Icons.business
                            ),
                          ),
                        ],
                      ),
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