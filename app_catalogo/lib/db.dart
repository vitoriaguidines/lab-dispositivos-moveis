import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_catalogo/classes_bd/user.dart';
import 'package:app_catalogo/classes_bd/video.dart';
import 'package:app_catalogo/classes_bd/genre.dart';

class BDProvider {
  BDProvider._();
  static final BDProvider bd = BDProvider._();

  static Database? _database;

  //Pega banco de dados com DBProvider.bd.database
  Future<Database> get database async {
    if (_database != null) return _database!;

    //Se a base de dados não existe, vamos instânciá-la
    _database = await init_BD();
    return _database!;
  }

  init_BD() async {
    String path = join(await getDatabasesPath(), "app_db.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database bd, int version) async {
      String script = await rootBundle.loadString("assets/start_script.sql");
      await bd.execute(script);
    });
  }

  _insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert('user', user.toJson());
  }

  _insertVideo(Video video) async {
    Database db = await this.database;
    var result = await db.insert('video', video.toJson());
  }

  _updateUser(User userUp) async {
    var db = await this.database;
    /* Map<String, dynamic> userData = {
      "name": userUp.name,
      "password": userUp.password,
      "email": userUp.email
    }; */

    int result = await db
        .update('user', userUp.toJson(), where: "id=?", whereArgs: [userUp.id]);
  }

  _updateVideo(Video videoUp) async {
    var db = await this.database;
    //Map<String, dynamic> videoData = videoUp.toJson();

    int result = await db.update("video", videoUp.toJson(),
        where: "id=?", whereArgs: [videoUp.id]);
  }

  _delete(String table, int idE) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE id = $idE');
  }

  Future<int> getCount(String table) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $table');
    int? result = Sqflite.firstIntValue(x);

    if (result != null) return result;
    return 0;
  }

  Future<List<Map<String, dynamic>>> getVideoMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM video order by id ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> getGenreMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM genre order by id ASC');
    return result;
  }

  Future<List<Video>> getVideoList() async {
    var videoMapList = await getVideoMapList();
    int count = videoMapList.length;

    List<Video> videoList = List<Video>.empty(growable: true);
    for (int i = 0; i < count; i++) {
      print(videoMapList[i]["id"]);
      videoList.add(await Video.getVideoById(videoMapList[i]["id"]));
    }
    return videoList;
  }

  static Future<Video> getVideoById(int id) async {
    final db = await bd.database;
    var resVideo = await db.query("video", where: "id = ?", whereArgs: [id]);
    Map<String, dynamic> ret = Map.from(resVideo.first);
    //Pegamos os items em genre que correspondem ao item atual e adicionamos no
    //fim da lista
    var resGenre =
        await db.query("video_genre", where: "videoid = ?", whereArgs: [id]);
    List<Genre> genreList = List.empty(growable: true);
    for (var item in resGenre) {
      Genre.getGenreById(item["genreid"] as int)
          .then((value) => genreList.add(value));
    }
    ret["genres"] = genreList;
    return Video.fromMap(ret);
  }

  Future<List<Genre>> getGenreList() async {
    var genreMapList = await getGenreMapList();
    int count = genreMapList.length;

    List<Genre> genreList = List<Genre>.empty();
    for (int i = 0; i < count; i++) {
      genreList.add(Genre.fromMap(genreMapList[i]));
    }

    return genreList;
  }
}
