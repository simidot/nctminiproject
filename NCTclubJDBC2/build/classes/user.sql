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

-- 더미 사용자 1
INSERT INTO USERS (id, user_id, password, full_name, nickname, birthdate, phone, email, address, user_role, regdate)
VALUES (USERS_SEQ.NEXTVAL, 'john_doe', 'password123', 'John Doe', 'Johny', TO_DATE('1990-05-10', 'YYYY-MM-DD'), '123-456-7890', 'john.doe@email.com', '1234 Elm Street, Anytown', 'USER', SYSDATE);

-- 더미 사용자 2
INSERT INTO USERS (id, user_id, password, full_name, nickname, birthdate, phone, email, address, user_role, regdate)
VALUES (USERS_SEQ.NEXTVAL, 'admin01', 'adminpass', 'Admin User', 'Admin', TO_DATE('1985-10-15', 'YYYY-MM-DD'), '123-456-7891', 'admin@email.com', '1234 Admin Street, Anytown', 'ADMIN', SYSDATE);

-- 더미 사용자 3
INSERT INTO USERS (id, user_id, password, full_name, nickname, birthdate, phone, email, address, user_role, regdate)
VALUES (USERS_SEQ.NEXTVAL, 'jane_doe', 'password456', 'Jane Doe', 'Janey', TO_DATE('1992-08-20', 'YYYY-MM-DD'), '123-456-7892', 'jane.doe@email.com', '1234 Oak Street, Anytown', 'USER', SYSDATE);

select * from USERS;

drop sequence USERS_SEQ;

drop table users;

commit;
desc users;

INSERT INTO USERS (id,userid, password, username, nickname, birthdate, phone, email, address, userrole, regdate)
VALUES (USERS_SEQ.NEXTVAL,'jane_doe1', 'password2456', 'Jane 3Doe', 'J4aney', TO_DATE('1992-08-20', 'YYYY-MM-DD'), '123-456-7892', 'jane.doe@email.com', '1234 Oak Street, Anytown', 'USER', SYSDATE);