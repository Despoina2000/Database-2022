SELECT DISTINCT Movie.title, Crew.department
FROM Crew AS x, Movie
WHERE x.department="Art" AND 
COUNT ( x.person_id) > ALL(
    SELECT Count(y.person_id)
    FROM Crew AS y
    WHERE x.movie_id = y.movie_id AND x.department != y.department ) 
AND x.movie_id = Movie.m_id