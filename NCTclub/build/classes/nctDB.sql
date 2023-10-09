-- Drop sequences
DROP SEQUENCE USERS_SEQ;
DROP SEQUENCE nctmembers_seq;
DROP SEQUENCE nctgroups_seq;
DROP SEQUENCE comments_seq;

-- Drop tables
DROP TABLE comments;
DROP TABLE nctgroups;
DROP TABLE nctmembers;
DROP TABLE USERS;

-- Recreate tables and sequences

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
   userrole VARCHAR2(10) CHECK (userrole IN ('USER', 'ADMIN')),
   regdate DATE DEFAULT SYSDATE,
   is_deleted NUMBER DEFAULT 0
);

CREATE TABLE nctmembers (
    memberId NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    birthdate DATE,
    nationality VARCHAR2(255) NOT NULL,
    position VARCHAR2(200) NOT NULL,
    mbti VARCHAR2(4),
    image VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    is_deleted NUMBER DEFAULT 0
);

CREATE TABLE nctgroups (
    groupId NUMBER PRIMARY KEY,
    groupName VARCHAR2(255),
    memberRefId NUMBER,
    FOREIGN KEY (memberRefId) REFERENCES nctmembers(memberId)
);

CREATE TABLE comments (
    commentid NUMBER PRIMARY KEY,
    nctmember_id NUMBER NOT NULL,    
    userid NUMBER NOT NULL,          
    parents_id NUMBER NULL,          
    contents VARCHAR2(255) NOT NULL,
    depth  NUMBER DEFAULT 1 CHECK (depth IN (1, 2)),  
    is_deleted   NUMBER DEFAULT 0,    
    regdate DATE DEFAULT SYSDATE,
    FOREIGN KEY (nctmember_id) REFERENCES nctmembers(memberId),
    FOREIGN KEY (parents_id) REFERENCES comments(commentid),
    FOREIGN KEY (userid) REFERENCES USERS(id)
);

create SEQUENCE USERS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE nctmembers_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

CREATE SEQUENCE nctgroups_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

CREATE SEQUENCE comments_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
-- ID = admin 가진 회원 직접 ADMIN 권한 부    
UPDATE USERS
SET userrole = 'ADMIN'
WHERE userId = 'admin';    
