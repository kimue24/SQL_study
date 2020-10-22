--EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기

SELECT * FROM EMP
ORDER BY SAL;

-- 사용하기 EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기

SELECT * FROM EMP
ORDER BY SAL DESC;

--EMP 테이블의 전체 열을 부서 번호와 급여로 정렬하기

SELECT * FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

