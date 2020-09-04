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
