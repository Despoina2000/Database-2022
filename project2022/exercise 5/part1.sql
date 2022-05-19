Create table Person(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,PRIMARY KEY(person_id)
   ,CONSTRAINT person_info UNIQUE(name,gender)
);

Create table Author(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
   ,CONSTRAINT author_info UNIQUE(name,gender)
);

Create table CrewMember(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
   ,CONSTRAINT crewmember_info UNIQUE(name,gender)
);