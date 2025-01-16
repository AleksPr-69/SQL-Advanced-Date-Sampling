--Продвинутая выборка
--Задание 2


-- 1 Название и продолжительность самого длинного трека
SELECT  
	name,
	duration
FROM
	track
WHERE duration = (SELECT MAX(duration) FROM track);


-- 2 Название треков, продолжительность которых не менее 3,5 минуты
SELECT 
	name 
FROM 
	track
WHERE
	duration >= 210;

-- 3 название сборников, вышедших в период с 2018 по 2020 год включительно
SELECT 
	name
FROM 
	collections
where 
	year BETWEEN 2018 AND 2020;


-- 4 Исполнители, чье имя состоит из одного слова.
SELECT 
	name	
FROM 
	artist 
WHERE 
	name NOT LIKE '% %';

-- 5 Название треков, которые содержат слова "мой" или "my"
SELECT 
	name
FROM 
	track
WHERE 
	name ILIKE '%my%' or name ILIKE '%мой%';


-----------------------------------------------------------------------------------------
--Продвинутая выборка
--Задание 3

-- 1 Количество исполнителей в кажном жанрею
SELECT 
	name,
	(
	SELECT 
		COUNT(artias_id)
	FROM 
		genres_artist ga
	WHERE 
		ga.genres_id = genres.id 	
	)
FROM 
	genres;


-- 2 Количество треков, вошедших в альбомы 2019-2020 годов.
SELECT 
	name,
	(
	SELECT 
		COUNT(album_id)
	FROM 
		track t
	WHERE 
		t.album_id = album.id 
	)
FROM 
	album;


-- 3 Средняя продолжительность треков по каждому альбомую.
SELECT 
	name,
	(
	SELECT 
		avg(duration)
	from 
		track t
	where 
		t.album_id = album.id 
	)
FROM 
	album;


-- 4 Все исполнители, которые выпустили альбомы в 2020 году.
SELECT a.name,  al.year
FROM 
	artist AS a  
JOIN 
	artist_album AS aa ON aa.album_id = a.id
JOIN 
	album AS al ON aa.album_id = al.id 
WHERE 
	al.year = 2020;


-- 5 Название сборников, в которых присутствует конкретный исполнитель (выберете его сами)

SELECT 
	c.name
FROM 
	collections AS c 
JOIN 	
	track_collections AS tc ON tc.collections_id = c.id 
JOIN 
	track AS t ON t.id = tc.track_id 
JOIN 
	album AS a ON a.id = t.album_id 
JOIN 
	artist_album AS aa ON aa.album_id =a.id
JOIN 
	artist AS ar ON ar.id = aa.artist_id
WHERE 
	ar.name = 'Sinatra'
GROUP BY c.name
ORDER BY c.name;
