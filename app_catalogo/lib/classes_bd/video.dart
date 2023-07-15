import 'package:app_catalogo/db.dart';

import 'genre.dart';

class Video {
  final int id;
  final String name;
  final String description;
  final bool type;
  final String ageRestriction; //Enum?
  final int durationMinutes;
  final int thumbnailImageId;
  final String releaseDate;
  final List<Genre> genres;

  Video(
      {required this.id,
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
      type: value["type"],
      ageRestriction: value["ageRestriction"],
      durationMinutes: value["durationMinutes"],
      thumbnailImageId: value["thumbnailImageId"],
      releaseDate: value["releaseDate"],
      genres: value["genres"]);

  static Future<Video> getVideoById(int id) async {
    final db = await BDProvider.bd.database;
    var resVideo = await db.query("video", where: "id = ?", whereArgs: [id]);

    //Pegamos os items em genre que correspondem ao item atual e adicionamos no
    //fim da lista
    var resGenre =
        await db.query("video_genre", where: "video_id = ?", whereArgs: [id]);
    resVideo.add({"genres": resGenre.map((c) => Genre.fromMap(c)).toList()});

    return Video.fromMap(resVideo.first);
  }
}
