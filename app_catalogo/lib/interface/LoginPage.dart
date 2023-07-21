import 'package:app_catalogo/interface/catalogo.dart';
import 'package:flutter/material.dart';
import '../model/User.dart';
import '../controller/LoginController.dart';
import 'CadastroPage.dart';
import 'HomePage.dart';
import 'dart:ui';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:ui';
import 'package:app_catalogo/controller/LoginController.dart';
import 'package:app_catalogo/interface/HomePage.dart';
import 'package:app_catalogo/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { notSignIn, signIn }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MyApp funcoes = MyApp();
  bool passwordVisible = false;
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String? _username, _password;
  final _formKey = GlobalKey<FormState>();
  late LoginController controller;
  var value;

  _LoginPageState() {
    this.controller = LoginController();
  }

  void _performLogin(String username, String password) async {
    try {
      User user = await controller.getLogin(username, password);
      if (user.id != -1) {
        savePref(1, user.username, user.password);
        setState(() {
          _loginStatus = LoginStatus.signIn;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _submit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      _performLogin(_username!, _password!);
    }
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt("value", 0);
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Login Page"),
          ),
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
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: TextFormField(
                                              onSaved: (newValue) =>
                                                  _username = newValue,
                                              decoration: InputDecoration(
                                                labelText: "Username",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: TextFormField(
                                              onSaved: (newValue) =>
                                                  _password = newValue,
                                              obscureText: passwordVisible,
                                              decoration: InputDecoration(
                                                labelText: "Password",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(),
                                                suffixIcon: IconButton(
                                                  color: Colors.grey,
                                                  icon: Icon(passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        passwordVisible =
                                                            !passwordVisible;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                  Color(0xFF0F62AC), 300, 80, _submit),
                            ),
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
                        padding:
                            EdgeInsets.only(top: 10, bottom: 10, left: 200),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CatalogoPage()));
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
      case LoginStatus.signIn:
        return HomePage(signOut);
    }
  }
}
