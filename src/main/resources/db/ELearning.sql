-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-07-21 15:00:22.037

-- tables
-- Table: Answers

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
  upload_date date NOT NULL,
  content_editor_id bigint NOT NULL,
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

-- Reference: Materials_Users (table: Materials)
ALTER TABLE Materials ADD CONSTRAINT Materials_Users FOREIGN KEY (content_editor_id)
REFERENCES Users (user_id);

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

INSERT INTO Users VALUES (1, 'normal user', 'name 1', 'surname 1', 'email1@a.com', 'pass1', 'city 1');
INSERT INTO Users VALUES (2, 'tutor', 'name 2', 'surname 2', 'email2@a.com', 'pass2', 'city 2');
INSERT INTO Users VALUES (3, 'content editor', 'name 3', 'surname 3', 'email3@a.com', 'pass3');
INSERT INTO Users VALUES (4, 'normal user', 'name 4', 'surname 4', 'email4@a.com', 'pass4');

INSERT INTO Technologies VALUES (1, 'Java');
INSERT INTO Technologies VALUES (2, 'C++');
INSERT INTO Technologies VALUES (3, 'SQL');

INSERT INTO Topics VALUES (1, 1, 'OOP Principles');
INSERT INTO Topics VALUES (2, 1, 'Exceptions');
INSERT INTO Topics VALUES (3, 2, 'Pointers');

INSERT INTO Materials VALUES (1, 1, 'C:\Users\apirvu\Desktop\p.pptx');
INSERT INTO Materials VALUES (2, 3, 'C:\Users\apirvu\Desktop\download.jpg');

INSERT INTO Keywords VALUES (1, 1, 'OOP');
INSERT INTO Keywords VALUES (2, 1, 'Inheritance');
INSERT INTO Keywords VALUES (3, 2, 'Checked');
INSERT INTO Keywords VALUES (4, 3, 'Unchecked');

INSERT INTO Tests VALUES (1, 1, 'OOP Test');
INSERT INTO Tests VALUES (2, 1, 'Exceptions Test');

INSERT INTO Questions VALUES (1, 1, 'Multiple Choice', 'This is a question...');
INSERT INTO Questions VALUES (2, 1, 'Single Choice', 'This is another question...');
INSERT INTO Questions VALUES (3, 1, 'Written Answer', 'This is a question which is not supposed to have an answer in Answers...');

INSERT INTO Answers VALUES (1, 1, 'Answer no. 1', TRUE , 10);
INSERT INTO Answers VALUES (2, 1, 'Answer no. 2', TRUE , 10);
INSERT INTO Answers VALUES (3, 1, 'Answer no. 3', FALSE , 0);
INSERT INTO Answers VALUES (4, 2, 'Answer no. 1', TRUE , 20);
INSERT INTO Answers VALUES (5, 2, 'Answer no. 2', FALSE , -5);

INSERT INTO Tests_history VALUES (1, 1, 1, 0, to_date('05.12.2015', 'DD.MM.YYYY'));
INSERT INTO Tests_history VALUES (2, 1, 1, 20, to_date('19.03.2016', 'DD.MM.YYYY'));
INSERT INTO Tests_history VALUES (3, 1, 4, 10, to_date('27.06.2016', 'DD.MM.YYYY'));
INSERT INTO Tests_history VALUES (4, 2, 1, -5, to_date('22.07.2016', 'DD.MM.YYYY'));

-- End of file.

