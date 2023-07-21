import 'package:app_catalogo/helper/DatabaseHelper.dart';

import '../model/User.dart';

class LoginController {
  DatabaseHelper con = DatabaseHelper();

  Future<int> saveUser(User user) async {
    var db = await con.db;
    int res = await db.insert('user', user.toMap());
    print('Result of insert: $res');
    return res;
  }

  Future<int> deleteUser(User user) async {
    var db = await con.db;
    int res = await db.delete("user", where: "id = ?", whereArgs: [user.id]);
    return res;
  }

  Future<User> getLogin(String username, String password) async {
    var db = await con.db;
    String sql = """
    SELECT * FROM user WHERE username = '${username}' AND password = '${password}' 
""";

    var res = await db.rawQuery(sql);

    if (res.length > 0) {
      return User.fromMap(res.first);
    }

    return User(id: -1, username: "", password: "");
  }

  Future<List<User>> getAllUser() async {
    var db = await con.db;

    var res = await db.query("user");

    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];

    return list;
  }
}
