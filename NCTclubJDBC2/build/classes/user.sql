
-- 사용자
CREATE TABLE USERS (
   id NUMBER PRIMARY KEY,
   userId VARCHAR2(50) UNIQUE NOT NULL,
   password VARCHAR2(200) NOT NULL,
   username VARCHAR2(100) NOT NULL,
   nickname VARCHAR2(50) NOT NULL,
   birthdate DATE,
   phone VARCHAR2(15),
   email VARCHAR2(100),
   address VARCHAR2(300),
   userrole CHAR(5) CHECK (userrole IN ('USER', 'ADMIN')),
   regdate DATE DEFAULT SYSDATE
);
create SEQUENCE USERS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
  
-- nct 맴버
 CREATE TABLE nctmembers (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    birthdate DATE,
    nationality VARCHAR2(255) NOT NULL,
    position VARCHAR2(200)  NOT NULL,
    mbti    VARCHAR2(4),
    image   VARCHAR2(100)   NOT NULL,
    regdate     DATE DEFAULT SYSDATE
);

--nct 그룹
CREATE TABLE nctgroups (
    memberId NUMBER,
    groupId NUMBER,
    PRIMARY KEY (memberId, groupId),
    FOREIGN KEY (memberId) REFERENCES nctmembers(id),
    FOREIGN KEY (groupId) REFERENCES groups(id)
);

--그룹명
CREATE TABLE groups (
    id NUMBER PRIMARY KEY,
    groupName VARCHAR2(255)
);


CREATE SEQUENCE nctmembers_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;


CREATE SEQUENCE groups_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
