-- EMP와 DEPT를 내부 조인하여 모든 사원의 이름(ENAME)과 소속 부서명(DNAME)을 조회하라.
SELECT ENAME,DNAME FROM EMP e,DEPT d WHERE e.DEPTNO=d.DEPTNO;
SELECT e.ENAME,d.DNAME
    FROM EMP e INNER JOIN DEPT d
    ON e.DEPTNO=d.DEPTNO;
SELECT e.ENAME, d.DNAME
    FROM EMP e NATURAL JOIN DEPT d;

-- 모든 사원의 이름과 소속 부서를 출력하되, 소속이 없는 사원도 포함되도록 LEFT JOIN을 사용하라.
SELECT e.EMPNO,e.ENAME,e.DEPTNO, d.DNAME, d.LOC
    FROM EMP e LEFT JOIN DEPT d
        ON e.DEPTNO=d.DEPTNO;

-- 모든 부서명을 출력하되, 사원이 없는 부서도 포함되도록 RIGHT JOIN을 사용하라.
SELECT e.EMPNO,e.ENAME,d.DEPTNO, d.DNAME, d.LOC
    FROM EMP e RIGHT JOIN DEPT d
     ON e.DEPTNO=d.DEPTNO;

-- EMP와 DEPT를 FULL OUTER JOIN하여 사원 또는 부서가 없어도 모두 조회하라.
SELECT e.EMPNO,e.ENAME,d.DEPTNO, d.DNAME, d.LOC
    FROM EMP e FULL OUTER JOIN DEPT d
    ON e.DEPTNO=d.DEPTNO;


-- EMP 테이블에서 사원 이름과 같은 부서에 속한 다른 사원의 이름을 SELF JOIN으로 조회하라.
 SELECT e.EMPNO, e.ENAME, e.DEPTNO, d.EMPNO,d.ENAME FROM EMP e INNER JOIN EMP d
    ON e.DEPTNO=d.DEPTNO AND e.EMPNO!=d.EMPNO
    ORDER BY e.EMPNO;
-- EMP와 DEPT를 CROSS JOIN하여 모든 가능한 조합을 조회하라.
    SELECT * FROM EMP,DEPT ORDER BY EMPNO,DEPT.DEPTNO;
    SELECT * FROM EMP CROSS JOIN DEPT ORDER BY EMPNO,DEPT.DEPTNO;
-- 사번의 DEPTNO와 부서의 DEPTNO가 일치하는 데이터만 INNER JOIN으로 조회하고, DEPTNO 순으로 정렬하라.
    SELECT * FROM EMP NATURAL JOIN DEPT ORDER BY DEPTNO;

-- 사원의 이름, 부서명을 출력하되, 부서명이 없는 경우 "NO DEPT"로 표시하라. (LEFT JOIN + NVL/COALESCE 활용)
SELECT e.ENAME,NVL(d.DNAME,'NO DEPT')
    FROM EMP e LEFT JOIN DEPT d
    ON e.DEPTNO=d.DEPTNO
    ORDER BY d.DEPTNO;
-- EMP에서 ENAME, DEPT에서 DNAME을 INNER JOIN으로 조회하되, 부서명이 'SALES'인 사원만 출력하라.
SELECT * FROM EMP e NATURAL JOIN DEPT d WHERE d.DNAME='SALES';


-- 관리자는 job이 Manager인 사람입니다.
-- 사원이 속한 부서의 관리자를 SELF JOIN을 사용해 출력하세요.
-- 매니저가 아닌 사원만 표시하고 매니저는 "관리자"로 표시하세요.
select * FROM EMP WHERE JOB='MANAGER';
SELECT e.ENAME, e.DEPTNO, m.ENAME,m.JOB
FROM EMP e INNER JOIN EMP m
    ON e.DEPTNO=m.DEPTNO
    WHERE m.JOB='MANAGER' AND e.EMPNO!=m.EMPNO
ORDER BY e.EMPNO;
