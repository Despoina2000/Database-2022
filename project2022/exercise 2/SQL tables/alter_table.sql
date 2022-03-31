BEGIN;
alter table Cast_table
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);

alter table Crew
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);
add FOREIGN KEY (gender, person_id, name) REFERENCES Cast_table(gender, person_id, name);

alter table Movie_Collection
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);
add FOREIGN KEY (collection_id) REFERENCES Collection(collection_id);

alter table Movie_Genre
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);
add FOREIGN KEY (genre_id) REFERENCES Genre(genre_id);

alter table Movie_Keywords
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id); 
add FOREIGN KEY (keyword_id) REFERENCES Keyword(keyword_id);

alter table Movie_Production
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);
add FOREIGN KEY (pc_id) REFERENCES Production(pc_id);

alter table Ratings
add FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);
COMMIT;