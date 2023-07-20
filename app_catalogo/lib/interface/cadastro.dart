import 'dart:ui';
import 'package:app_catalogo/interface/menu.dart';

import 'package:flutter/material.dart';

// Tab1 and Tab2 classes (unchanged from previous code)
class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Filmes'),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Séries'),
    );
  }
}
import 'package:app_catalogo/interface/login.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage>
    with SingleTickerProviderStateMixin {
  bool showButton = false;
  List<Widget> containers = []; //provavelmente os videos sao adicionados aqui
  //MyApp funcoes = MyApp(); // Assuming this function is defined somewhere else

  late TabController tabController;

  // Dropdown data
  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  String selectedDropdownItem = 'Item 1'; // Initially selected item

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
                        "Cadastrar", Color(0xFF0F62AC), 300, 80, () => {})),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CatalogoPage(),
  ));
}
