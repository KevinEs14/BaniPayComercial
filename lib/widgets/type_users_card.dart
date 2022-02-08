import 'package:flutter/material.dart';
import 'package:banipay_comercial/theme/colors.dart' as colors;
import 'package:get/get.dart';

class TypeUsersCard extends StatelessWidget {
  final IconData iconSource;
  final String name;
  // final String description;
  VoidCallback? onPressed;

  TypeUsersCard({
    Key? key,
    required this.iconSource,
    required this.name,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(5),
                height: 80,
                child: Icon(iconSource,size: 80,color: colors.royalPurple,),
                // child: iconSource!=null?Icon(iconSource)
                //     :
                // Icon(Icons.supervised_user_circle)
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 8.0,top: 8.0,left: 3.0,right: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   description,
                        //   style: const TextStyle(fontWeight: FontWeight.w600),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
