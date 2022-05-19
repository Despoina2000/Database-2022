/*Queries:we are searching the persons with more than one gender or names*/
SELECT person_id, COUNT (DISTINCT gender), COUNT (DISTINCT name) 
FROM cast_table
GROUP BY person_id, gender, name
HAVING COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1;

SELECT person_id, COUNT (DISTINCT gender), COUNT (DISTINCT name) 
FROM crew
GROUP BY person_id, gender, name
HAVING COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1;

/* DELETE:we are deleting the persons with more than one gender or names*/

DELETE FROM cast_table WHERE COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1;

DELETE FROM crew WHERE COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1;

/*Update*/
update "Movie_Cast" set character='UNKNOWN' where character IS NULL

/*Alter table: */
BEGIN;
alter table Cast_table
add foreign  key (person_id) REFERENCES (Actor);

alter table Crew
add foreign key (person_id) REFERENCES (CrewMember);

COMMIT;
