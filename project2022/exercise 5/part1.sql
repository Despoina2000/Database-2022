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

insert into Person
select gender,person_id,name
from (SELECT DISTINCT person_id,name,gender
	  	FROM cast_table 
		UNION 
		SELECT DISTINCT person_id,name,gender FROM crew )choice

insert into Actor
select person_id
from (SELECT DISTINCT person_id
	  	FROM cast_table 
		) choice

insert into Crewmember
select person_id
from (SELECT DISTINCT person_id
	  	FROM crew 
		) choice