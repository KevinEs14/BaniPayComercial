import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificUserPage extends StatelessWidget{
  final UsersController _usersController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: royalPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height*0.1,),
          Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
            child: CircleAvatar(
              radius: Get.height * 0.075,
              backgroundImage: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!=null
                  // || _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.imageUrl!=null
                  ?
              NetworkImage(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.imageUrl!):
              NetworkImage(("https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo.png")),
            ),
          ),
          const SizedBox(height: 20,),
          Text("${_usersController.listUsers.value[_usersController.indexUser.value].firstName} ${_usersController.listUsers.value[_usersController.indexUser.value].lastName}",style: TextStyles.title2Style,),
          // const SizedBox(height: 5,),
          // Text(_usersController.listUsers.value[_usersController.indexUser.value].email,style: TextStyles.buttonTextStyle,),
          // const SizedBox(height: 5,),
          // Text(_usersController.listUsers.value[_usersController.indexUser.value].phone,style: TextStyles.buttonTextStyle,),
          const SizedBox(height: 15,),
          // Container(
          //   // color: greyColor,
          //   height: Get.height*0.4,
          //   width: Get.width,
          //   child: Text(_usersController.indexUser.value.toString()),
          // ),
          Expanded(
            flex: 3,
            child: _usersController.listUsers.value[_usersController.indexUser.value].affiliate!=null?
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                color: textSecondColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 20,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     MaterialButton(
                  //         onPressed: (){},
                  //       shape: CircleBorder(),
                  //       // minWidth: Get.width*0.9,
                  //       color: royalPurple,
                  //       elevation: 0,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: const Icon(Icons.edit,color: textSecondColor,size: 35),
                  //       ),
                  //         ),
                  //   ],
                  // ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Email: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].email.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].email,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noEmail,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Teléfono: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].phone.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].phone,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noPhone,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${_usersController.listUsers.value[_usersController.indexUser.value].documentType}: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].documentNumber.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].documentNumber,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noDocumentNumber,style: TextStyles.commentsStyle,),

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Nombre Legal: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalName.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalName,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noLegalName,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("NIT: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.nit.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.nit,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noNit,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dirección: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalAddress.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.legalAddress,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noAddress,style: TextStyles.commentsStyle,),
                    ],
                  ),

                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Telf. contacto: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.contactNumber.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.contactNumber,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noPhoneContact,style: TextStyles.commentsStyle,),
                    ],
                  ),

                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Email Empresa: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.reportEmail.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.reportEmail,style: TextStyles.commentsStyle,):
                      const Text(Strings.noEnterpriseEmail,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("N° cuenta Boliviana: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberBolivian.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberBolivian,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noBankAccountNumberBolivian,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Banco: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bolivianBank.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bolivianBank,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noBank,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  // const SizedBox(height: 5,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("Número de cuenta en Dólares: ",style: TextStyles.labelTextStyle,),
                  //     (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberUsDollar.isNotEmpty)?
                  //     Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberUsDollar,style: TextStyles.commentsStyle,)
                  //         :
                  //     const Text(Strings.noBankAccountNumberBolivian,style: TextStyles.commentsStyle,),
                  //   ],
                  // ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Industria: ",style: TextStyles.labelTextStyle,),
                      (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.industry.isNotEmpty)?
                      Text(_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.industry,style: TextStyles.commentsStyle,)
                          :
                      const Text(Strings.noLegalName,style: TextStyles.commentsStyle,),
                    ],
                  ),
                  const SizedBox(height: 15,),
                ],
              ),
            )
            :
              Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    color: textSecondColor,
                    ),
                child: const Center(
                    child: Text(Strings.noEnterprise,style: TextStyles.labelTextStyle,)
                ),
                )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed("/edit-user");
        },
        elevation: 5,
        backgroundColor: royalPurple,
        child: const Icon(Icons.edit,color: textSecondColor,),
      ),
    );
  }
}
  