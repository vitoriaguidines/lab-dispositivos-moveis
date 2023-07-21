import 'dart:ui';
import 'package:app_catalogo/db.dart';
import 'package:app_catalogo/interface/mostravideo.dart';

import '../classes_bd/genre.dart';
import '../classes_bd/video.dart';
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

class _CatalogoPageState extends State<CatalogoPage>
    with SingleTickerProviderStateMixin {
  bool showButton = false;
  List<Widget> containers = [];
  Future<List<Video>> videos = BDProvider.bd
      .getVideoList(); //provavelmente os videos sao adicionados aqui
  MyApp funcoes = MyApp();
  List<String> dropdownItems = ['Terror', 'Comédia', 'Ação', 'Romance', ''];
  String selectedDropdownItem = "";

  late TabController tabController;

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
    //Primeiro a gente pega todos os videos no bd
    /*return Scaffold(
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
          FutureBuilder(
              future: videos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                              snapshot.data![index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
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
*/
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              child: Padding(
                padding: EdgeInsets.only(top: 65, left: 20, right: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15),
                            child: funcoes.botaoRedondo(Icon(Icons.arrow_back),
                                Color(0xFF0F62AC), 40, 40, () => {}),
                          ),
                          Container(
                            width: 200,
                            height: 70,
                            color: Color(0xFF262A2B),
                            alignment: Alignment.center,
                            child: DropdownButton<String>(
                              value: selectedDropdownItem,
                              items: dropdownItems.map((String item) {
                                return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style:
                                          TextStyle(color: Color(0xFF262A2B)),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDropdownItem = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF0F62AC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TabBar(
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.black,
                                indicatorColor: Colors.white,
                                indicatorWeight: 2,
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: tabController,
                                tabs: [
                                  Tab(
                                    text: 'Filmes',
                                  ),
                                  Tab(
                                    text: 'Séries',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Tab1(
                              selectedDropdownItem: selectedDropdownItem,
                            ),
                            Tab2(
                              selectedDropdownItem: selectedDropdownItem,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  String selectedDropdownItem;
  Tab1({this.selectedDropdownItem = ""});
  MyApp funcoes = MyApp();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: BDProvider.bd.getVideoList(selectedDropdownItem),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                snapshot.data?.removeWhere((element) => element.type != false);
                return ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MostraVideoPage(
                                      video: snapshot.data![index - index]))),
                          child: Container(
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
                                snapshot.data![index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                );
              }
            }));
  }
}

class Tab2 extends StatelessWidget {
  String selectedDropdownItem;
  Tab2({this.selectedDropdownItem = ""});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: BDProvider.bd.getVideoList(selectedDropdownItem),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                //Filtra se é série ou filme
                //Caso haja um filtro de genreo, remover filmes que não pertecem
                //a ele
                snapshot.data?.removeWhere((element) => element.type != true);
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                            snapshot.data![index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
