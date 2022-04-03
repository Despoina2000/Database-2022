CREATE TABLE Movie(
   m_id          INTEGER  NOT NULL 
  ,adult             BOOLEAN  NOT NULL
  ,budget            INTEGER  NOT NULL
  ,homepage          VARCHAR(100000)
  ,original_language VARCHAR(2) NOT NULL
  ,original_title    VARCHAR(100000) NOT NULL
  ,title             VARCHAR(100) NOT NULL
  ,tagline           VARCHAR(100000)
  ,overview          VARCHAR(100000) 
  ,popularity        NUMERIC(9,6) NOT NULL
  ,release_date      DATE  
  ,revenue           INTEGER  NOT NULL
  ,runtime           NUMERIC(5,1) 
  ,PRIMARY KEY(m_id)
);