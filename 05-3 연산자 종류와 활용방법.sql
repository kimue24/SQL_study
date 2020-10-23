--곱셈 산술 연산자를 사용한 예

SELECT * 
FROM EMP
WHERE SAL * 12 = 36000;

--대소 비교 연산자를 사용하여 출력하기

SELECT * 
FROM EMP
WHERE SAL >= 3000;

--문자열을 대소 비교 연산자로 비교하기(비고 문자열이 문자 여러 개일때)

SELECT *
FROM EMP
WHERE ENAME<= 'FORZ';

--등가 비교 연산자(!=)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL !=3000;

--등가 비교 연산자(<>)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL <> 3000;

--등가 비교 연산자(^=)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL ^= 3000;
--논리 부정 연산자


-- NOT 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

--IN연산자
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'SLERK';
    
--연산자를 사용하여 출력하기

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN','CLERK');

-- 등가 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB != 'MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

-- IN 연산자와 논리 부정 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');