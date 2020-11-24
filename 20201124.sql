-- 11월 24일 오늘의 SQL
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

SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

SELECT ENAME SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

SELECT *
FROM EMP
WHERE COMM = NULL;

SELECT *
FROM EMP
WHERE COMM IS NULL;

SELECT *
FROM EMP
WHERE SAL > NULL
AND COMM IS NULL;

SELECT *
FROM EMP
WHERE SAL > NULL
OR COMM IS NULL;

SELECT EMPNO, ENAME,SAL DEPTNO
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO IN (10,20);

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON,
TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY,
TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE,'HH24:MI:SS') AS HH24MISS,
TO_CHAR(SYSDATE,'HH12:MI:SS') AS HHMISS_AM,
TO_CHAR(SYSDATE,'HH:MI:SS P.M') AS HHMISS_PM
FROM DUAL;

SELECT 1300 - '1500',
       '1500' + 1500
       FROM DUAL;
       

SELECT EMPNO,
       ENAME,
       SAL,
       COMM,
       SAL + COMM,
       NVL (COMM, 0),
       SAL + NVL (COMM, 0)
  FROM EMP;
  
  SELECT EMPNO,
       ENAME,
       COMM,
       NVL2 (COMM, '0', 'X'),
       NVL2 (COMM, SAL * 12 + COMM, SAL * 12)     AS ANNSAL
  FROM EMP;
  

SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       DECODE (JOB,
               'MANAGER', SAL * 1.1,
               'SALESMAN', SAL * 1.05,
               'ANALYST', SAL,
               SAL * 1.03)    AS UPSAL
  FROM EMP;
  
  
SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       DECODE (JOB,
               'MANAGER', SAL * 1.1,
               'SALESMAN', SAL * 1.05,
               'ANALYST', SAL,
               SAL * 1.03)    AS UPSAL
  FROM EMP;
  
  
  SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       CASE JOB
           WHEN 'MANAGER' THEN SAL * 1.1
           WHEN 'SALESMAN' THEN SAL * 1.05
           WHEN 'ANALYST' THEN SAL
           ELSE SAL * 1.03
       END    AS UPSAL
  FROM EMP;
  
  
SELECT EMPNO,
       ENAME,
       COMM,
       CASE
           WHEN COMM IS NULL THEN '해당사항 없음'
           WHEN COMM = 0 THEN '수당없음'
           WHEN COMM > 0 THEN '수당 : ' || COMM
       END    AS COMM_TEXT
  FROM EMP;