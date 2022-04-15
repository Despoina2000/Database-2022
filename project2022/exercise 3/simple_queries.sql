/*Query 1: collections of movies that have a maximum rating of more than 4
Output: 229 rows*/

SELECT m_cl.collection_id, r.rating
FROM Ratings AS r
INNER JOIN Movie_Collection AS m_cl
ON  m_cl.movie_id= r.movie_id 
GROUP BY m_cl.collection_id, r.rating
HAVING max(r.rating)>4

/*Query 2: movie categories which have an average user rating of between 3 and 5 
Output: 9 rows*/
SELECT Genre. category, avg(r.rating)
FROM Ratings r,  Movie_Genre mg, Genre 
 WHERE r.movie_id= mg. movie_id AND Genre.id = mg.genre_id
GROUP BY Genre.category
HAVING avg(r.rating)  between 3 and 5
/*Query 3: name of films and their duration that have as their main feature the comedy
Output: 4 rows*/
SELECT m.title, m.runtime
FROM movie m
RIGHT OUTER JOIN keyword k
ON m.m_id = k.k_id
GROUP BY m.title
HAVING k.keyword LIKE '%comedy%'


/*Query 4: name of the films and the opening day of actor will smith's films
Output: 16 rows*/

SELECT Movie. title, Movie. release_date
FROM Cast_table
RIGHT OUTER JOIN Movie 
 ON    Cast_table.movie_id = Movie.m_id
 WHERE Cast_table.name LIKE 'Will Smith'

/*Query 5: ranking of producers of companies that have given films with zero budget
Output: rows*/
SELECT Production.company, Movie. title
FROM Production, Movie_Production
    INNER JOIN Movie 
  ON Movie_Production.movie_id = Movie.m_id
  WHERE Production.id = Movie_Production.pc_id AND Movie.budget=0
LIMIT 100;

/*Query 6: actors and actresses with their roles in movies with the keyword thriller
Output: rows*/
SELECT Cast_table.name ,Cast_table.character 
FROM Cast_table, Movie_Keywords
INNER JOIN Keywrord k
ON k.k_id = Movie_Keywords.keyword_id
WHERE k.keyword LIKE 'thriller' AND Cast_table.movie_id= Movie_Keywords. movie_id;

/*Query 7: ratings of movies with above average rating
Output: rows*/
SELECT Movie.title, r.rating, avg (r.rating)
FROM Movie
INNER JOIN Ratings r
ON Movie.m_id= r.movie_id 
GROUP BY Movie.title
HAVING r.rating > avg(r.rating)

/*Query 8: the actors and the number of movies they have played in
Output: rows*/
SELECT DISTINCT x.name, COUNT(x.movie_id)
 FROM Movie 
 INNER JOIN Crew x
ON x.movie_id IN (
    SELECT y.movie_id
    FROM crew as y
    WHERE y.person_id = x.person_id AND y.movie_id != Movie.m_id
)
GROUP BY x.name

/*Query 9: movies in which the majority of the contributors belong to the Art department
Output: rows*/
SELECT DISTINCT Movie.title, COUNT ( x.person_id)
FROM Movie
INNER JOIN Crew AS x
ON Movie.m_id = x.movie_id
GROUP BY Movie.title
HAVING x.department LIKE 'Art' AND 
COUNT ( x.person_id) > ALL(
    SELECT Count(y.person_id)
    FROM Crew AS y
    WHERE x.movie_id = y.movie_id AND x.department != y.department)
    
/*Query 10: reviews of films with above average revenue
Output: rows*/
 SELECT Movie.title, r.rating, Movie.revenue
 FROM Movie
 INNER JOIN Ratings r
 ON r.movie_id= Movie.m_id
GROUP BY Movie.title
HAVING Movie.revenue >avg(Movie.revenue)

/*Query 11: names of actors and actresses who have acted in films with revenues over 2000000
Output: rows*/
SELECT  DISTINCT Cast_table.name
FROM Movie, Cast_table
WHERE Movie.revenue>2000000 AND Movie.m_id= Cast_table.movie_id

/*Query 12: id films with their category where the language of speech is not English
Output: rows*/
SELECT Movie.m_id, g.category
FROM Movie, Movie_Genres
INNER JOIN Genre g
ON Movie_Gernes.movie_id = Movie.m_id
        AND   Movie_Gernes.gerne_id = g.id
WHERE Movie.original_language<>"en"
ORDER BY Movie.m_id;  
