import 'dart:ui';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MyApp funcoes = MyApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("images/uff.jpg", fit: BoxFit.cover),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Image.asset(
                    "images/logouff.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0XFF262A2B).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Container(
                        width: 300,
                        height: 190,
                        decoration: ShapeDecoration(
                          color: Color(0xFF262A2B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        child: funcoes.criaBotao(
                            "Entrar", Color(0xFF0F62AC), 300, 80, () => {})),
                    GestureDetector(
                      onTap: () {
                        print("teste");
                      },
                      child: Text(
                        'Fazer cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70, bottom: 10, left: 200),
                child: GestureDetector(
                  onTap: () {
                    print("Texto 'Convidado' foi clicado!");
                  },
                  child: Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF262A2B),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        'Convidado',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
