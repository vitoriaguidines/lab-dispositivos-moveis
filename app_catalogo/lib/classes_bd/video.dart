import 'package:app_catalogo/db.dart';

import 'genre.dart';

class Video {
  int? id;
  final String name;
  final String description;
  final bool type;
  final String ageRestriction; //Enum?
  final int durationMinutes;
  final String thumbnailImageId;
  final String releaseDate;
  final List<Genre> genres;

  Video(
      {this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.ageRestriction,
      required this.durationMinutes,
      required this.thumbnailImageId,
      required this.releaseDate,
      required this.genres});

  factory Video.fromMap(Map<String, dynamic> value) => Video(
      id: value["id"],
      name: value["name"],
      description: value["description"],
      type: value["type"] == 1 ? true : false,
      ageRestriction: value["ageRestriction"],
      durationMinutes: value["durationMinutes"],
      thumbnailImageId: value["thumbnailImageId"],
      releaseDate: value["releaseDate"],
      genres: value["genres"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "ageRestriction": ageRestriction,
        "durationMinutes": durationMinutes,
        "thumbnailImageId": thumbnailImageId,
        "releaseDate": releaseDate,
        "genres": genres
      };

  static Future<Video> getVideoById(int id) async {
    final db = await BDProvider.bd.database;
    var resVideo = await db.query("video", where: "id = ?", whereArgs: [id]);
    Map<String, dynamic> ret = Map.from(resVideo.first);
    //Pegamos os items em genre que correspondem ao item atual e adicionamos no
    //fim da lista
    var resGenre =
        await db.query("video_genre", where: "videoid = ?", whereArgs: [id]);
    List<Genre> genreList = List.empty(growable: true);
    for (var item in resGenre) {
      genreList.add(await Genre.getGenreById(item["genreid"] as int));
    }
    ret["genres"] = genreList;
    return Video.fromMap(ret);
  }

  List<String> getGenreNames() {
    List<String> names = List.empty(growable: true);
    for (Genre g in genres) {
      names.add(g.name);
    }
    return names;
  }
}
