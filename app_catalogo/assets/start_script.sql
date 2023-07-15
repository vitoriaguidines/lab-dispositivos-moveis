CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    password VARCHAR NOT NULL
);

INSERT INTO user(name, email, password) VALUES('Teste 1', 'teste1@teste', '123456');
INSERT INTO user(name, email, password) VALUES('Teste 2', 'teste2@teste', '123456');
INSERT INTO user(name, email, password) VALUES('Teste 3', 'teste3@teste', '123456');
INSERT INTO user(name, email, password) VALUES('Teste 4', 'teste4@teste', '123456');
INSERT INTO user(name, email, password) VALUES('Teste 5', 'teste5@teste', '123456');

CREATE TABLE genre(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL
);

INSERT INTO genre(name) VALUES('Comedia');
INSERT INTO genre(name) VALUES('Terror');
INSERT INTO genre(name) VALUES('Aventura');
INSERT INTO genre(name) VALUES('Suspense');
INSERT INTO genre(name) VALUES('Ação');

CREATE TABLE video(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(2) NOT NULL,
    description TEXT NOT NULL,
	type INTEGER NOT NULL,
	ageRestriction VARCHAR NOT NULL,
	durationMinutes INTEGER NOT NULL,
	thumbnailImageId VARCHAR NOT NULL,
	releaseDate TEXT NOT NULL
);

INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES('Filme 1', 'Descrição 1', 0, '18 anos', 120, 'url imagem', '01/01/2020');
INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES('Filme 2', 'Descrição 2', 0, '18 anos', 120, 'url imagem', '01/01/2020');
INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES('Filme 3', 'Descrição 3', 0, '18 anos', 120, 'url imagem', '01/01/2020');
INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES('Filme 4', 'Descrição 4', 0, '18 anos', 120, 'url imagem', '01/01/2020');
INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES('Filme 5', 'Descrição 5', 0, '18 anos', 120, 'url imagem', '01/01/2020');


CREATE TABLE video_genre(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    videoid INTEGER NOT NULL,
	genreid INTEGER NOT NULL,
	FOREIGN KEY(videoid) REFERENCES video(id),
	FOREIGN KEY(genreid) REFERENCES genre(id)
);

INSERT INTO video_genre(videoid, genreid) VALUES(1, 1);
INSERT INTO video_genre(videoid, genreid) VALUES(1, 2);
INSERT INTO video_genre(videoid, genreid) VALUES(2, 5);
INSERT INTO video_genre(videoid, genreid) VALUES(3, 4);
INSERT INTO video_genre(videoid, genreid) VALUES(4, 3);
INSERT INTO video_genre(videoid, genreid) VALUES(5, 1);
INSERT INTO video_genre(videoid, genreid) VALUES(5, 5);

select video.id, video.name, genre.name from video left join video_genre on video.id = video_genre.videoid left join genre on genre.id = video_genre.genreid;

select video.id, video.name, genre.name from video left join video_genre on video.id = video_genre.videoid left join genre on genre.id = video_genre.genreid where genre.name = 'Comedia';

