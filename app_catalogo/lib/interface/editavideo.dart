import 'dart:ui';
import 'package:app_catalogo/db.dart';

import '../classes_bd/video.dart';
import 'package:app_catalogo/main.dart';
import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditavideoPage extends StatefulWidget {
  final Video video;
  const EditavideoPage({required this.video});

  @override
  State<EditavideoPage> createState() => _EditavideoPageState(video: video);
}

class _EditavideoPageState extends State<EditavideoPage> {
  final Video video;
  _EditavideoPageState({required this.video});
  MyApp funcoes = MyApp();

  TextEditingController thumbController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController duracaoController = TextEditingController();
  TextEditingController classificacaoController = TextEditingController();
  TextEditingController dataLancamentoController = TextEditingController();

  @override
  void dispose() {
    thumbController.dispose();
    nomeController.dispose();
    generoController.dispose();
    tipoController.dispose();
    duracaoController.dispose();
    classificacaoController.dispose();
    dataLancamentoController.dispose();
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
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25),
            child: funcoes.botaoRedondo(
              Icon(Icons.arrow_back),
              Color(0xFF0F62AC),
              40,
              40,
              () => {Navigator.pop(context)},
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: GestureDetector(
                onTap: () => {
                      BDProvider.bd.updateVideo(Video(
                          name: nomeController.text == ""
                              ? nomeController.text
                              : video.name,
                          description: video.description,
                          type: video.type,
                          ageRestriction: classificacaoController.text == ""
                              ? classificacaoController.text
                              : video.ageRestriction,
                          durationMinutes: duracaoController.text == ""
                              ? int.parse(duracaoController.text)
                              : video.durationMinutes,
                          thumbnailImageId: thumbController.text == ""
                              ? thumbController.text
                              : video.thumbnailImageId,
                          releaseDate: dataLancamentoController.text == ""
                              ? dataLancamentoController.text
                              : video.releaseDate,
                          genres: video.genres))
                    },
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
                )),
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
                      //aqui adiciona a lógica de aparecer a imagem do link da thumbnail
                      //so deixei assim de forma ilustrativa por enquanto
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: thumbController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Thumb",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: nomeController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Nome",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: generoController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Gênero",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: tipoController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Tipo",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: duracaoController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Duração",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: classificacaoController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Classificação",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: dataLancamentoController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Data de lançamento",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                //adiciona funcionalidade de excluir
              },
              backgroundColor: Color(0xFF0F62AC),
              foregroundColor: Colors.white,
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
