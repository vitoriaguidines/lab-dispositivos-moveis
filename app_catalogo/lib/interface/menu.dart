import 'dart:ui';
import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                  padding: EdgeInsets.only(top: 170),
                  child: Image.asset(
                    "images/logouff.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 80, bottom: 30),
                  child: funcoes.criaBotao(
                      "Meus vídeos", Color(0xFF0F62AC), 300, 80, () => {})),
              funcoes.criaBotao("Logout", Color(0xFF0F62AC), 300, 80, () => {})
            ],
          ),
        ],
      ),
    );
  }
}
