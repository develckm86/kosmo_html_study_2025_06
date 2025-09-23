-- 데이터소스
--     url: jdbc:oracle:thin@//localhost:1521/XEPDB1
--     user: table_user
--     password: 1234

-- CREATE TABLE table_user.board(
--     no NUMBER,
--     title varchar2(50),
--     contents varchar2(100)
-- );
CREATE TABLE memeber(
    name varchar2(10),
    age NUMBER
);
RENAME memeber TO member;

-- varchar2 : 문자열 ''
-- number : 수
INSERT INTO member (name, age) VALUES ('이지형',20);
INSERT INTO member (name, age) VALUES ('김지형',25);
commit;
SELECT name, age FROM member;
SELECT * FROM member;







