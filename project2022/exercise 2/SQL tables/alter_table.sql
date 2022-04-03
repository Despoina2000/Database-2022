BEGIN;
alter table Cast_table
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id);

alter table Crew
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id);


alter table Movie_Collection
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id),
add FOREIGN KEY (collection_id) REFERENCES Collection(id);

alter table Movie_Genre
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id),
add FOREIGN KEY (genre_id) REFERENCES Genre(id);

alter table Movie_Keywords
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id), 
add FOREIGN KEY (keyword_id) REFERENCES Keyword(k_id);

alter table Movie_Production
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id),
add FOREIGN KEY (pc_id) REFERENCES Production(id);

alter table Ratings
add FOREIGN KEY (movie_id) REFERENCES Movie(m_id);
COMMIT;