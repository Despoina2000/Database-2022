/*Queries:we are searching the person with more than one gender or names*/
SELECT person_id, COUNT (DISTINCT gender), COUNT (DISTINCT name) 
FROM cast_table
GROUP BY person_id, gender, name
HAVING COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1

SELECT person_id, COUNT (DISTINCT gender), COUNT (DISTINCT name) 
FROM crew
GROUP BY person_id, gender, name
HAVING COUNT (DISTINCT gender)>1 OR COUNT (DISTINCT name)>1