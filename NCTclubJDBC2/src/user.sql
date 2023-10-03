
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
   userrole VARCHAR2(10) CHECK (userrole IN ('USER', 'ADMIN')),
   regdate DATE DEFAULT SYSDATE
);

CREATE TABLE nctmembers (
    memberId NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    birthdate DATE,
    nationality VARCHAR2(255) NOT NULL,
    position VARCHAR2(200) NOT NULL,
    mbti VARCHAR2(4),
    image VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT SYSDATE
);

CREATE TABLE nctgroups (
    groupId NUMBER PRIMARY KEY,
    groupName VARCHAR2(255),
    memberRefId NUMBER,
    FOREIGN KEY (memberRefId) REFERENCES nctmembers(memberId)
);

CREATE TABLE comments (
    commentid NUMBER PRIMARY KEY,
    nctmember_id NUMBER NOT NULL,    -- 댓글의 대상인 nctmembers의 ID
    userid NUMBER NOT NULL,          -- 댓글을 남긴 사용자의 ID
    parents_id NUMBER NULL,          -- 상위 댓글 ID (null이면 최상위 댓글)
    contents VARCHAR2(255) NOT NULL,
    depth  NUMBER DEFAULT 1 CHECK (depth IN (1, 2)),  -- 댓글의 깊이 (1: 최상위, 2: 답글)
    is_deleted   NUMBER DEFAULT 0,    -- 댓글이 삭제되었는지 여부 (0: 아니오, 1: 예)
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