-- Создаем таблицу Жанров
CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);


-- Создаем таблицу Исполнителей
CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	alias VARCHAR(60)
);


-- Создаем промежуточную таблицу связавющую жанры и исполнителей
CREATE TABLE IF NOT EXISTS genres_artist (
	genres_id INTEGER NOT NULL REFERENCES genres (id),
	artias_id  INTEGER NOT NULL REFERENCES artist (id),
	CONSTRAINT pk PRIMARY KEY (genres_id, artias_id)
);


-- Создаем таблицу Альбомы
CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name 	VARCHAR(60) 	NOT NULL,
	year 	INTEGER 		NOT null,
			CONSTRAINT year
			CHECK(year BETWEEN 1940 AND 2025)
);


-- Создаем промежуточную таблицу связавющую исполнителей и альбомы
CREATE TABLE IF NOT EXISTS artist_album (
	artist_id INTEGER NOT NULL REFERENCES artist (id),
	album_id  INTEGER NOT NULL REFERENCES album (id),
	CONSTRAINT pk2 PRIMARY KEY ( artist_id, album_id)
);


--Создаем таблицу треков
CREATE TABLE IF NOT EXISTS track (
	id SERIAL primary KEY,
	album_id INTEGER REFERENCES album (id),
	name VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL
);

--Создаем таблицу Сборники
CREATE TABLE IF NOT EXISTS collections (
	id SERIAL PRIMARY KEY ,
	name VARCHAR(60) NOT NULL,
	year INTEGER 		NOT null,
			CONSTRAINT year
			CHECK(year BETWEEN 1940 AND 2025)
);


-- Создаем промежуточную таблицу связавющую треки и сборники
CREATE TABLE IF NOT EXISTS track_collections (
	track_id INTEGER NOT NULL REFERENCES track (id),
	collections_id  INTEGER NOT NULL REFERENCES collections (id),
	CONSTRAINT pk3 PRIMARY KEY ( track_id, collections_id)
);