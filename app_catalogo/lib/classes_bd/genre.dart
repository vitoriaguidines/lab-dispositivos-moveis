import 'package:app_catalogo/db.dart';

class Genre {
  int id;
  String name;
  Genre({required this.id, required this.name});

  factory Genre.fromMap(Map<String, dynamic> value) =>
      Genre(id: value["id"], name: value["name"]);

  static getGenreById(int id) async {
    final db = await BDProvider.bd.database;
    var res = await db.query("genre", where: "id = ?", whereArgs: [id]);
    return Genre.fromMap(res.first);
  }
}
