//tela contem espaço para cadastro e cleber
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: 328,
          height: 193,
          decoration: ShapeDecoration(
            color: Color(0xFF262A2B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Image.asset("images/uff.jpg", fit: BoxFit.cover),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Align(
          alignment: FractionalOffset.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Image.asset(
              "images/logouff.png",
              width: 208.57,
              height: 214.14,
            ),
          ),
        ),
      ],
    ));
  }
}
