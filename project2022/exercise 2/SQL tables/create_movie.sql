CREATE TABLE Movie(
   movie_id          INTEGER  NOT NULL 
  ,adult             BOOLEAN  NOT NULL
  ,budget            INTEGER  NOT NULL
  ,homepage          VARCHAR(44)
  ,original_language VARCHAR(2) NOT NULL
  ,original_title    VARCHAR(27) NOT NULL
  ,title             VARCHAR(27) NOT NULL
  ,tagline           VARCHAR(78)
  ,overview          VARCHAR(448) 
  ,popularity        NUMERIC(9,6) NOT NULL
  ,release_date      DATE  
  ,revenue           INTEGER  NOT NULL
  ,runtime           NUMERIC(5,1) 
  ,PRIMARY KEY(movie_id)
);