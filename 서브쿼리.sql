--서브쿼리

-- 사원 이름이 JONES인 사원의 급여 출력하기

SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

--급여가 2975보다 높은 사원 정보 출력하기

SELECT * 
FROM EMP
WHERE SAL > 2975;

--서브쿼리로 JONES의 급여보다 높은 급여를 받는 사원 정보 출력하기

SELECT *
FROM EMP
WHERE SAL > (SELECT SAL 
            FROM EMP
            WHERE ENAME = 'JONES');
            
--단일행 서브쿼리
-- 단일행 서브쿼리와 날짜형 데이터

SELECT *
FROM EMP
WHERE HIREDATE <(SELECT HIREDATE
                from EMP
                WHERE ENAME = 'SCOTT');
                
--단일행 서브쿼리와 함수
SELECT E.EMPNO, E.ENAME,E.SAL, E.JOB, D.DEPTNO,D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 20
        AND E.SAL > (SELECT AVG(SAL)
                      FROM EMP);

--IN 연산자 사용하기

SELECT * 
FROM EMP
WHERE DEPTNO IN (20,30);

-- 각 부서별로 최고 급여와 동일한 급여를 받는 사원 정보 출력하기

SELECT * 
FROM EMP
WHERE SAL IN (SELECT  MAX(SAL) 
            FROM EMP
            GROUP BY DEPTNO);
            
--ANY 연산자 사용하기

SELECT * 
FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
--SOME 연산자 사용하기
SELECT * FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
-- 30번 부서 사원들의 최대 급여보다 적은 급여 받는 사원 정보 출력하기

SELECT *
FROM EMP
WHERE SAL < ANY(SELECT SAL 
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--부서 번호가 30인 사원들의 급여 출력하기
SELECT SAL
FROM EMP
WHERE DEPTNO = 30;

--30번 부서 사원들의 최소 급여보다 더 많은 급여를 받는 사원 정보 출력하기
SELECT * 
FROM EMP
WHERE SAL > ANY (SELECT SAL 
                 FROM EMP 
                 WHERE DEPTNO = 30);
                 
 --부서번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력하기
 SELECT *
 FROM EMP
 WHERE SAL < ALL (SELECT SAL 
                  FROM EMP
                  WHERE DEPTNO =30);


--부서번호가 30번인 사원들의 최대 급여보다 더 많이 급여를 받는 사원 출력하기

SELECT *
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);
                
-- 서브쿼리 결과 값이 존재하는 경우
SELECT * 
FROM EMP
WHERE EXISTS (SELECT DNAME 
                FROM DEPT
                WHERE DEPTNO = 10);
-- 서브쿼리 결과 값이 존재하지 않는 경우
SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 50);
                
-- 비교할 열이 여러 개인 다중열 서브쿼리
SELECT *
FROM EMP
WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);


--FROM절에 사용하는 서브쿼리와 WITH절
--인라인 뷰
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
        FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

--WITH절 사용하기
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO,D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- 상호 연관 서브쿼리
SELECT *
FROM EMP E1
WHERE SAL > (SELECT MIN(SAL)
            FROM EMP E2
            WHERE E2.DEPTNO = E1.DEPTNO)
ORDER BY DEPTNO,ENAME,JOB,SAL;

-- SELECT절에 서브쿼리 사용하기
SELECT EMPNO,ENAME,JOB,SAL,
            (SELECT GRADE
            FROM SALGRADE
            WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
            DEPTNO,
            (SELECT DNAME
            FROM DEPT
            WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

