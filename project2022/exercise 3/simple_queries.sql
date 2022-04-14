/*Query: collections of movies that have a maximum rating of more than 4
229*/

SELECT m_cl.collection_id, r.rating
FROM Ratings AS r
INNER JOIN Movie_Collection AS m_cl
ON  m_cl.movie_id= r.movie_id 
GROUP BY m_cl.collection_id, r.rating
HAVING max(r.rating)>4

/*movie categories which have an average user rating of between 3 and 5 
9*/
SELECT Genre. category, avg(r.rating)
FROM Ratings r,  Movie_Genre mg, Genre 
 WHERE r.movie_id= mg. movie_id AND Genre.id = mg.genre_id
GROUP BY Genre.category
HAVING avg(r.rating)  between 3 and 5
/*name of films and their duration that have as their main feature the comedy
4*/
SELECT m.title, m.runtime
FROM movie m
INNER JOIN keyword k
ON m.m_id = k.k_id
GROUP BY m.runtime, m.title,k.keyword
HAVING k.keyword LIKE '%comedy%'


/*name of the films and the opening day of actor will smith's films
16*/

SELECT Movie. title, Movie. release_date
FROM Cast_table
FULL OUTER JOIN Movie 
 ON    Cast_table.movie_id = Movie.m_id
 WHERE Cast_table.name LIKE 'Will Smith'

/*ranking of producers of companies that have given films with zero budget*/
SELECT Production.company, Movie. title
FROM Production, Movie_Production
    INNER JOIN Movie 
  ON Movie_Production.movie_id = Movie.m_id
  WHERE Production.id = Movie_Production.pc_id AND Movie.budget=0
LIMIT 100;

/*Query: ratings of movies with above average revenue
SELECT Movie.title, Ratings.rating, Movie.revenue
FROM Movie, Ratings
WHERE 


/*Query: the actors and the number of movies they have played in
SELECT DISTINCT x.name, COUNT(x.movie_id)
FROM Crew AS x, Movie
WHERE x.movie_id = Movie.m_id AND x.person_id IN (
    SELECT y.person_id
    FROM crew as y
    WHERE y.person_id = x.person_id AND y.movie_id != Movie.m_id
)
GROUP BY x.name
/*Query: movies with a rating above the average rating
SELECT Movie.title, Ratings.rating
FROM Movie, Ratings
WHERE Ratings.rating>avg(Ratings.rating)
        AND Movie.m_id= Ratings.movie_id

/*Query : movies in which the majority of the contributors belong to the Art department
SELECT DISTINCT Movie.title, COUNT ( x.person_id)
FROM Crew AS x, Movie
WHERE x.department="Art" AND 
COUNT ( x.person_id) > ALL(
    SELECT Count(y.person_id)
    FROM Crew AS y
    WHERE x.movie_id = y.movie_id AND x.department != y.department ) 
AND x.movie_id = Movie.m_id*/