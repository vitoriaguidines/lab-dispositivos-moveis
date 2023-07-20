import 'dart:ui';
import 'package:app_catalogo/interface/cadastro.dart';
import 'package:app_catalogo/interface/catalogo.dart';
import 'package:app_catalogo/interface/menu.dart';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_catalogo/interface/convvideos.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MyApp funcoes = MyApp();
  bool passwordVisible = false;

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
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: FractionalOffset.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
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
                            child: Column(
                              children: [
                                SizedBox(height: 20), // Espaço vertical
                                TextField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.all(16),
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 1,
                                  thickness: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Inter"),
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      color: Colors.grey,
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    alignLabelWithHint: false,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(16),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 1,
                                  thickness: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 25),
                            child: funcoes.criaBotao("Entrar",
                                Color(0xFF0F62AC), 300, 80, () => {})),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroPage()));
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
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 200),
                    child: GestureDetector(
                      onTap: () {
                        print("Texto 'Convidado' foi clicado!");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConvvideosPage()));
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF262A2B),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Convidado',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
