-- from 서브쿼리 : 조회한 결과를 다시 조회한 대상으로 사용 Paging
SELECT * FROM EMP;

SELECT * FROM (SELECT * FROM DEPT);

SELECT DEPTNO,ROUND(AVG(SAL)) 급여평균
FROM EMP
GROUP BY DEPTNO
HAVING ROUND(AVG(SAL))>2000;

SELECT g.DEPTNO,g.급여평균
    FROM (SELECT DEPTNO,ROUND(AVG(SAL)) 급여평균
        FROM EMP
        GROUP BY DEPTNO) g
    WHERE 급여평균>2000;


-- ROWNUM  : 행을 출력할때 번호 작성 (정렬 이후에 동작)
SELECT r.* FROM (SELECT ROWNUM no, EMPNO, ENAME
    FROM EMP
--     WHERE no < 5
    ORDER BY EMPNO) r
WHERE r.no<5;

SELECT r.*
    FROM (SELECT ROWNUM no, EMPNO, ENAME
         FROM EMP) r
    ORDER BY EMPNO;


select AVG(sal) FROM EMP;

SELECT * FROM EMP WHERE SAL>2073;
-- where 절에 있는 단일행 서브쿼리
SELECT * FROM EMP WHERE SAL>(SELECT AVG(sal) FROM EMP);

-- 평균이 2000 이상인 부서의 사원
-- 10
-- 20
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING AVG(sal)>2000;

SELECT * FROM EMP WHERE DEPTNO IN (10,20);
-- where 절에 있는 다중행 서브쿼리
SELECT *
    FROM EMP
    WHERE DEPTNO
      IN (SELECT DEPTNO
          FROM EMP
          GROUP BY DEPTNO
          HAVING AVG(sal)>2000);
-- SELECT 절에 작성하는 서브쿼리=> 무조건 단일결과
SELECT
    e.ENAME,e.DEPTNO
    ,(SELECT
          AVG(g.SAL)
        FROM EMP g WHERE g.DEPTNO=e.DEPTNO)
    FROM EMP e;
-- 서브퀄 ?? => 조인 ??
SELECT e.*,v.평균
    FROM EMP e
        INNER JOIN (SELECT DEPTNO, AVG(sal) 평균
                      FROM EMP
                      GROUP BY DEPTNO) v
        ON e.DEPTNO=v.DEPTNO;

