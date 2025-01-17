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


--- 5 Название треков, которые содержат слова "мой" или "my"
SELECT 
	name
FROM 
	track
WHERE 
	name ILIKE 'my %' /*Слово в начале строки*/
OR 
	name ILIKE '% my' /*Слово в конце строки*/
OR 
	name ILIKE '% my.' /*Слово в конце строки стоит точка*/	
OR 
	name ILIKE '% my %' /*Слово в середине строки*/	
OR 
	name ILIKE 'my' /*Название трека из одного искомого слова*/		
OR
	name ILIKE 'мой %' /*Слово в начале строки*/
OR 
	name ILIKE '% мой' /*Слово в конце строки*/
OR 
	name ILIKE '% мой.' /*Слово в конце строки стоит точка*/	
OR 
	name ILIKE '% мой %' /*Слово в середине строки*/	
OR 
	name ILIKE 'мой'; /*Название трека из одного искомого слова*/	


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
	COUNT(t.name)
FROM 
	track AS t
JOIN 
	album AS a ON a.id = t.album_id 
WHERE 
	a.year BETWEEN 2019 AND 2020;


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
SELECT 
	a.name
FROM 
	artist AS a 
WHERE
	a.name NOT IN(
		SELECT 
			a2.name
		FROM
			artist as a2
		JOIN 
			artist_album AS aa ON aa.artist_id = a2.id 
		JOIN 
			album AS al ON al.id = aa.album_id 
		WHERE 
			al.year =2020
		);


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
