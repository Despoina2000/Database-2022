CREATE TABLE Crew(
   movie_id   INTEGER  NOT NULL  
  ,department CHAR(20) NOT NULL
  ,gender     INTEGER NOT NULL
  ,person_id  INTEGER  NOT NULL
  ,job        CHAR(100) NOT NULL
  ,name       CHAR(70) NOT NULL

  , FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
  , FOREIGN KEY (gender, person_id, name) REFERENCES Cast_table(gender, person_id, name)
);
