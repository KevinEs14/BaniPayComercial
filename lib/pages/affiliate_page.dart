import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/models/user_account.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:banipay_comercial/widgets/search_bar.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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
  ScrollController _scrollViewController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        _usersController.obtainAffiliate();
        return true;
      },
      child: Scaffold(
          backgroundColor: greyColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: Get.height*0.08,
                  width: Get.width*0.96,
                  child: SearchBar(
                    icon: Icons.search,
                    textSearch: "Búsqueda por nombre",
                    searchInit: null,
                    searchType: SearchType.ON_CHANGED,
                    updateSearchQuery: (String newQuery){
                      //send the value to the backend
                      if(newQuery!=""){
                        _usersController.searchAffiliates(newQuery);
                      }else{
                        _usersController.obtainAffiliate();
                      }
                    },
                  ),
                ),
                Obx((){
                  return Expanded(
                    child: (_usersController.listAffiliates().isNotEmpty)?
                    DraggableScrollbar.rrect(
                        controller: _scrollViewController,
                        // labelTextBuilder: (offset) => Text("${_usersController.listAdmins.value[(offset.floor()/24).floor()-1].lastName[0]}"),
                        // labelTextBuilder: (offset)=>Text("${offset.floor()}"),
                        labelTextBuilder: (offset) {
                          final int currentItem = _scrollViewController.hasClients
                              ? (_scrollViewController.offset / _scrollViewController.position.maxScrollExtent * (_usersController.listAffiliates.value.length-1)).floor()
                              : 0;

                          return _usersController.listAffiliates.value[currentItem].lastName.isNotEmpty?
                          Text(_usersController.listAffiliates.value[currentItem].lastName[0],
                            style: TextStyles.buttonTextStyle,):const Text(".",style: TextStyles.buttonTextStyle);
                            // Text("${_usersController.listAffiliates.value[currentItem].lastName[0]}",
                            // style: TextStyles.buttonTextStyle,);
                          // return Text("$currentItem");
                        },
                        backgroundColor: coolCyan,
                      child: ListView.builder(
                          controller: _scrollViewController,
                          itemCount: _usersController.listAffiliates().length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                // _usersController.indexAffiliate.value=index;
                                _usersController.editUser.value=_usersController.listAffiliates.value[index];
                                print("id: ${_usersController.listAffiliates.value[index].id}");
                                Get.toNamed("/specific-user");
                                // print("prueba objeto");
                                // print(_usersController.editUser.value);
                              },
                              child: CardUser(_usersController.listAffiliates.value[index]),
                            );
                          }
                      )):
                      Center(
                          child: Container(
                            child: const Text("Aún no se tienen afiliados registrados",
                              style: TextStyles.labelTextStyle,),
                          )
                      ),

                  );
                }),
              ],
            ),
          ),
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

      ),
    );
  }
}
