import 'package:app_catalogo/classes_bd/genre.dart';
import 'package:app_catalogo/classes_bd/video.dart';

class VideoRepository {
  static List<Video> comedia = [
    Video(
      id: 1,
      name: 'filmebrabo 1',
      description: 'o mais brabo dos brabo',
      type: true,
      releaseDate: '17/01/2000',
      ageRestriction: "18",
      durationMinutes: 30,
      thumbnailImageId:
          'https://media.giphy.com/media/14e27FhfQA3Yivhi6e/giphy.gif',
    ),
  ];

  static List<Video> acao = [
    Video(
        id: 1,
        name: 'filmebrabo 1',
        description: 'o mais brabo dos brabo',
        type: true,
        releaseDate: '17/01/2000',
        ageRestriction: "18",
        durationMinutes: 30,
        thumbnailImageId:
            'https://media.giphy.com/media/65D9lmbH8Nn8KKQRqR/giphy.gif'),
  ];

  static List<Video> teror = [
    Video(
        id: 1,
        name: 'filmebrabo 1',
        description: 'o mais brabo dos brabo',
        type: true,
        releaseDate: '17/01/2000',
        ageRestriction: "18",
        durationMinutes: 30,
        thumbnailImageId:
            'https://media.giphy.com/media/2UpMjkgq1lZdVVnTAv/giphy.gif'),
  ];
}
