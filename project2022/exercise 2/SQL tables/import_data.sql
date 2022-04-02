BEGIN;
set client_encoding to 'utf8';

COPY Cast_table FROM 'dataset/cast.csv' DELIMITER ',' QUOTE '"' ESCAPE '"'  CSV HEADER;

COPY Collection FROM 'dataset/collection.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Genre FROM 'dataset/genre.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Keyword FROM 'dataset/keyword.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie FROM 'dataset/movie.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie_Collection FROM 'dataset/movie_collection.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Crew FROM 'dataset/movie_crew.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie_Gerne FROM 'dataset/movie_genres.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie_Keywords FROM 'dataset/movie_keywords.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie_Collection FROM 'dataset/movie_collection.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Keyword FROM 'dataset/keyword.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Movie_Production FROM 'dataset/movie_productioncompanies.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Production FROM 'dataset/productioncompany.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COPY Ratings FROM 'dataset/ratings.csv' DELIMITER ',' QUOTE '"' ESCAPE '"' CSV HEADER;

COMMIT;