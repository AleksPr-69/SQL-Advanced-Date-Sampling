--Продвинутая выборка
--Задание 1

--Добовляем жанры
INSERT INTO genres (name)
VALUES ('blues');

INSERT INTO genres (name)
VALUES ('jazz');

INSERT INTO genres (name)
VALUES ('pop');

--Добовляем исполнителей
INSERT INTO artist (name, alias)
VALUES ('Eric Clapton', 'Eric Clapton'); --блюз

INSERT INTO artist (name, alias)
VALUES ('Sinatra', 'Frank Sinatra'); --джас

INSERT INTO artist (name, alias)
VALUES ('Billie Eilish Pirate Baird O/Connele','Billie Eilish'); --поп

INSERT INTO artist (name, alias)
VALUES ('Madonna Louise Veronica Ciccone','Madonna'); --поп

--Добовляем альбомы
INSERT INTO album (name, year)
VALUES ('The Creame of Clapton', 1994); --блюз

INSERT INTO album (name, year)
VALUES ('The World We Knew', 1967); --джас

INSERT INTO album (name, year)
VALUES ('Hit me hard and sift',2020); --поп

INSERT INTO album (name, year)
VALUES ('Ray of Ligth',1998); --поп

--Добовляем треки
INSERT INTO track (album_id, name, duration)
VALUES (1, 'Layla', 375); --блюз

INSERT INTO track (album_id, name, duration)
VALUES (1, 'Badge', 165); --блюз


INSERT INTO track (album_id, name, duration)
VALUES (2, 'Somethin Stupid', 159); --джас

INSERT INTO track (album_id, name, duration)
VALUES (2, 'This is My Love', 210); --джас


INSERT INTO track (album_id, name, duration)
VALUES (3, 'Skinny',220); --поп

INSERT INTO track (album_id, name, duration)
VALUES (3, 'Lunch',180); --поп


INSERT INTO track (album_id, name, duration)
VALUES (4, 'Swim',310); --поп

INSERT INTO track (album_id, name, duration)
VALUES (4, 'Skin',398); --поп


--Добовляем сборники
INSERT INTO collections (name, year)
VALUES ('The best', 1996); --блюз

INSERT INTO collections ( name, year)
VALUES ('Classic', 2005); --блюз

INSERT INTO collections (name, year)
VALUES ('Hits', 2019); --джас

INSERT INTO collections (name, year)
VALUES ( 'Modern', 2020); --джас


--Добовляем в промежуточную таблицу жанры-исполнители
INSERT INTO genres_artist (genres_id, artias_id)
VALUES (1, 1); 

INSERT INTO genres_artist (genres_id, artias_id)
VALUES (2, 2); 

INSERT INTO genres_artist (genres_id, artias_id)
VALUES (3, 3); 

INSERT INTO genres_artist (genres_id, artias_id)
VALUES (3, 4); 


--Добовляем в промежуточную таблицу исполнители_льбомы
INSERT INTO artist_album (artist_id, album_id)
VALUES (1, 1); 

INSERT INTO artist_album (artist_id, album_id)
VALUES (2, 2); 

INSERT INTO artist_album (artist_id, album_id)
VALUES (3, 3); 

INSERT INTO artist_album (artist_id, album_id)
VALUES (4, 4); 


--Добовляем в промежуточную таблицу треки_сборники
INSERT INTO track_collections (track_id, collections_id)
VALUES (1, 1); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (2, 1); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (2, 2); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (3, 2); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (4, 1); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (4, 2); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (5, 3); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (6, 3); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (7, 2); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (7, 3); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (7, 4); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (8, 3); 

INSERT INTO track_collections (track_id, collections_id)
VALUES (8, 4); 
