import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_catalogo/classes_bd/video.dart';
import 'package:app_catalogo/assets/videos.dart';

class ConvvideosPage extends StatefulWidget {
  const ConvvideosPage({Key? key}) : super(key: key);

  @override
  State<ConvvideosPage> createState() => _ConvvideosPageState();
}

class _ConvvideosPageState extends State<ConvvideosPage> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];
  late ScrollController scrollCont;
  BuildContext? tabContext;

  @override
  void initState() {
    scrollCont = ScrollController();
    scrollCont.addListener(changeTabs);
    super.initState();
  }

  changeTabs() {
    late RenderBox box;

    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollCont.offset >= position.dy)
        DefaultTabController.of(tabContext!)!.animateTo(
          i,
          duration: Duration(milliseconds: 100),
        );
    }
  }

  scrollTo(int index) async {
    scrollCont.removeListener(changeTabs);
    final categoria = categorias[index].currentContext!;
    await Scrollable.ensureVisible(
      categoria,
      duration: Duration(milliseconds: 600),
    );
    scrollCont.addListener(changeTabs);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (BuildContext context) {
          tabContext = context;
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(color: Colors.red),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                )
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Categorias',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'oi pessoal tudo bem com vcs',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  )
                ],
              ),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text('Ação')),
                  Tab(child: Text('Terror')),
                ],
                onTap: (int index) => scrollTo(index),
              ),
            ),
            body: SingleChildScrollView(
              controller: scrollCont,
              child: Column(
                children: [
                  categoriavideo('Ação', 0),
                  gerarListavideos(VideoRepository.acao),
                  categoriavideo('Terror', 1),
                  gerarListavideos(VideoRepository.teror),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  gerarListavideos(List<Video> videos) {
    return Column(
      children: videos.map((video) => videoItem(video)).toList(),
    );
  }

  Widget videoItem(Video video) {
    return Column(
      children: [
        ListTile(
          title: Text(video.name),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.description,
                  style: TextStyle(fontSize: 13),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    video.releaseDate,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          trailing: Image.network(video.thumbnailImageId),
          contentPadding: EdgeInsets.all(15),
        ),
        Divider(),
      ],
    );
  }

  Widget categoriavideo(String titulo, int index) {
    return Padding(
      key: categorias[index],
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          ListTile(
            title: Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
