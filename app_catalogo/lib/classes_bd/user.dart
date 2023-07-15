import 'package:app_catalogo/db.dart';

class User {
  final int id;
  final String name;
  final String password;
  final String email;

  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.email});

  factory User.fromMap(Map<String, dynamic> value) => User(
      id: value["id"],
      name: value["name"],
      password: value["password"],
      email: value["email"]);

  static getUserById(int id) async {
    final db = await BDProvider.bd.database;
    var res = await db.query("user", where: "id = ?", whereArgs: [id]);
    return User.fromMap(res.first);
  }
}
