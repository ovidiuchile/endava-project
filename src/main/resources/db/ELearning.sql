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
<<<<<<< HEAD
  answer_id bigint ,
=======
  answer_id bigserial ,
>>>>>>> 0fb7173189b8c5fccbe315d9b9a24c580215c9e1
  question_id bigint ,
  content text,
  correct bool ,
  score int ,
  CONSTRAINT Answers_pk PRIMARY KEY (answer_id)
);

-- Table: Keywords
CREATE TABLE Keywords (
  keyword_id BIGINT ,
  topic_id bigint ,
  keyword varchar(50) ,
  CONSTRAINT Keywords_pk PRIMARY KEY (keyword_id)
);

-- Table: Materials
CREATE TABLE Materials (
  material_id BIGINT,
  topic_id bigint,
  title varchar(100),
  link varchar(100),
  type bigint,
  upload_date date,
  content_editor_id bigint,
  CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

-- Table: Questions
CREATE TABLE Questions (
  question_id BIGINT ,
  test_id bigint ,
  question_type varchar(20) ,
  content text ,
  CONSTRAINT Questions_pk PRIMARY KEY (question_id)
);

-- Table: Technologies
CREATE TABLE Technologies (
  technology_id BIGINT ,
  name varchar(30) ,
  CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
);

-- Table: Tests
CREATE TABLE Tests (
  test_id BIGINT ,
  topic_id bigint ,
  title varchar(100) ,
  CONSTRAINT Tests_pk PRIMARY KEY (test_id)
);

-- Table: Tests_history
CREATE TABLE Tests_history (
  test_history_id BIGINT ,
  test_id bigint ,
  user_id bigint ,
  score int ,
  test_date date ,
  CONSTRAINT Tests_history_pk PRIMARY KEY (test_history_id)
);

-- Table: Topics
CREATE TABLE Topics (
  topic_id BIGINT primary key,
  technology_id bigint ,
  name varchar(30) 
);

-- Table: Users
CREATE TABLE Users (
  user_id BIGINT,
  user_type varchar(20) ,
  name varchar(100) ,
  surname varchar(100) ,
  email varchar(100) ,
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

INSERT INTO Users VALUES (1, 'normal user', 'name 1', 'surname 1', 'email1@endava.com', 'Password1', 'City 1', 'Address 1', '0987654321', 'Country1');
INSERT INTO Users VALUES (2, 'tutor', 'name 2', 'surname 2', 'email2@endava.com', 'Password2', 'City 2', 'Address 2', '0987654322', 'Country2');
INSERT INTO Users VALUES (3, 'content editor', 'name 3', 'surname 3', 'email3@endava.com', 'Password3', 'City 3', 'Address 3', '0987654323', 'Country3');
INSERT INTO Users VALUES (4, 'normal user', 'name 4', 'surname 4', 'email4@endava.com', 'Password4', 'City 4', 'Address 4', '0987654324', 'Country4');
INSERT INTO Users VALUES (5, 'admin', 'name 5', 'surname 5', 'email5@endava.com', 'Password5', 'City 5', 'Address 5', '0987654325', 'Country5');
INSERT INTO Users VALUES (6, 'normal user', 'name 6', 'surname 6', 'email6@endava.com', 'Password6', 'City 6', 'Address 6', '0987654326', 'Country6');
INSERT INTO Users VALUES (7, 'normal user', 'name 7', 'surname 7', 'email7@endava.com', 'Password7', 'City 7', 'Address 7', '0987654327', 'Country7');
INSERT INTO Users VALUES (8, 'content editor', 'name 8', 'surname 8', 'email8@endava.com', 'Password8', 'City 8', 'Address 8', '0987654328', 'Country8');
INSERT INTO Users VALUES (9, 'normal user', 'name 9', 'surname 9', 'email9@endava.com', 'Password9', 'City 9', 'Address 9', '0987654329', 'Country9');
INSERT INTO Users VALUES (10, 'tutor', 'name 10', 'surname 10', 'email10@endava.com', 'Password10', 'City 10', 'Address 10', '0987654310', 'Country10');
INSERT INTO Users VALUES (11, 'content editor', 'name 11', 'surname 11', 'email11@endava.com', 'Password11', 'City 11', 'Address 11', '0987654311', 'Country11');
INSERT INTO Users VALUES (12, 'admin', 'name 12', 'surname 12', 'email12@endava.com', 'Password12', 'City 12', 'Address 12', '0987654312', 'Country12');
INSERT INTO Users VALUES (13, 'tutor', 'name 13', 'surname 13', 'email13@endava.com', 'Password13', 'City 13', 'Address 13', '0987654313', 'Country13');
INSERT INTO Users VALUES (14, 'normal user', 'name 14', 'surname 14', 'email14@endava.com', 'Password14', 'City 14', 'Address 14', '0987654314', 'Country14');
INSERT INTO Users VALUES (15, 'tutor', 'name 15', 'surname 15', 'email15@endava.com', 'Password15', 'City 15', 'Address 15', '0987654315', 'Country15');
INSERT INTO Users VALUES (16, 'content editor', 'name 16', 'surname 16', 'email16@endava.com', 'Password16', 'City 16', 'Address 16', '0987654316', 'Country16');
INSERT INTO Users VALUES (17, 'tutor', 'name 17', 'surname 17', 'email17@endava.com', 'Password17', 'City 17', 'Address 17', '0987654317', 'Country17');
INSERT INTO Users VALUES (18, 'normal user', 'name 18', 'surname 18', 'email18@endava.com', 'Password18', 'City 18', 'Address 18', '0987654318', 'Country18');
INSERT INTO Users VALUES (19, 'content editor', 'name 19', 'surname 19', 'email19@endava.com', 'Password19', 'City 19', 'Address 19', '0987654319', 'Country19');
INSERT INTO Users VALUES (20, 'normal user', 'name 20', 'surname 20', 'email20@endava.com', 'Password20', 'City 20', 'Address 20', '0987654320', 'Country20');

INSERT INTO Technologies VALUES (1, 'Java');
INSERT INTO Technologies VALUES (2, 'C++');
INSERT INTO Technologies VALUES (3, 'SQL');
INSERT INTO Technologies VALUES (4, 'DotNet');
INSERT INTO Technologies VALUES (5, 'PHP5');
INSERT INTO Technologies VALUES (6, 'JavaScript');
INSERT INTO Technologies VALUES (7, 'HTML5 and CSS3');
INSERT INTO Technologies VALUES (8, 'ORM Technologies');
INSERT INTO Technologies VALUES (9, 'Haskell');
INSERT INTO Technologies VALUES (10, 'Cryptography');

INSERT INTO Topics VALUES (1, 1, 'OOP Principles');
INSERT INTO Topics VALUES (2, 1, 'Exceptions');
INSERT INTO Topics VALUES (3, 2, 'Pointers');
INSERT INTO Topics VALUES (4, 3, 'Syntax');
INSERT INTO Topics VALUES (5, 3, 'DDL');
INSERT INTO Topics VALUES (6, 3, 'DML');
INSERT INTO Topics VALUES (7, 6, 'Syntax');
INSERT INTO Topics VALUES (8, 9, 'Syntax');
INSERT INTO Topics VALUES (9, 9, 'Lists');
INSERT INTO Topics VALUES (10, 10, 'Ancient Cryptography');
INSERT INTO Topics VALUES (11, 10, 'Ciphers');
INSERT INTO Topics VALUES (12, 10, 'Modern Cryptography');
INSERT INTO Topics VALUES (13, 10, 'Modular Arithmetic');
INSERT INTO Topics VALUES (14, 10, 'Primality Test');
INSERT INTO Topics VALUES (15, 10, 'Randomized Algorithms');
INSERT INTO Topics VALUES (16, 4, 'Architecture');
INSERT INTO Topics VALUES (17, 4, 'Design Principles');
INSERT INTO Topics VALUES (18, 5, 'Syntax');
INSERT INTO Topics VALUES (19, 5, 'Operators');
INSERT INTO Topics VALUES (20, 5, 'Functions');
INSERT INTO Topics VALUES (21, 6, 'Variables and Operators');
INSERT INTO Topics VALUES (22, 7, 'Build your first website!');
INSERT INTO Topics VALUES (23, 7, 'Selectors');
INSERT INTO Topics VALUES (24, 7, 'Forms');
INSERT INTO Topics VALUES (25, 8, 'Overview');
INSERT INTO Topics VALUES (26, 3, 'PL/SQL');
INSERT INTO Topics VALUES (27, 3, 'Transactions');
INSERT INTO Topics VALUES (28, 6, 'Functions');
INSERT INTO Topics VALUES (29, 6, 'Objects');
INSERT INTO Topics VALUES (30, 6, 'Events');
INSERT INTO Topics VALUES (31, 6, 'JSON');
INSERT INTO Topics VALUES (32, 9, 'Functions');
INSERT INTO Topics VALUES (33, 9, 'Types');
INSERT INTO Topics VALUES (34, 9, 'Monads');
INSERT INTO Topics VALUES (35, 9, 'Recursion');
INSERT INTO Topics VALUES (36, 5, 'Forms');
INSERT INTO Topics VALUES (37, 5, 'Cookies');

INSERT INTO Materials VALUES (1, 1, 'A presentation...', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('05.07.2015', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (13, 1, 'A on...', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('05.07.2015', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (2, 3, 'A picture', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (3, 5, 'The Basics of SQL', 'http://sqlinstructor.com/wp-content/uploads/2015/01/SQLDMLDDLimage.jpg', 0, to_date('12.06.2013', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (4, 10, 'Caesar Cipher', 'http://i.imgur.com/tFnX1co.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (5, 12, 'RSA Decryption Time by Key Length', 'http://www.javamex.com/tutorials/cryptography/RSADecryptionTime.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (6, 12, 'Diffie Hellman Key Exchange part 1', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (7, 12, 'Diffie Hellman Key Exchange part 2', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (8, 31, 'JSON vs XML', 'http://cdn2.hubspot.net/hub/126065/file-239461408-png/images/jsonxmlresults.png', 0, to_date('30.07.2015', 'DD.MM.YYYY'), 11);
INSERT INTO Materials VALUES (9, 24, 'Login Form', 'https://cdn1.freshdesignweb.com/wp-content/uploads/2015/01/Login-to-Everdwell.jpg', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (10, 26, 'Tutorial Introduction to PL/SQL', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (11, 33, 'Types and Classes', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (12, 35, 'Recursion', 'http://s3.amazonaws.com/lyah/maxs.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);

INSERT INTO Keywords VALUES (1, 1, 'oop');
INSERT INTO Keywords VALUES (2, 1, 'inheritance');
INSERT INTO Keywords VALUES (3, 2, 'checked');
INSERT INTO Keywords VALUES (4, 2, 'unchecked');
INSERT INTO Keywords VALUES (5, 5, 'create');
INSERT INTO Keywords VALUES (6, 5, 'drop');
INSERT INTO Keywords VALUES (7, 5, 'alter');
INSERT INTO Keywords VALUES (8, 6, 'select');
INSERT INTO Keywords VALUES (9, 6, 'insert');
INSERT INTO Keywords VALUES (10, 6, 'update');
INSERT INTO Keywords VALUES (11, 6, 'delete');
INSERT INTO Keywords VALUES (12, 9, 'head');
INSERT INTO Keywords VALUES (13, 9, 'tail');
INSERT INTO Keywords VALUES (14, 16, 'framework');
INSERT INTO Keywords VALUES (15, 24, 'button');
INSERT INTO Keywords VALUES (16, 22, 'div');
INSERT INTO Keywords VALUES (17, 26, 'procedure');
INSERT INTO Keywords VALUES (18, 26, 'function');
INSERT INTO Keywords VALUES (19, 27, 'acid');
INSERT INTO Keywords VALUES (20, 10, 'frequency');
INSERT INTO Keywords VALUES (21, 10, 'secrecy');
INSERT INTO Keywords VALUES (22, 10, 'enigma');
INSERT INTO Keywords VALUES (23, 11, 'xor');
INSERT INTO Keywords VALUES (24, 11, 'bitwise');
INSERT INTO Keywords VALUES (25, 12, 'logarithm');
INSERT INTO Keywords VALUES (26, 12, 'rsa');
INSERT INTO Keywords VALUES (27, 12, 'exchange');
INSERT INTO Keywords VALUES (28, 13, 'modulo');
INSERT INTO Keywords VALUES (29, 13, 'congruence');
INSERT INTO Keywords VALUES (30, 13, 'quotient');
INSERT INTO Keywords VALUES (31, 14, 'prime');
INSERT INTO Keywords VALUES (32, 14, 'division');
INSERT INTO Keywords VALUES (33, 15, 'random');
INSERT INTO Keywords VALUES (34, 15, 'probability');
INSERT INTO Keywords VALUES (35, 31, 'data');
INSERT INTO Keywords VALUES (36, 31, 'parse');
INSERT INTO Keywords VALUES (37, 31, 'pair');
INSERT INTO Keywords VALUES (38, 31, 'ordered');

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

