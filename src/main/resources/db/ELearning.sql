DROP TABLE Answers;
DROP TABLE Keywords;
DROP TABLE Materials;
DROP TABLE Questions;
DROP TABLE Tests_history;
DROP TABLE Tests;
DROP TABLE Topics;
DROP TABLE Users;
DROP TABLE Technologies;

CREATE TABLE Answers (
  answer_id bigint NOT NULL,
  question_id bigint NOT NULL,
  text text NOT NULL,
  correct bool NOT NULL,
  score int NOT NULL,
  CONSTRAINT Answers_pk PRIMARY KEY (answer_id)
);

-- Table: Keywords
CREATE TABLE Keywords (
  keyword_id bigint NOT NULL,
  topic_id bigint NOT NULL,
  keyword varchar(50) NOT NULL,
  CONSTRAINT Keywords_pk PRIMARY KEY (keyword_id)
);

-- Table: Materials
CREATE TABLE Materials (
  material_id bigint NOT NULL,
  topic_id bigint NOT NULL,
  title varchar(100) NOT NULL,
  link varchar(100) NOT NULL,
  CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

-- Table: Questions
CREATE TABLE Questions (
  question_id bigint NOT NULL,
  test_id bigint NOT NULL,
  question_type varchar(20) NOT NULL,
  text text NOT NULL,
  CONSTRAINT Questions_pk PRIMARY KEY (question_id)
);

-- Table: Technologies
CREATE TABLE Technologies (
  technology_id bigint NOT NULL,
  name varchar(30) NOT NULL,
  CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
);

-- Table: Tests
CREATE TABLE Tests (
  test_id bigint NOT NULL,
  topic_id bigint NOT NULL,
  title varchar(100) NOT NULL,
  CONSTRAINT Tests_pk PRIMARY KEY (test_id)
);

-- Table: Tests_history
CREATE TABLE Tests_history (
  test_history_id bigint NOT NULL,
  test_id bigint NOT NULL,
  user_id bigint NOT NULL,
  score int NOT NULL,
  test_date date NOT NULL,
  CONSTRAINT Tests_history_pk PRIMARY KEY (test_history_id)
);

-- Table: Topics
CREATE TABLE Topics (
  topic_id bigint NOT NULL,
  technology_id bigint NOT NULL,
  name varchar(30) NOT NULL,
  CONSTRAINT Topics_pk PRIMARY KEY (topic_id)
);

-- Table: Users
CREATE TABLE Users (
  user_id bigint NOT NULL,
  user_type varchar(20) NOT NULL,
  name varchar(30) NOT NULL,
  surname varchar(30) NOT NULL,
  email varchar(50) NOT NULL,
  password varchar(20) NOT NULL,
  city varchar(30) NULL,
  address text NULL,
  phoneNumber varchar(13) NULL,
  country varchar(30) NULL,
  CONSTRAINT Users_pk PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: Answers_Questions (table: Answers)
ALTER TABLE Answers ADD CONSTRAINT Answers_Questions FOREIGN KEY (question_id)
REFERENCES Questions (question_id);

-- Reference: Materials_Topic (table: Materials)
ALTER TABLE Materials ADD CONSTRAINT Materials_Topic FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id);

-- Reference: Questions_Tests (table: Questions)
ALTER TABLE Questions ADD CONSTRAINT Questions_Tests FOREIGN KEY (test_id)
REFERENCES Tests (test_id);

-- Reference: Table_10_Topic (table: Keywords)
ALTER TABLE Keywords ADD CONSTRAINT Table_10_Topic FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id);

-- Reference: Tests_Topics (table: Tests)
ALTER TABLE Tests ADD CONSTRAINT Tests_Topics FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id);

-- Reference: Tests_history_Tests (table: Tests_history)
ALTER TABLE Tests_history ADD CONSTRAINT Tests_history_Tests FOREIGN KEY (test_id)
REFERENCES Tests (test_id);

-- Reference: Tests_history_Users (table: Tests_history)
ALTER TABLE Tests_history ADD CONSTRAINT Tests_history_Users FOREIGN KEY (user_id)
REFERENCES Users (user_id);

-- Reference: Topic_Technologies (table: Topics)
ALTER TABLE Topics ADD CONSTRAINT Topic_Technologies FOREIGN KEY (technology_id)
REFERENCES Technologies (technology_id);