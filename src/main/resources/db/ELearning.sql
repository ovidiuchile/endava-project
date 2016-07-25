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
  answer_id bigserial ,
  question_id bigint ,
  content text,
  correct bool ,
  score int ,
  CONSTRAINT Answers_pk PRIMARY KEY (answer_id)
);

-- Table: Keywords
CREATE TABLE Keywords (
  keyword_id bigserial ,
  topic_id bigint ,
  keyword varchar(50) ,
  CONSTRAINT Keywords_pk PRIMARY KEY (keyword_id)
);

-- Table: Materials
CREATE TABLE Materials (
  material_id bigserial,
  topic_id bigint,
  title varchar(100),
  link varchar(100),
  upload_date date,
  content_editor_id bigint,
  CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

-- Table: Questions
CREATE TABLE Questions (
  question_id bigserial ,
  test_id bigint ,
  question_type varchar(20) ,
  content text ,
  CONSTRAINT Questions_pk PRIMARY KEY (question_id)
);

-- Table: Technologies
CREATE TABLE Technologies (
  technology_id bigserial ,
  name varchar(30) ,
  CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
);

-- Table: Tests
CREATE TABLE Tests (
  test_id bigserial ,
  topic_id bigint ,
  title varchar(100) ,
  CONSTRAINT Tests_pk PRIMARY KEY (test_id)
);

-- Table: Tests_history
CREATE TABLE Tests_history (
  test_history_id bigserial ,
  test_id bigint ,
  user_id bigint ,
  score int ,
  test_date date ,
  CONSTRAINT Tests_history_pk PRIMARY KEY (test_history_id)
);

-- Table: Topics
CREATE TABLE Topics (
  topic_id bigserial,
  technology_id bigint ,
  name varchar(30) ,
  CONSTRAINT Topics_pk PRIMARY KEY (topic_id)
);

-- Table: Users
CREATE TABLE Users (
  user_id bigserial,
  user_type varchar(20) ,
  name varchar(30) ,
  surname varchar(30) ,
  email varchar(50) ,
  password varchar(20) ,
  city varchar(30) NULL,
  address text NULL,
  phoneNumber varchar(13) NULL,
  country varchar(30) NULL,
  CONSTRAINT Users_pk PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: Answers_Questions (table: Answers)
ALTER TABLE Answers ADD CONSTRAINT Answers_Questions FOREIGN KEY (question_id)
REFERENCES Questions (question_id) ON DELETE CASCADE;

-- Reference: Materials_Topic (table: Materials)
ALTER TABLE Materials ADD CONSTRAINT Materials_Topic FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id) ON DELETE CASCADE;

-- Reference: Materials_Users (table: Materials)
ALTER TABLE Materials ADD CONSTRAINT Materials_Users FOREIGN KEY (content_editor_id)
REFERENCES Users (user_id) ON DELETE CASCADE;

-- Reference: Questions_Tests (table: Questions)
ALTER TABLE Questions ADD CONSTRAINT Questions_Tests FOREIGN KEY (test_id)
REFERENCES Tests (test_id) ON DELETE CASCADE;

-- Reference: Table_10_Topic (table: Keywords)
ALTER TABLE Keywords ADD CONSTRAINT Table_10_Topic FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id) ON DELETE CASCADE;

-- Reference: Tests_Topics (table: Tests)
ALTER TABLE Tests ADD CONSTRAINT Tests_Topics FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id) ON DELETE CASCADE;

-- Reference: Tests_history_Tests (table: Tests_history)
ALTER TABLE Tests_history ADD CONSTRAINT Tests_history_Tests FOREIGN KEY (test_id)
REFERENCES Tests (test_id) ON DELETE CASCADE;

-- Reference: Tests_history_Users (table: Tests_history)
ALTER TABLE Tests_history ADD CONSTRAINT Tests_history_Users FOREIGN KEY (user_id)
REFERENCES Users (user_id) ON DELETE CASCADE;

-- Reference: Topic_Technologies (table: Topics)
ALTER TABLE Topics ADD CONSTRAINT Topic_Technologies FOREIGN KEY (technology_id)
REFERENCES Technologies (technology_id) ON DELETE CASCADE;

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

INSERT INTO Materials VALUES (1, 1, 'A presentation...', 'C:\Users\apirvu\Desktop\p.pptx', to_date('05.07.2015', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (2, 3, 'A picture', 'C:\Users\apirvu\Desktop\download.jpg', to_date('12.12.2015', 'DD.MM.YYYY'), 3);

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

