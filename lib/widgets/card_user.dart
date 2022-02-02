import 'package:banipay_comercial/models/user_account.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  User user;
  CardUser( this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      child: Column(
        children: [
          Text(user.email),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]),
    );
  }
}
