import 'dart:ui';
import 'login.dart';
import 'package:app_catalogo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  bool showButton = false;
  List<Widget> containers = []; //provavelmente os videos sao adicionados aqui
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
          ListView.builder(
            itemCount: containers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: containers[index],
              );
            },
          ),
          SizedBox(height: 20),
          showButton
              ? Positioned(
                  bottom: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      //aqui é muma logica meio simples de adição
                      setState(() {
                        containers.add(
                          Container(
                            width: 392,
                            height: 129,
                            decoration: ShapeDecoration(
                              color: Color(0xFF262A2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Título',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                )
              : SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showButton = !showButton;
          });
        },
        backgroundColor: Color(0xFF0F62AC),
        child: Icon(Icons.add),
      ),
    );
  }
}
