import 'package:banipay_comercial/controllers/user_data_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
// import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/widgets/create_account_page_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EditUserPage extends StatelessWidget {
  final UsersController _usersController=Get.find();
  final UserDataController _userDataController=Get.find();
  TextEditingController _email=TextEditingController(text: "prueba");
  TextEditingController _firstName=TextEditingController();
  TextEditingController _lastName=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _ci=TextEditingController();
  TextEditingController _legalName=TextEditingController();
  TextEditingController _nit=TextEditingController();
  TextEditingController _address=TextEditingController();
  TextEditingController _contactPhone=TextEditingController();
  TextEditingController _businessEmail=TextEditingController();
  TextEditingController _bolivianAccount=TextEditingController();
  TextEditingController _bank=TextEditingController();
  TextEditingController _industry=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textSecondColor,
      body: CreateAccountPageBackground(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0,left: 20,top: 30,bottom: 5),
                      child: Form(
                        key: _usersController.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const Text("prueba edit",style: TextStyles.buttonTextStyle,)
                            TextFormField(
                              // controller: _email,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.email,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.email=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Email:",icon: Icons.email
                              ),
                            ),
                            TextFormField(
                              // controller: _firstName,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.firstName,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.firstName=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Nombre:",icon: Icons.drive_file_rename_outline
                              ),
                            ),
                            TextFormField(
                              // controller: _lastName,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.lastName,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.lastName=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Apellido:",icon: Icons.drive_file_rename_outline
                              ),
                            ),
                            TextFormField(
                              // controller: _phone,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.phone,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                if(isNumeric(value) == null){
                                  return "Numero no válido";
                                }
                                _usersController.editUser.value!.phone=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText:"",
                                  labelText: "Teléfono:",icon: Icons.phone_android
                              ),
                            ),
                            TextFormField(
                              // controller: _ci,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.documentNumber,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                if(isNumeric(value) == null){
                                  return "Numero no válido";
                                }
                                _usersController.editUser.value!.documentNumber=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText:"",
                                  labelText: "Ci:",icon: Icons.credit_card
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _legalName,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.legalName,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.affiliate!.legalName=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Nombre Legal:",
                                  icon: Icons.drive_file_rename_outline
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _nit,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.nit,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                if(isNumeric(value) == null){
                                  return "Numero no válido";
                                }
                                _usersController.editUser.value!.affiliate!.nit=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "NIT:",icon: Icons.picture_as_pdf
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id =="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id =="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _address,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.legalAddress,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.affiliate!.legalAddress=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Dirección:",
                                  icon: Icons.drive_file_rename_outline
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _contactPhone,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.contactNumber,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                if(isNumeric(value) == null){
                                  return "Numero no válido";
                                }
                                _usersController.editUser.value!.affiliate!.contactNumber=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Telf. Contacto:",
                                  icon: Icons.phone
                              ),
                            ),
                           ( _usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _businessEmail,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.reportEmail,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.affiliate!.reportEmail=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Email de Empresa:",
                                  icon: Icons.email
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _bolivianAccount,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.bankAccountNumberBolivian,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                if(isNumeric(value) == null){
                                  return "Numero no válido";
                                }
                                _usersController.editUser.value!.affiliate!.bankAccountNumberBolivian=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "N° cuenta Boliviana:",
                                  icon: Icons.account_balance
                              ),
                            ),
                            (_usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _bank,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.bolivianBank,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.affiliate!.bolivianBank=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Banco:",
                                  icon: Icons.food_bank_sharp
                              ),
                            ),
                           ( _usersController.editUser.value!.authority!.id=="ROLE_CUSTOMER"
                                || _usersController.editUser.value!.authority!.id=="ROLE_SELLER")?
                            const SizedBox.shrink():
                            TextFormField(
                              // controller: _industry,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              initialValue: _usersController.editUser.value!.affiliate==null?""
                                  :_usersController.editUser.value!.affiliate!.industry,
                              onChanged: (value){},
                              validator: (value){
                                if(value==null || value.trim().isEmpty){
                                  return 'Por favor llene este campo';
                                }
                                _usersController.editUser.value!.affiliate!.industry=value;
                              },
                              decoration: InputDecorations.createInputDecoration(
                                  hintText: "",
                                  labelText: "Tipo de industria:",
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
            ),
            Container(
              height: Get.height*0.11,
                  width: Get.width,
                  // color: textColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                          onPressed: (){
                            FocusScope.of(context).requestFocus(FocusNode());
                            _usersController.editUser.value!.authority!.id=="ROLE_ADMIN"?
                            {
                              if(_usersController.formKey.currentState!.validate()){
                                print("Prueba update correo ${_usersController.editUser.value!.affiliate!.industry}")
                              }
                            }
                                :
                            Get.back();
                            // _usersController.updateUser();
                            },
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
                          FocusScope.of(context).requestFocus( FocusNode());
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