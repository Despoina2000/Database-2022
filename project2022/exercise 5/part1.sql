/*creates tables*/
Create table Person(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,PRIMARY KEY(person_id)
   ,CONSTRAINT person_info UNIQUE(name,gender)
);

Create table Actor(
    person_id INTEGER  NOT NULL
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
);

Create table CrewMember(
    person_id INTEGER  NOT NULL
  
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
);

/*duplicate*/
CREATE TABLE Movie_Cast(
   movie_id  INTEGER  NOT NULL  
  ,cast_id   INTEGER  NOT NULL
  ,character VARCHAR(500)
  ,gender   INTEGER NOT NULL
  ,person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,FOREIGN key(movie_id) REFERENCES Movie(movie_id)
);

CREATE TABLE Movie_Crew(
   movie_id   INTEGER  NOT NULL  
  ,department VARCHAR(20) NOT NULL
  ,gender     INTEGER NOT NULL
  ,person_id  INTEGER  NOT NULL
  ,job        VARCHAR(100) NOT NULL
  ,name       VARCHAR(70) NOT NULL
  ,FOREIGN key(movie_id) REFERENCES Movie(movie_id)
);

/*drop columns*/
ALTER TABLE cast_table
DROP COLUMN name,gender;

ALTER TABLE crew
DROP COLUMN name,gender;

/*inserts tables*/
insert into Person
select cast_table.person_id, cast_table.name, cast_table.gender
from cast_table
union 
select crew.person_id, crew.name, crew.gender
from crew
where not exists (select 1 from cast_table where cast_table.person_id = crew.person_id);

insert into Actor
select DISTINCT person_id
from  cast_table; 

insert into Crewmember
select distinct person_id
from crew; 

/*backup*/

insert into Movie_Cast
select *
from  cast_table

insert into Movie_Crew
select *
from  crew

/*query for 5*/
    SELECT person_id, COUNT (DISTINCT gender), COUNT (DISTINCT name) 
FROM person
GROUP BY person_id
HAVING COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1;

/*alter table keys*/

alter table Cast_table
add FOREIGN KEY (person_id) REFERENCES Person(person_id);

alter table Crew
add FOREIGN KEY (person_id) REFERENCES Person(person_id);
