import 'package:banipay_comercial/controllers/auth_controller.dart';
import 'package:banipay_comercial/controllers/users_controller.dart';
import 'package:banipay_comercial/theme/colors.dart';
import 'package:banipay_comercial/theme/text_styles.dart';
import 'package:banipay_comercial/widgets/card_user.dart';
import 'package:banipay_comercial/widgets/search_bar.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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
  ScrollController _scrollViewController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Get.height*0.08,
                width: Get.width*0.96,
                child: SearchBar(
                  icon: Icons.search,
                  textSearch: "Busqueda por nombre",
                  searchInit: null,
                  searchType: SearchType.ON_CHANGED,
                  updateSearchQuery: (String newQuery){
                    //send the value to the backend
                    // setState(() {
                    if(newQuery!=""){
                      _usersController.searchAdmin(newQuery);
                    }else{
                      _usersController.obtainAdmins();
                    }
                    // });
                  },
                ),
              ),
              Obx((){
                return Expanded(
                  child: (_usersController.listAdmins().isNotEmpty)?
                  DraggableScrollbar.rrect(
                    controller: _scrollViewController,
                      // labelTextBuilder: (offset) => Text("${_usersController.listAdmins.value[(offset.floor()/24).floor()-1].lastName[0]}"),
                    // labelTextBuilder: (offset)=>Text("${offset.floor()}"),
                      labelTextBuilder: (offset) {
                        final int currentItem = _scrollViewController.hasClients
                            ? (_scrollViewController.offset / _scrollViewController.position.maxScrollExtent * (_usersController.listAdmins.value.length-1)).floor()
                            : 0;

                        return _usersController.listAdmins.value[currentItem].lastName.isNotEmpty?
                        Text(_usersController.listAdmins.value[currentItem].lastName[0],
                          style: TextStyles.buttonTextStyle,):const Text(".",style: TextStyles.buttonTextStyle);
                          // Text("${_usersController.listAdmins.value[currentItem].lastName[0]}",
                        // style: TextStyles.buttonTextStyle,);
                        // return Text("$currentItem");
                      },
                      backgroundColor: coolCyan,
                    child:
                    ListView.builder(
                        controller: _scrollViewController,
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
                    )):
                    Center(
                        child: Container(
                          child: const Text("Aún no se tienen administradores registrados",
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

    );
  }
}
