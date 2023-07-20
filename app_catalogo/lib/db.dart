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
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "app_db.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database bd, int version) async {
      String script = await rootBundle.loadString("assets/start_script.sql");
      await bd.execute(script);
    });
  }

  Future<List<Map<String, dynamic>>> getVideoMapList() async {
    Database db = this.database;

    var result = await db.rawQuery('SELECT * FROM $video order by $id ASC');
    return result;
  }

  Future<int> _insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert('user', user);
    return result;
  }

  Future<int> _insertVideo(Video video) async {
    Database db = await this.database;
    var result = await db.insert('video', video);
    return result;
  }

  Future<int> _updateUser(User userUp) async {
    var db = await this.database;
    Map<String, dynamic> userData = {
      "name": userUp.name,
      "password": userUp.password,
      "email": userUp.email
    };

    int result = await db
        .update(userUp, userData, where: "id=?", whereArgs: [userUp.id]);

    return result;
  }

  Future<int> _updateVideo(Video videoUp) async {
    var db = await this.database;
    Map<String, dynamic> videoData = Video.fromMap(videoUp);

    int result = await db
        .update(videoUp, videoData, where: "id=?", whereArgs: [videoUp.id]);

    return result;
  }

  Future<int> _delete(String table, int idE) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $id = $idE');
    return result;
  }

  Future<int> getCount(String table) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $table');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Video>> getVideoList() async {
    var videoMapList = await getVideoMapList();
    int count = videoMapList.length;

    List<Video> videoList = List<Video>();
    for (int i = 0; i < count; i++) {
      videoList.add(Video.fromMapObject(videoMapList[i]));
    }

    return videoList;
  }
}
