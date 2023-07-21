import 'package:app_catalogo/db.dart';
import 'package:sqflite/sqflite.dart';

class User {
  int? id;
  final String name;
  final String password;
  final String email;

  User({
    this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> value) => User(
        id: value["id"],
        name: value["name"],
        password: value["password"],
        email: value["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "email": email,
      };

  Future<void> save() async {
    final db = await BDProvider.bd.database;
    await db.insert('user', this.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<User?> getUserById(int id) async {
    final db = await BDProvider.bd.database;
    var res = await db.query("user", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }
}
