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
  answer_id bigint ,
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
  description text,
  link varchar(1000),
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
INSERT INTO Users VALUES (8, 'content editor', 'name', 'surname', 'email8@endava.com', 'Password8', 'City 8', 'Address 8', '0987654328', 'Country8');
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
INSERT INTO Technologies VALUES (4, 'Haskell');
INSERT INTO Technologies VALUES (5, 'Cryptography');

INSERT INTO Topics VALUES (1, 1, 'OOP Principles');
INSERT INTO Topics VALUES (2, 1, 'Exceptions');
INSERT INTO Topics VALUES (3, 2, 'Pointers');
INSERT INTO Topics VALUES (4, 3, 'Syntax');
INSERT INTO Topics VALUES (5, 3, 'DDL');
INSERT INTO Topics VALUES (6, 3, 'DML');
INSERT INTO Topics VALUES (7, 3, 'PL/SQL');
INSERT INTO Topics VALUES (8, 3, 'Transactions');
INSERT INTO Topics VALUES (9, 4, 'Syntax');
INSERT INTO Topics VALUES (10, 4, 'Lists');
INSERT INTO Topics VALUES (11, 4, 'Functions');
INSERT INTO Topics VALUES (12, 4, 'Types');
INSERT INTO Topics VALUES (13, 5, 'Ancient Cryptography');
INSERT INTO Topics VALUES (14, 5, 'Ciphers');
INSERT INTO Topics VALUES (15, 5, 'Modern Cryptography');
INSERT INTO Topics VALUES (16, 5, 'Modular Arithmetic');
INSERT INTO Topics VALUES (17, 5, 'Primality Test');
INSERT INTO Topics VALUES (18, 5, 'Randomized Algorithms');

INSERT INTO Materials VALUES (1, 1, 'OOP Principles', 'Object-oriented programming is the foundation of many current application development approaches. If you want to succeed with clean coding, agile and design patterns, you have to master OOP.', 'https://www.pluralsight.com/content/dam/pluralsight/resources/blog/2014/07/understanding-object-oriented-programming-in-c/wp/img/figure22.jpg', 0, to_date('2015-07-05', 'YYYY-MM-DD'), 3);
INSERT INTO Materials VALUES (2, 1, 'What is OOP?', 'OOP Definition', 'http://image.slidesharecdn.com/boost-your-oop-with-fp-111119125254-phpapp02/95/boost-youroopwithfp-30-728.jpg?cb=1321709443', 0, to_date('05.07.2015', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (3, 2, 'Exception Handling in Java', 'This video tutorial explains about the the Java Exception handling mechanism. I have explained the exception hierarchy, Errors, Checked exceptions and Unchecked Exceptions. An example has been demonstrated for try,catch, finally, throw and throws clause. I have also explained the rules related to catch block and also about creating the new checked exceptions and unchecked exceptions.', 'https://www.youtube.com/embed/4my7mKFaNQs', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (4, 2, 'Exception Class Hierarchy', 'All exceptions and errors extend from a common java.lang.Throwable parent class. Only Throwable objects can be thrown and caught.', 'https://newcircle.com/static/bookshelf/java_fundamentals_tutorial/images/ExceptionClassHierarchy.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (5, 3, 'SQL for Beginners', 'SQL is a special-purpose programming language designed for managing data in a relational database, and is used by a huge number of apps and organizations. Watch this Video to learn basics of SQL.', 'https://www.youtube.com/embed/7Vtl2WggqOg', 1, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (6, 3, 'SQL Syntax', 'Create a table', 'http://www.sqlshack.com/wp-content/uploads/2014/04/SQLSyntaxErrorsI.png', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (7, 4, 'SQL SELECT syntax', 'SQL SELECT syntax - The Select statement returns single or multiple columns (fields) from single or multiple tables.', 'http://mightydata.com/wp-content/uploads/2011/08/sql-select-clause.png', 0, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (8, 4, 'Structured Query Language Tutorial', 'Structured Query Language - SQL syntax', 'https://www.youtube.com/embed/yuzqEQFT3LI', 1, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (9, 4, 'SQL CREATE TABLE syntax', 'A railroad diagram example (SQLite CREATE TABLE)', 'http://www.devx.com/imagesvr_ce/6934/RailroadDiagram-SQLite-CREATETABLE.png', 0, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (10, 5, 'SQL Commands', 'DDL (Data Definition Language). CREATE - to create objects in the database. ALTER - alters the structure of the database. DROP - delete objects from the database. TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed. COMMENT - add comments to the data dictionary. RENAME - rename an object', 'http://3.bp.blogspot.com/--xgN8Tvt_6s/UTh0C2pu8JI/AAAAAAAAD4U/CxGfYRyj9WQ/s1600/Sql+lang.jpg', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (11, 5, 'The Basics of SQL', 'Simple things', 'http://sqlinstructor.com/wp-content/uploads/2015/01/SQLDMLDDLimage.jpg', 0, to_date('12.06.2013', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (12, 6, 'SQL DML-DCL-DDL-TCL', 'DML statements affect records in a table. These are basic operations we perform on data such as selecting a few records from a table, inserting new records, deleting unnecessary records, and updating/modifying existing records.', 'http://www.tech-recipes.com/wp-content/uploads/2015/05/DML-DCL-DDL-TCL-SQL.png', 0, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (13, 6, 'SQL DML', ' SQL DML statements to manipulate the data in your tables: INSERT / UPDATE / DELETE and SELECT', 'https://www.youtube.com/embed/5dszS8TxTJ4', 1, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (14, 7, 'Tutorial Introduction to PL/SQL', 'Just a video', 'https://www.youtube.com/watch?v=Wvl_zDdvUuE&list=PLuCTRl2rPt4aiptyRKJFpHO73sf9gdydy', 1, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (15, 7, 'PL/SQL Procedure', 'How to create a procedure in PL/SQL', 'http://www.ibm.com/developerworks/data/library/techarticle/dm-0908plsqloptim/fig033.jpg', 0, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (16, 12, 'Classes and Types', 'This diagram, copied from the Haskell Report, shows the relationships between the classes and types in the Standard Prelude. The names in bold are the classes, while the non-bold text stands for the types that are instances of each class ((->) refers to functions and [], to lists). The arrows linking classes indicate the inheritance relationships, pointing to the inheriting class.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Classes.svg/480px-Classes.svg.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (17, 12, 'Types and Classes', 'Every well formed expression has a type, which can be automatically calculated at compile time using a process called type inference.', 'https://docs.google.com/presentation/d/1fiQpunOwBJjPrVXrqqVjM9Ad1pA_hnW5_XrPTTDyX4g/edit?usp=sharing', 2, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (18, 13, 'Caesar Cipher', 'Ancient times, simple cipher', 'http://i.imgur.com/tFnX1co.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (19, 15, 'RSA Decryption Time by Key Length', 'This is a graphic', 'http://www.javamex.com/tutorials/cryptography/RSADecryptionTime.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (20, 15, 'Diffie Hellman Key Exchange part 1', 'Key exchange part 1', 'https://www.youtube.com/watch?v=MsqqpO9R5Hc', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (21, 15, 'Diffie Hellman Key Exchange part 2', 'Key exchange part 2', 'https://www.youtube.com/watch?v=M-0qt6tdHzk', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (22, 8, 'Transactions', 'ACID Properties, Schedules, Locking', 'https://docs.google.com/presentation/d/10sG2nnCq7Xukp50t6MLMhO9inESZ4VqJe4TX2-z8H_Y/edit?usp=sharing', 2, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (23, 8, 'ACID Properties', 'When talking databases that handle mission-critical business transactions and information you are talking ACID features. There are a set of properties that guarantee that database transactions are processed reliably, referred to as ACID (Atomicity, Consistency, Isolation, Durability).', 'https://media.licdn.com/mpr/mpr/shrinknp_800_800/AAEAAQAAAAAAAAiRAAAAJDZiNGZhZDE2LWUzOTYtNDAzNy04N2ExLTg1ZDQyZmM0ZjFmNA.jpg', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (24, 9, 'Haskell', 'Haskell Logo', 'http://verse.aasemoon.com/images/thumb/b/b0/602px-Haskell-Logo.svg.png/320px-602px-Haskell-Logo.svg.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (25, 9, 'Syntax', 'Haskell type classes and instances', 'http://perugini.cps.udayton.edu/teaching/books/PL/www/lecture_notes/figs/typeclass.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (26, 10, 'Lists', 'LazyCasts - Lists and Tuples', 'https://www.youtube.com/embed/_9t9pcIkkUk', 1, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (27, 10, 'Zip', 'Zipping two lists in Haskell', 'https://ijoshsmith.files.wordpress.com/2015/04/zip.png?w=640', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (28, 11, 'Functions', 'A function that sums a list of integers', 'http://image.slidesharecdn.com/slides-100930074853-phpapp01/95/highperformance-haskell-7-728.jpg?cb=1285832990', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (29, 11, 'Functions', 'Function syntax', 'https://www.youtube.com/embed/vuT8ts_neZw', 1, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (30, 13, 'Polyalphabetic Cipher', 'Creating a lighter fingerprint with a more intricate word-based cipher', 'https://www.youtube.com/embed/BgFJD7oCmDE', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (31, 14, 'XOR bitwise operation', 'How do we turn a color into a number? Well, right now you are looking at HTML colors which are defined using the RGB color model. This is an additive model based on mixing some amount of red, green and blue light.', 'https://cdn.kastatic.org/ka-perseus-images/d364160c9504e23699aee1d50dab2da0fdde58a6.jpg', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (32, 14, 'Shift Cipher', 'Example of Shift Cipher', 'http://image.slidesharecdn.com/deconstructingctctalk-131123145649-phpapp01/95/deconstructing-columnar-transposition-ciphers-18-638.jpg?cb=1385218712', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (33, 16, 'Modular arithmetic', 'Here the cycle consists of 12, mod 12. After having hit 11 and continuing to 12, the cycle is repeated. In this example, 0 and 12 are synonymous.', 'http://study.com/cimages/multimages/16/mod1.jpg', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (34, 16, 'WW2 Enigma Machine', 'The Enigma Machine', 'https://www.youtube.com/embed/-1ZFVwMXSXY', 1, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (35, 17, 'Prime Number Theorem', 'Prime Number Theorem', 'https://www.youtube.com/embed/7jzCJJIc59E', 1, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (36, 17, 'Prime numbers density', 'As shown in this figure, the densest concentrations of primes seem to occur mainly in curves whose offsets are prime.', 'https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/46025/versions/4/screenshot.jpg', 0, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (37, 18, 'Randomized Algorithms', 'Randomized Algorithms Intro', 'https://www.youtube.com/embed/WGMn16TDTjE', 1, to_date('2015-07-05', 'YYYY-MM-DD'), 16);
INSERT INTO Materials VALUES (38, 18, 'Fermat primality test', 'Fermat primality test', 'https://www.youtube.com/embed/xMj3jzFDZ38', 1, to_date('2015-07-05', 'YYYY-MM-DD'), 16);

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