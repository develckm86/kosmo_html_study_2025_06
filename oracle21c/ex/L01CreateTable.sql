-- 데이터소스
--     url: jdbc:oracle:thin@//localhost:1521/XEPDB1
--     user: system
--     password: oracle
-- select 7*8 from dual;

CREATE USER table_user IDENTIFIED BY "1234"
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;

GRANT RESOURCE, CONNECT TO table_user;

CREATE TABLE table_user.board(
    no NUMBER,
    title varchar2(50),
    contents varchar2(100)
);