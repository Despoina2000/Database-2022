/*Query 1:ranking of collections from movies that have a maximum rating of more than 4
Output: 229 rows*/
SELECT m_cl.collection_id, r.rating
FROM Ratings AS r
INNER JOIN Movie_Collection AS m_cl
ON  m_cl.movie_id= r.movie_id 
GROUP BY m_cl.collection_id, r.rating
HAVING max(r.rating)>4
ORDER BY m_cl.collection_id

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
INNER JOIN keyword k
ON m.m_id = k.k_id
GROUP BY m.title,m.runtime,k.keyword
HAVING k.keyword LIKE '%comedy%'


/*Query 4: name of the films and the opening day of actor will smith's films
Output: 16 rows*/
SELECT Movie. title, Movie. release_date
FROM Cast_table
RIGHT OUTER JOIN Movie 
 ON    Cast_table.movie_id = Movie.m_id
 WHERE Cast_table.name LIKE 'Will Smith'

/*Query 5: the first 100 producers of companies that have given films with zero budget
Output: 100 rows*/
SELECT Production.company, Movie. title
FROM Production, Movie_Production
    INNER JOIN Movie 
  ON Movie_Production.movie_id = Movie.m_id
  WHERE Production.id = Movie_Production.pc_id AND Movie.budget=0
LIMIT 100;

/*Query 6: actors and actresses with their roles in movies with the keyword thriller
Output: 450 rows*/
SELECT Cast_table.name ,Cast_table.character 
FROM Cast_table, Movie_Keywords
RIGHT OUTER JOIN Keyword k
ON k.k_id = Movie_Keywords.keyword_id 
GROUP BY Cast_table.name, Cast_table.character, k.keyword, Cast_table.movie_id,Movie_Keywords. movie_id
HAVING k.keyword LIKE '%thriller%' AND Cast_table.movie_id= Movie_Keywords. movie_id;

/*Query 7: ratings of movies with above 3
Output: 2946 rows*/
SELECT Movie.title, r.rating
FROM Movie
INNER JOIN Ratings r
ON Movie.m_id= r.movie_id 
GROUP BY Movie.title,r.rating
HAVING r.rating > 3

/*Query 8: the actors and the number of movies they have played in, sorteddescending by the number of their movies
Output: 56526rows*/
SELECT x.name, COUNT(x.movie_id)
 FROM Movie 
 INNER JOIN Crew x
ON x.movie_id = Movie.m_id
GROUP BY x.name
ORDER BY COUNT(x.movie_id)DESC;

/*Query 9: movies and the amount of the contributors belong to the Art department
Output: 19589rows*/
SELECT  Movie.title, COUNT ( x.person_id)
FROM Movie
INNER JOIN Crew AS x
ON Movie.m_id = x.movie_id
GROUP BY Movie.title, x.department, x.person_id
HAVING x.department LIKE 'Art'
ORDER BY COUNT ( x.person_id) DESC;

/*Query 10: reviews of films with above max revenue
Output: 6144rows*/
 SELECT DISTINCT Movie.title, r.rating, Movie.revenue
 FROM Movie
 INNER JOIN Ratings r
 ON r.movie_id= Movie.m_id
GROUP BY Movie.title,r.rating, Movie.revenue
HAVING Movie.revenue =max(Movie.revenue)

/*Query 11: names of actors and actresses who have acted in films with revenues over 2000000
Output: 33680rows*/
SELECT DISTINCT  Cast_table.name
FROM Movie, Cast_table
WHERE Movie.revenue>2000000 AND Movie.m_id= Cast_table.movie_id
ORDER BY Cast_table.name


/*Query 12: id films with their category where the language of speech is not English
Output: 1946 rows*/
SELECT distinct Movie.title , g.category
FROM Movie, Movie_Genre
INNER JOIN Genre g
ON Movie_Genre.genre_id = g.id
WHERE Movie.original_language !='en' AND Movie_Genre.movie_id = Movie.m_id
order BY Movie.title;
