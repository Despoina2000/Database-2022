-- 1. Count of movies per year

SELECT EXTRACT(year FROM m.release_Date) AS year, COUNT (m.m_id)
FROM Movie m
GROUP BY EXTRACT(year FROM m.release_Date)
ORDER BY EXTRACT(year FROM m.release_Date);

-- 2. Count of movie by genre

SELECT g.category, COUNT (m.m_id)
FROM Movie m , Movie_Genre mg, Genre g
WHERE m.m_id = mg.movie_id AND g.id = mg.genre_id
GROUP BY g.category
ORDER BY g.category;

-- 3. Count of movie by genre and year

SELECT EXTRACT(year FROM m.release_Date) AS year, g.category, COUNT (m.m_id)
FROM Movie m , Movie_Genre mg, Genre g
WHERE m.m_id = mg.movie_id AND g.id = mg.genre_id
GROUP BY EXTRACT(year FROM m.release_Date), g.category
ORDER BY EXTRACT(year FROM m.release_Date), g.category;

-- 4. Highest movie budget per year

SELECT EXTRACT(year FROM m.release_Date) AS year, MAX(m.budget)
FROM Movie m
GROUP BY EXTRACT(year FROM m.release_Date)
ORDER BY EXTRACT(year FROM m.release_Date);

-- 5. Anthony Hopkins sum of revenue of movies per year

SELECT EXTRACT(year FROM m.release_Date) AS year, SUM(m.revenue)
FROM Movie m, cast_table mc
WHERE m.m_id = mc.movie_id AND mc.person_id = 4173
GROUP BY EXTRACT(year FROM m.release_Date)
ORDER BY EXTRACT(year FROM m.release_Date);

-- 6. Average rating per user

SELECT r.user_id, CAST(AVG(r.rating) AS DECIMAL(10,2))
FROM Ratings r
GROUP BY r.user_id
ORDER BY r.user_id;

-- 7. Number of ratings per user

SELECT r.user_id, COUNT(r.rating)
FROM Ratings r
GROUP BY r.user_id
ORDER BY r.user_id;

-- 8. Average rating and number of ratings per user

SELECT r.user_id, CAST(AVG(r.rating) AS DECIMAL(10,2)), COUNT(r.rating)
FROM Ratings r
GROUP BY r.user_id
ORDER BY r.user_id;

-- 9. Average rating per movie genre

SELECT g.category, CAST(AVG(r.rating) AS DECIMAL(10,2))
FROM Genre g, Movie_Genre mg, Ratings r
WHERE r.movie_id = mg.movie_id AND g.id = mg.genre_id
GROUP BY g.category
ORDER BY g.category;
