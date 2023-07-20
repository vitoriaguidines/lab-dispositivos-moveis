import 'dart:io';

import 'package:app_catalogo/db.dart';
import 'package:app_catalogo/interface/convvideos.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:app_catalogo/interface/cadastro.dart';
import 'package:app_catalogo/interface/catalogo.dart';
import 'package:app_catalogo/interface/menu.dart';
import 'package:flutter/material.dart';
import 'interface/login.dart';

import 'classes_bd/user.dart';
import 'classes_bd/video.dart';

void main() async {
  runApp(const MyApp());
  //await WidgetsFlutterBinding.ensureInitialized();
  //if (Platform.isWindows || Platform.isLinux) {
  // Initialize FFI
  //sqfliteFfiInit();
  //}
  //databaseFactory = databaseFactoryFfi;

  //await BDProvider.bd.init_BD();
  //Video.getVideoById(1).then(((value) => print(value)));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatalogoPage(),
    );
  }

  Widget criaBotao(
      String text, Color color, double width, double heigth, onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Inter',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width, heigth)),
        fixedSize: MaterialStateProperty.all(Size(width, heigth)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }

  Widget botaoRedondo(
      Icon icon, Color color, double width, double heigth, onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width, heigth)),
        fixedSize: MaterialStateProperty.all(Size(width, heigth)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }
}
