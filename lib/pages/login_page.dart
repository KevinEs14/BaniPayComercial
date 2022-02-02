import 'package:banipay_comercial/controllers/login_controller.dart';
import 'package:banipay_comercial/ui/input_decorations.dart';
import 'package:banipay_comercial/widgets/auth_background.dart';
import 'package:banipay_comercial/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banipay_comercial/theme/colors.dart' as colors;

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.3),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      '¡Bienvenido!',
                      style: GoogleFonts.titilliumWeb(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: Colors.grey[400]),
                    ),
                    SizedBox(height: 30),
                    _LoginForm()
                  ],
                ),
              ),
              // SizedBox(height: 50),
              // Text(
              //   '¿Olvidaste tu contraseña?',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 15),
              //
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       '¿No tienes una cuenta?',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey[600]),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         Get.toNamed("/sign-up");
              //       },
              //       child: Text(
              //         '     Crear cuenta',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 50)
            ],
          ),
        ),
      )),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final LoginController _loginController=Get.put<LoginController>(LoginController());
  bool _waiting=false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginController.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'tucorreo@electrónico.com',
                  labelText: 'Correo electrónico',
                  icon: Icons.alternate_email),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                if (regExp.hasMatch(value ?? '')) {
                  _loginController.setEmail(value);
                  return null;
                } else {
                  return 'El correo no es correcto';
                }
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '****',
                  labelText: 'Contraseña',
                  icon: Icons.lock_outline),
              validator: (value) {
                if (value != null && value.length >= 5) {
                  _loginController.setPassword(value);

                  return null;
                }
                return 'La contraseña debe tener por lo menos 5 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                onPressed: () async {
                  if (_loginController.isValidForm()) {
                    setState(() {
                      _waiting=true;
                    });
                    await _loginController.loginForm();

                    setState(() {
                      _waiting=false;
                    });
                  }
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 0,
                color: colors.royalPurple,
                minWidth: Get.width*0.5,
                height: 50,

              child: _waiting==true?Container(
                      height: 20,
                      width: 20,
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                  ):Container(
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            )
          ],
        ));
  }
}
