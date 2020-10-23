-- 대소 비교 연산자와 AND 연산자를 사용하여 출력하기

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <=3000;

--BETWEEN A AND B 연산자를 사용하여 출력하기
SELECT * 
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--BETWEEN A AND B 연산자를 NOT 연산자를 사용하여 출력하기
SELECT * 
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

--LIKE 연산자 사용하여 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기
SELECT *
FROM EMP 
WHERE ENAME LIKE '%AM%';

--와일드 카드 문자가 데이터 일부일 경우

SELECT *
FROM SOME_TABLE
WHERE SOME_COLUMN LIKE 'A|_A%' ESCAPE '|';

