import 'package:banipay_comercial/controllers/create_user_controller.dart';
import 'package:banipay_comercial/models/button_select_option.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/widgets/button_select.dart';
import 'package:banipay_comercial/widgets/create_account_page_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateAccountPage extends StatefulWidget {
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateUserController _createUserController=Get.put<CreateUserController>(CreateUserController());
  int _typeUser=0;
  int _typeDocument=0;
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
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
  // bool _userSelected=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolCyan,
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
                        key: _createUserController.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx((){
                              return ButtonSelect(
                                size: Size(Get.width,50),
                                context: context,
                                onSelected: (ButtonSelectOption value){
                                  setState(() {
                                    _createUserController.userInput.value=value;
                                    // print(value.text);
                                    // print("Valor usuario: ${value.index}");
                                    if(value.text=="Administrador"){
                                      _typeUser=1;
                                      _createUserController.addAuthority();
                                    }else if(value.text=="Afiliado"){
                                      _typeUser=2;
                                      _createUserController.addAffiliate();
                                      _createUserController.addAuthority();
                                    }else if(value.text=="Cliente"){
                                      _typeUser=3;
                                      _createUserController.addAuthority();
                                    }else{_typeUser=0;}
                                  });

                                },
                                colorText: coolCyan,
                                colorBg: coolCyan2,
                                icon: Icons.person,
                                text: "Tipo de usuario",
                                list: _createUserController.listUsers.value.map((e) => ButtonSelectOption(e.index, e.name)).toList(),
                                selected: _createUserController.userInput.value,
                              );
                            }),
                            // const Text("prueba edit",style: TextStyles.buttonTextStyle,)
                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  // _createUserController.createUser.value!.email=_email.text;
                                  _createUserController.createUser.value.email=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Email: ",icon: Icons.email
                                ),
                              ),
                            ),

                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: TextFormField(
                                controller: _password,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                // initialValue: _usersController.editUser.value!.firstName,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.password=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Password:",icon: Icons.drive_file_rename_outline
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: TextFormField(
                                controller: _firstName,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                // initialValue: _usersController.editUser.value!.firstName,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.firstName=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Nombre:",icon: Icons.drive_file_rename_outline
                                ),
                              ),
                            ),

                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: TextFormField(
                                controller: _lastName,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                // initialValue: _usersController.editUser.value!.lastName,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.lastName=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Apellido:",icon: Icons.drive_file_rename_outline
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: TextFormField(
                                controller: _phone,
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
                                  _createUserController.createUser.value.phone=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText:"",
                                    labelText: " Teléfono: ",icon: Icons.phone_android
                                ),
                              ),
                            ),

                            Visibility(
                              visible: _typeUser==0?false:true,
                              child: Obx((){
                                return ButtonSelect(
                                  size: Size(Get.width,50),
                                  context: context,
                                  onSelected: (ButtonSelectOption value){
                                    setState(() {
                                      _createUserController.typeDocumentInput.value=value;
                                      // print(value.text);
                                      // print("Valor usuario: ${value.index}");
                                      if(value.text=="CI"){
                                        _typeDocument=1;
                                        _createUserController.createUser.value.documentType="Ci";
                                      }else if(value.text=="PASAPORTE"){
                                        _typeDocument=2;
                                        _createUserController.createUser.value.documentType="Pasaporte";
                                      }else if(value.text=="NIT"){
                                        _typeDocument=3;
                                        _createUserController.createUser.value.documentType="Nit";
                                      }else{_typeDocument=0;}
                                    });

                                  },
                                  colorText: coolCyan,
                                  colorBg: coolCyan2,
                                  icon: Icons.person,
                                  text: "Tipo de documento",
                                  list: _createUserController.listTypeDocument.value.map((e) => ButtonSelectOption(e.index, e.name)).toList(),
                                  selected: _createUserController.typeDocumentInput.value,
                                );
                              }),
                            ),

                            Visibility(
                              visible: _typeDocument==0?false:true,
                              child: TextFormField(
                                controller: _ci,
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
                                  _createUserController.createUser.value.documentNumber=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText:"",
                                    labelText: _typeDocument==1?"Ci:":
                                    _typeDocument==2?"Pasaporte:":"Nit:",icon: Icons.credit_card
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _legalName,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.affiliate!.legalName=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Nombre Legal: ",
                                    icon: Icons.drive_file_rename_outline
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _nit,
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
                                  _createUserController.createUser.value.affiliate!.nit=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "NIT: ",icon: Icons.picture_as_pdf
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _address,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.affiliate!.legalAddress=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Dirección: ",
                                    icon: Icons.drive_file_rename_outline
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _contactPhone,
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

                                  _createUserController.createUser.value.affiliate!.contactNumber=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Telf. Contacto:",
                                    icon: Icons.phone
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _businessEmail,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.affiliate!.reportEmail=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Email de Empresa: ",
                                    icon: Icons.email
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _bolivianAccount,
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
                                  _createUserController.createUser.value.affiliate!.bankAccountNumberBolivian=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "N° cuenta Boliviana: ",
                                    icon: Icons.account_balance
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _bank,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.affiliate!.bolivianBank=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Banco: ",
                                    icon: Icons.food_bank_sharp
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _typeUser==2?true:false,
                              child: TextFormField(
                                controller: _industry,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.done,
                                onChanged: (value){},
                                validator: (value){
                                  if(value==null || value.trim().isEmpty){
                                    return 'Por favor llene este campo';
                                  }
                                  _createUserController.createUser.value.affiliate!.industry=value;
                                },
                                decoration: InputDecorations.createInputDecoration(
                                    hintText: "",
                                    labelText: "Tipo de industria: ",
                                    icon: Icons.business
                                ),
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
                      FocusScope.of(context).requestFocus( FocusNode());
                      // print(_email.text);
                      setState(() {
                        _typeUser==1?
                        {
                          if(_createUserController.formKey.currentState!.validate()){
                            _createUserController.createUser.value!.affiliate=null,
                            _createUserController.createUser.value.imageUrl=null,
                            _createUserController.createUser.value.authority!.id="ROLE_ADMIN",
                            _createUserController.creatUserEndpoint(),
                            // print("Prueba update correo ${_createUserController.createUser.value.affiliate!.legalName}"),
                            // print("Prueba update correo ${_createUserController.createUser.value.affiliate!.industry}"),
                          }else{Get.snackbar("Acción indebida", "Llene todos los campos",)}
                        }
                            :
                        _typeUser==2?
                        {
                          if(_createUserController.formKey.currentState!.validate()){
                            _createUserController.createUser.value.affiliate!.id=null,
                            _createUserController.createUser.value.imageUrl=null,
                            _createUserController.createUser.value.authority!.id="ROLE_SELLER",
                            _createUserController.creatUserEndpoint(),
                            // print("Prueba update correo ${_createUserController.createUser.value.email}")
                          }else{Get.snackbar("Acción indebida", "Llene todos los campos",)}
                        }
                        :
                        _typeUser==3?
                        {
                          if(_createUserController.formKey.currentState!.validate()){
                            _createUserController.createUser.value.authority!.id="ROLE_CUSTOMER",
                            _createUserController.createUser.value.imageUrl=null,
                            _createUserController.createUser.value!.affiliate=null,
                            _createUserController.creatUserEndpoint(),
                            // print("Prueba update correo ${_createUserController.createUser.value.email}")
                          }else{Get.snackbar("Acción indebida", "Llene todos los campos",)}
                        }
                        :
                        Get.snackbar("Acción indebida", "Seleccione un usuario y llene todos los campos",);
                        // print("Dato creado: ${ _createUserController.createUser.value.email}");
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    // minWidth: Get.width*0.9,

                    color: coolCyan2,
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

                    color: coolCyan2,
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