import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:banipay_comercial/theme/colors.dart' as colors;
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateAccountPageBackground extends StatelessWidget {
  const CreateAccountPageBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [_PurpleBox(), child],
        // children: [_PurpleBox(), _HeaderIcon(), child],
      ),
    );
  }
}

// class _HeaderIcon extends StatelessWidget {
//   const _HeaderIcon({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         margin: const EdgeInsets.only(top: 15),
//         width: double.infinity,
//         height: 90,
//         child: Container(
//           width: 100,
//           child: Image.asset(
//             'assets/images/white_logo.png',
//           ),
//         ),
//       ),
//     );
//   }
// }

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _purpleBoxDecoration(),
      child: Stack(
        children: const [
          Positioned(top: 280, left: 30, child: _Bubble()),
          Positioned(top: -40, left: -30, child: _Bubble()),
          Positioned(top: 80, right: 20, child: _Bubble()),
          Positioned(bottom: -50, left: 10, child: _Bubble()),
          Positioned(bottom: 120, right: 20, child: _Bubble()),
        ],
      ),
    );
  }

  BoxDecoration _purpleBoxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0)),
    color: colors.textSecondColor);
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.2)
          // color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}
