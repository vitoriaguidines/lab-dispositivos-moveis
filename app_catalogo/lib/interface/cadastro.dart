import 'dart:ui';
import 'package:app_catalogo/interface/menu.dart';
import 'package:flutter/material.dart';
import 'package:app_catalogo/interface/login.dart';
import 'package:app_catalogo/db.dart';
import 'package:app_catalogo/classes_bd/user.dart';
import 'package:app_catalogo/main.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  MyApp funcoes = MyApp();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35, right: 335),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Image.asset(
                      "images/logouff.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    child: TextField(
                      controller: _nomeController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16),
                        border: InputBorder.none,
                      ),
                    ),
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF262A2B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16),
                        border: InputBorder.none,
                      ),
                    ),
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF262A2B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: TextField(
                      controller: _senhaController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16),
                        border: InputBorder.none,
                      ),
                    ),
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF262A2B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: funcoes.criaBotao(
                    "Cadastrar",
                    Color(0xFF0F62AC),
                    300,
                    80,
                    () {
                      String nome = _nomeController.text;
                      String email = _emailController.text;
                      String senha = _senhaController.text;

                      User newUser =
                          User(name: nome, email: email, password: senha);

                      // Verifica se o usuário já existe no banco de dados (pode ajustar conforme suas necessidades)
                      User.getUserById(newUser.id ?? 0).then((user) {
                        if (user == null) {
                          // Se o usuário não existe, você pode inserir os dados no banco de dados
                          // Usando o método save() da classe User
                          newUser.save().then((_) {
                            print('Usuário cadastrado com sucesso!');
                          });
                        } else {
                          print('Usuário já existe!');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
