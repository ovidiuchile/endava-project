DROP TABLE Keywords;
DROP TABLE Materials;
DROP TABLE Topics;
DROP TABLE Technologies;
DROP TABLE Users;

CREATE TABLE Technologies (
    technology_id BIGINT NOT NULL,
    name BIGINT NOT NULL,
    CONSTRAINT Technologies_pk PRIMARY KEY (technology_id)
);

CREATE TABLE Topics (
    topic_id BIGINT NOT NULL,
    name varchar(30) NOT NULL,
    technology_id BIGINT NOT NULL,
    CONSTRAINT Topics_pk PRIMARY KEY (topic_id)
);

CREATE TABLE Materials (
    material_id BIGINT NOT NULL,
    link varchar(50) NOT NULL,
    topic_id BIGINT NOT NULL,
    CONSTRAINT Materials_pk PRIMARY KEY (material_id)
);

CREATE TABLE Keywords (
	keyword_id BIGINT NOT NULL,
    topic_id BIGINT NOT NULL,
    keyword varchar(20) NOT NULL,
    CONSTRAINT Keywords_pk PRIMARY KEY (keyword_id)
);

CREATE TABLE Users (
    user_id BIGINT NOT NULL,
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


ALTER TABLE Materials ADD CONSTRAINT Materials_Topic FOREIGN KEY (topic_id)
    REFERENCES Topics (topic_id) ON DELETE CASCADE;


ALTER TABLE Keywords ADD CONSTRAINT Table_10_Topic FOREIGN KEY (topic_id)
    REFERENCES Topics (topic_id) ON DELETE CASCADE;


ALTER TABLE Topics ADD CONSTRAINT Topic_Technologies FOREIGN KEY (technology_id)
    REFERENCES Technologies (technology_id) ON DELETE CASCADE;


