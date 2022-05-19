Create table Person(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,PRIMARY KEY(person_id)
);

Create table Author(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
);

Create table CrewMember(
    person_id INTEGER  NOT NULL
  ,name      VARCHAR(100) NOT NULL
  ,gender     INTEGER NOT NULL
   ,FOREIGN KEY(person_id)  REFERENCES Person(person_id)
);