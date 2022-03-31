CREATE TABLE Movie(
   movie_id          INTEGER  NOT NULL PRIMARY KEY 
  ,adult             BOOLEAN  NOT NULL
  ,budget            INTEGER  NOT NULL
  ,homepage          CHAR(44)
  ,original_language CHAR(2) NOT NULL
  ,original_title    CHAR(27) NOT NULL
  ,title             CHAR(27) NOT NULL
  ,tagline           CHAR(78)
  ,overview          CHAR(448) NOT NULL
  ,popularity        NUMERIC(9,6) NOT NULL
  ,release_date      DATE  NOT NULL
  ,revenue           INTEGER  NOT NULL
  ,runtime           NUMERIC(5,1) NOT NULL
);