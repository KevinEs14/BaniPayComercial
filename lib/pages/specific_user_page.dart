import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/ui/values/strings.dart';
import 'package:banipay_comercial/widgets/home_page_background.dart';
import 'package:banipay_comercial/widgets/specific_user_page_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificUserPage extends StatelessWidget{
  final UsersController _usersController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolCyan,
      body: SpecificUserPageBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height*0.1,),
            // Padding(
            //     padding: const EdgeInsets.only(top: 1),
            //   child:
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CircleAvatar(
                  radius: Get.height * 0.095,
                  // backgroundColor: Colors.transparent,
                  child: (_usersController.editUser.value!.imageUrl !=null)
                  // || _usersController.listUsers.value[_usersController.indexUser.value].affiliate!.imageUrl!=null
                      ?
                  Image.network(_usersController.editUser.value!.imageUrl!,fit: BoxFit.contain,):
                  Image.network("https://cdn-icons-png.flaticon.com/512/149/149071.png",
                      fit: BoxFit.contain),
                ),
              ),
            // ),
            const SizedBox(height: 20,),
            Text("${_usersController.editUser.value!.firstName} ${_usersController.editUser.value!.lastName}",style: TextStyles.title2Style,
              overflow: TextOverflow.ellipsis,),
            // const SizedBox(height: 5,),
            const SizedBox(height: 15,),
            Expanded(
              flex: 3,
              child: _usersController.editUser.value!.affiliate !=null?
              SingleChildScrollView(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    color: textSecondColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 55,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Email: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.email.isNotEmpty)?
                          Text(_usersController.editUser.value!.email,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noEmail,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Tel??fono: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.phone.isNotEmpty)?
                          Text(_usersController.editUser.value!.phone,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noPhone,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${_usersController.editUser.value!.documentType}: ",style: TextStyles.labelTextStyle,
                            overflow: TextOverflow.ellipsis,),
                          (_usersController.editUser.value!.documentNumber.isNotEmpty)?
                          Text(_usersController.editUser.value!.documentNumber,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noDocumentNumber,style: TextStyles.commentsStyle,),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Nombre Legal: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.legalName.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.legalName,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noLegalName,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("NIT: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.nit.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.nit,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noNit,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Direcci??n: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.legalAddress.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.legalAddress,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noAddress,style: TextStyles.commentsStyle,),
                        ],
                      ),

                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Telf. contacto: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.contactNumber.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.contactNumber,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noPhoneContact,style: TextStyles.commentsStyle,),
                        ],
                      ),

                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Email Empresa: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.reportEmail.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.reportEmail,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,):
                          const Text(Strings.noEnterpriseEmail,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("N?? cuenta Boliviana: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.bankAccountNumberBolivian.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.bankAccountNumberBolivian,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noBankAccountNumberBolivian,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Banco: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.bolivianBank.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.bolivianBank,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noBank,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("N?? cuenta en D??lares: ",style: TextStyles.labelTextStyle,),
                          // (_usersController.listUsers.value[_usersController.indexUser.value].affiliate!.bankAccountNumberUsDollar!.isNotEmpty)?
                          (_usersController.editUser.value!.affiliate!.bankAccountNumberUsDollar.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.bankAccountNumberUsDollar,
                            style: TextStyles.commentsStyle,overflow: TextOverflow.ellipsis,):
                          const Text(Strings.noBank,style: TextStyles.commentsStyle,),
                          //     :
                          // const Text(Strings.noBankAccountNumberBolivian,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Industria: ",style: TextStyles.labelTextStyle,),
                          (_usersController.editUser.value!.affiliate!.industry.isNotEmpty)?
                          Text(_usersController.editUser.value!.affiliate!.industry,style: TextStyles.commentsStyle,
                            overflow: TextOverflow.ellipsis,)
                              :
                          const Text(Strings.noLegalName,style: TextStyles.commentsStyle,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
              )
              :
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                      color: textSecondColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 55,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Email: ",style: TextStyles.labelTextStyle,),
                            (_usersController.editUser.value!.email.isNotEmpty)?
                            Text(_usersController.editUser.value!.email,style: TextStyles.commentsStyle,
                              overflow: TextOverflow.ellipsis,)
                                :
                            const Text(Strings.noEmail,style: TextStyles.commentsStyle,),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Tel??fono: ",style: TextStyles.labelTextStyle,),
                            (_usersController.editUser.value!.phone.isNotEmpty)?
                            Text(_usersController.editUser.value!.phone,style: TextStyles.commentsStyle,
                              overflow: TextOverflow.ellipsis,)
                                :
                            const Text(Strings.noPhone,style: TextStyles.commentsStyle,),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${_usersController.editUser.value!.documentType}: ",style: TextStyles.labelTextStyle,
                              overflow: TextOverflow.ellipsis,),
                            (_usersController.editUser.value!.documentNumber.isNotEmpty)?
                            Text(_usersController.editUser.value!.documentNumber,style: TextStyles.commentsStyle,
                              overflow: TextOverflow.ellipsis,)
                                :
                            const Text(Strings.noDocumentNumber,style: TextStyles.commentsStyle,),

                          ],
                        ),
                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // _usersController.editUser
          Get.toNamed("/edit-user");
        },
        elevation: 5,
        backgroundColor: coolCyan2,
        child: const Icon(Icons.edit,color: textSecondColor,),
      ),
    );
  }
}
  