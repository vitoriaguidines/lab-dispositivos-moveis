import 'dart:ui';
import 'login.dart';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: funcoes.botaoRedondo(
                Icon(Icons.arrow_back), Color(0xFF0F62AC), 40, 40, () => {}),
          ),
          Column(
            children: [
              Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Image.asset(
                    "images/logouff.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF262A2B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: funcoes.criaBotao(
                        "Cadastrar", Color(0xFF0F62AC), 300, 80, () => {})),
              )
            ],
          ),
        ],
      ),
    );
  }
}
