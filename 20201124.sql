-- 11�� 24�� ������ SQL
SELECT * 
FROM EMP
WHERE JOB != 'MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

SELECT * 
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

