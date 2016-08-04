DROP TABLE Answers CASCADE;
DROP TABLE Materials CASCADE;
DROP TABLE Questions CASCADE;
DROP TABLE Topics CASCADE;
DROP TABLE Users CASCADE;
DROP TABLE Technologies CASCADE;

CREATE TABLE Answers (
  answer_id bigint ,
  question_id bigint ,
  answer_text text,
  correct bool ,
  CONSTRAINT Answers_pk PRIMARY KEY (answer_id)
);

-- Table: Materials
CREATE TABLE Materials (
  material_id BIGINT,
  topic_id bigint,
  title varchar(100),
  description text,
  link varchar(1000),
  type bigint,
  upload_date varchar(20),
  content_editor_id bigint,
  CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

-- Table: Questions
CREATE TABLE Questions (
  question_id BIGINT ,
  topic_id BIGINT ,
  question_text text ,
  start_date varchar(20) ,
  end_date varchar(20) ,
  CONSTRAINT Questions_pk PRIMARY KEY (question_id)
);

-- Table: Technologies
CREATE TABLE Technologies (
  technology_id BIGINT ,
  name varchar(30) ,
  CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
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

-- Reference: Questions_Topic (table: Questions)
ALTER TABLE Questions ADD CONSTRAINT Questions_Topic FOREIGN KEY (topic_id)
REFERENCES Topics (topic_id) ON DELETE CASCADE;

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

INSERT INTO Materials VALUES (1, 1, 'OOP Principles', 'Object-oriented programming is the foundation of many current application development approaches. If you want to succeed with clean coding, agile and design patterns, you have to master OOP.', 'https://www.pluralsight.com/content/dam/pluralsight/resources/blog/2014/07/understanding-object-oriented-programming-in-c/wp/img/figure22.jpg', 0, '2015-07-05', 3);
INSERT INTO Materials VALUES (2, 1, 'What is OOP?', 'OOP Definition', 'http://image.slidesharecdn.com/boost-your-oop-with-fp-111119125254-phpapp02/95/boost-youroopwithfp-30-728.jpg?cb=1321709443', 0, to_date('2015-07-05', 'YYYY-MM-DD'), 3);
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
INSERT INTO Materials VALUES (14, 7, 'Tutorial Introduction to PL/SQL', 'Just a video', 'https://www.youtube.com/embed/Wvl_zDdvUuE?list=PLuCTRl2rPt4aiptyRKJFpHO73sf9gdydy', 1, to_date('12.12.2015', 'DD.MM.YYYY'), 16);
INSERT INTO Materials VALUES (15, 7, 'PL/SQL Procedure', 'How to create a procedure in PL/SQL', 'http://www.ibm.com/developerworks/data/library/techarticle/dm-0908plsqloptim/fig033.jpg', 0, to_date('27.07.2016', 'DD.MM.YYYY'), 3);
INSERT INTO Materials VALUES (16, 12, 'Classes and Types', 'This diagram, copied from the Haskell Report, shows the relationships between the classes and types in the Standard Prelude. The names in bold are the classes, while the non-bold text stands for the types that are instances of each class ((->) refers to functions and [], to lists). The arrows linking classes indicate the inheritance relationships, pointing to the inheriting class.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Classes.svg/480px-Classes.svg.png', 0, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (17, 12, 'Types and Classes', 'Every well formed expression has a type, which can be automatically calculated at compile time using a process called type inference.', 'https://docs.google.com/presentation/d/1fiQpunOwBJjPrVXrqqVjM9Ad1pA_hnW5_XrPTTDyX4g/edit?usp=sharing', 2, to_date('08.10.2016', 'DD.MM.YYYY'), 19);
INSERT INTO Materials VALUES (18, 13, 'Caesar Cipher', 'Ancient times, simple cipher', 'http://i.imgur.com/tFnX1co.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (19, 15, 'RSA Decryption Time by Key Length', 'This is a graphic', 'http://www.javamex.com/tutorials/cryptography/RSADecryptionTime.png', 0, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (20, 15, 'Diffie Hellman Key Exchange part 1', 'Key exchange part 1', 'https://www.youtube.com/embed/MsqqpO9R5Hc', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
INSERT INTO Materials VALUES (21, 15, 'Diffie Hellman Key Exchange part 2', 'Key exchange part 2', 'https://www.youtube.com/embed/M-0qt6tdHzk', 1, to_date('08.01.2016', 'DD.MM.YYYY'), 8);
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

INSERT INTO Questions VALUES (1, 1, 'A process that involves recognizing and focusing on the important characteristics of a situation or object is known as:', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (2, 1, 'Which statement is true regarding an object?', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (3, 1, 'In object oriented programming, composition relates to', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (4, 1, 'In object oriented programming new classes can be defined by extending existing classes. This is an example of:', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (5, 1, 'Which of the following does not belong: If a class inherits from some other  class, it should', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (6, 1, 'Object oriented inheritance models the', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (7, 1, 'The wrapping up of data and functions into a single unit is called', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (8, 1, 'Polymorphism', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (9, 1, 'In object oriented programming new classes can be defined by extending existing classes. This is an example of:', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (10, 1, 'Given a class named student, which of the following is a valid constructor declaration for the class?', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (11, 1, 'In Java, declaring a class abstract is useful', '2015-03-12', '2016-03-11');
INSERT INTO Questions VALUES (12, 1, 'Which of these field declarations are legal within the body of an interface?', '2015-03-12', '2016-03-11');

INSERT INTO Answers VALUES (1, 1, 'Encapsulation', FALSE);
INSERT INTO Answers VALUES (2, 1, 'Polymorphism', FALSE);
INSERT INTO Answers VALUES (3, 1, 'Abstraction', TRUE);
INSERT INTO Answers VALUES (4, 1, 'Inheritance', FALSE);
INSERT INTO Answers VALUES (5, 1, 'Object persistence', FALSE);
INSERT INTO Answers VALUES (6, 2, 'An object is what classes instantiated are from', FALSE);
INSERT INTO Answers VALUES (7, 2, 'An object is an instance of a class', TRUE);
INSERT INTO Answers VALUES (8, 2, 'An object is a variable', FALSE);
INSERT INTO Answers VALUES (9, 2, 'An object is a reference to an attribute', FALSE);
INSERT INTO Answers VALUES (10, 2, 'An  object is not an instance of a class', FALSE);
INSERT INTO Answers VALUES (11, 3, 'The use of consistent coding conventions', FALSE);
INSERT INTO Answers VALUES (12, 3, 'The organization of components interacting to achieve a coherent, common behavior', TRUE);
INSERT INTO Answers VALUES (13, 3, 'The use of inheritance to achieve polymorphic behavior', FALSE);
INSERT INTO Answers VALUES (14, 3, 'The organization of components interacting not to achieve a coherent common behavior', FALSE);
INSERT INTO Answers VALUES (15, 3, 'The use of data hiding to achieve polymorphic behavior', FALSE);
INSERT INTO Answers VALUES (16, 4, 'Encapsulation', FALSE);
INSERT INTO Answers VALUES (17, 4, 'Interface', FALSE);
INSERT INTO Answers VALUES (18, 4, 'Composition', FALSE);
INSERT INTO Answers VALUES (19, 4, 'Inheritance', TRUE);
INSERT INTO Answers VALUES (20, 4, 'Aggregation', FALSE);
INSERT INTO Answers VALUES (21, 5, 'Make use of the parent class''s capabilities', FALSE);
INSERT INTO Answers VALUES (22, 5, 'Over-ride or add the minimum to accomplish the derived class'' purpose', TRUE);
INSERT INTO Answers VALUES (23, 5, 'Over-ride all the methods of its parent class', FALSE);
INSERT INTO Answers VALUES (24, 5, 'Make sure the result "IS-A-KIND-OF" its base class', FALSE);
INSERT INTO Answers VALUES (25, 5, 'Make sure the result “contains” its base class', FALSE);
INSERT INTO Answers VALUES (26, 6, '"is a kind of" relationship', TRUE);
INSERT INTO Answers VALUES (27, 6, '"has a" relationship', FALSE);
INSERT INTO Answers VALUES (28, 6, '"want to be" relationship', FALSE);
INSERT INTO Answers VALUES (29, 6, 'inheritance does not describe any kind of relationship between classes', FALSE);
INSERT INTO Answers VALUES (30, 6, '“contains” of relationship', FALSE);
INSERT INTO Answers VALUES (31, 7, 'Encapsulation', TRUE);
INSERT INTO Answers VALUES (32, 7, 'Abstraction', FALSE);
INSERT INTO Answers VALUES (33, 7, 'Data Hiding', FALSE );
INSERT INTO Answers VALUES (34, 7, 'Polymorphism', FALSE);
INSERT INTO Answers VALUES (35, 7, 'Message passing', FALSE);
INSERT INTO Answers VALUES (36, 8, 'Is not supported by Java', FALSE);
INSERT INTO Answers VALUES (37, 8, 'Refers to the ability of two or more objects belonging to different classes to respond to exactly the same message in different class-specific ways', FALSE);
INSERT INTO Answers VALUES (38, 8, 'Simplifies code maintenance', FALSE);
INSERT INTO Answers VALUES (39, 8, 'Not simplifies code manintenance', FALSE);
INSERT INTO Answers VALUES (40, 8, 'Refers to the ability of two or more objects belonging to different classes to respond to exactly the same message in different class –specific ways and simplifies code maintenance', TRUE);
INSERT INTO Answers VALUES (41, 9, 'Encapsulation', FALSE);
INSERT INTO Answers VALUES (42, 9, 'Interface', FALSE);
INSERT INTO Answers VALUES (43, 9, 'Composition', FALSE);
INSERT INTO Answers VALUES (44, 9, 'Inheritance', TRUE);
INSERT INTO Answers VALUES (45, 9, 'Aggregation', FALSE);
INSERT INTO Answers VALUES (46, 10, 'Student (student s)  {  } ', TRUE);
INSERT INTO Answers VALUES (47, 10, 'Student student ( ) {  }', FALSE);
INSERT INTO Answers VALUES (48, 10, 'Private final student ( ) {  }', FALSE);
INSERT INTO Answers VALUES (49, 10, 'Void student (  )  {   }', FALSE);
INSERT INTO Answers VALUES (50, 10, 'Static void student(){ }', FALSE);
INSERT INTO Answers VALUES (51, 11, 'To prevent developers from further extending the class', FALSE);
INSERT INTO Answers VALUES (52, 11, 'When it doesn''t make sense to have objects of that class', TRUE);
INSERT INTO Answers VALUES (53, 11, 'When default implementations of some methods are not desirable', FALSE);
INSERT INTO Answers VALUES (54, 11, 'To force developers to extend the class not to use its capabilities', FALSE);
INSERT INTO Answers VALUES (55, 11, 'When it makes sense to have objects of that class', FALSE);
INSERT INTO Answers VALUES (56, 12, 'private final static int answer = 42', FALSE);
INSERT INTO Answers VALUES (57, 12, 'public static int answer = 42', TRUE);
INSERT INTO Answers VALUES (58, 12, 'final static answer = 42', FALSE);
INSERT INTO Answers VALUES (59, 12, 'int answer', FALSE);
INSERT INTO Answers VALUES (60, 12, 'No error', FALSE);

-- End of file.