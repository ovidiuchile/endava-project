-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-07-20 14:37:56.342

-- tables
-- Table: Keywords
CREATE TABLE Keywords (
    topic_id int NOT NULL,
    keyword varchar(20) NOT NULL,
    CONSTRAINT Keywords_pk PRIMARY KEY (topic_id,keyword)
);

-- Table: Materials
CREATE TABLE Materials (
    material_id int NOT NULL,
    link varchar(50) NOT NULL,
    topic_id int NOT NULL,
    CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

-- Table: Technologies
CREATE TABLE Technologies (
    technology_id int NOT NULL,
    name varchar(30) NOT NULL,
    CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
);

-- Table: Topics
CREATE TABLE Topics (
    topic_id int NOT NULL,
    name varchar(30) NOT NULL,
    technology_id int NOT NULL,
    CONSTRAINT Topics_pk PRIMARY KEY (topic_id)
);

-- Table: Users
CREATE TABLE Users (
    user_id int NOT NULL,
    user_type varchar(20) NOT NULL,
    name varchar(30) NOT NULL,
    surname varchar(30) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(20) NOT NULL,
    city varchar(30) NULL,
    addres varchar(1000) NULL,
    phoneNumber varchar(13) NULL,
    country varchar(30) NULL,
    CONSTRAINT Users_pk PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: Materials_Topic (table: Materials)
ALTER TABLE Materials ADD CONSTRAINT Materials_Topic FOREIGN KEY Materials_Topic (topic_id)
    REFERENCES Topics (topic_id);

-- Reference: Table_10_Topic (table: Keywords)
ALTER TABLE Keywords ADD CONSTRAINT Table_10_Topic FOREIGN KEY Table_10_Topic (topic_id)
    REFERENCES Topics (topic_id);

-- Reference: Topic_Technologies (table: Topics)
ALTER TABLE Topics ADD CONSTRAINT Topic_Technologies FOREIGN KEY Topic_Technologies (technology_id)
    REFERENCES Technologies (technology_id);

-- End of file.

