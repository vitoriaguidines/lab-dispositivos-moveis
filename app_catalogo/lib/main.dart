import 'package:flutter/material.dart';
import 'interface/LoginPage.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
};

void main() {
  runApp(MaterialApp(
    title: "Login",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.teal),
    routes: routes,
  ));
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
      home: LoginPage(),
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
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ));
  }
}
