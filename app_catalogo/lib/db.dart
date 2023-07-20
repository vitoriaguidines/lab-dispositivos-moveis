import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
}
