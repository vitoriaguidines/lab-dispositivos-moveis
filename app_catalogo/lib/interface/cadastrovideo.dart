import 'dart:ui';
import 'login.dart';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CadastrovideoPage extends StatefulWidget {
  const CadastrovideoPage({Key? key}) : super(key: key);

  @override
  State<CadastrovideoPage> createState() => _CadastrovideoPageState();
}

class _CadastrovideoPageState extends State<CadastrovideoPage> {
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
            padding: EdgeInsets.only(top: 15, left: 25),
            child: funcoes.botaoRedondo(
              Icon(Icons.arrow_back),
              Color(0xFF0F62AC),
              40,
              40,
              () => {},
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF262A2B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    "Editar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
              child: Container(
                width: 450,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xFF262A2B),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.grey,
                      // You can use Image.asset or any other widget to display the image here
                    ),
                    SizedBox(height: 20),
                    // Text(
                    //   "Thumb",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Divider(color: Colors.white),
                    Text(
                      "Nome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Gênero",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Tipo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Duração",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Classificação",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Data de lançamento",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
