  SELECT E.EMPNO,
         E.ENAME,
         E.JOB,
         E.MGR,
         E.HIREDATE,
         E.SAL,
         E.COMM,
         DEPTNO,
         D.DNAME,
         D.LOC
    FROM EMP E NATURAL JOIN DEPT D
    ORDER BY DEPTNO, E.EMPNO;
 
  SELECT E.EMPNO,
         E.ENAME,
         E.JOB,
         E.MGR,
         E.HIREDATE,
         E.SAL,
         E.COMM,
         DEPTNO,
         D.DNAME,
         D.LOC
    FROM EMP E JOIN DEPT D USING (DEPTNO)
    WHERE SAL >= 3000
    ORDER BY DEPTNO, E.EMPNO;
    
    SELECT E.EMPNO, E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,
    E.DEPTNO,
    D.DNAME,D.LOC 
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE SAL <= 3000
    ORDER BY E.DEPTNO,EMPNO;
   
  SELECT E1.EMPNO,
         E1.ENAME,
         E1.MGR,
         E2.EMPNO     AS MGR_EMPNO,
         E2.ENAME     AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
        FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
        ORDER BY E1.EMPNO, MGR_EMPNO;
       
SELECT E1.EMPNO,E1,ENAME,E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
       FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
       ORDER BY E1.EMPNO;
       
       SELECT SAL
       FROM EMP 
       WHERE ENAME ='JONES';
       
       SELECT *
       FROM EMP 
       WHERE SAL > 2975;
       

SELECT ENAME, SAL
  FROM EMP
 WHERE SAL > (SELECT SAL
                FROM EMP
               WHERE ENAME = 'JONES');
               
               
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP
            WHERE ENAME = 'JONES');
            
            SELECT *
            FROM EMP 
            WHERE HIREDATE < (SELECT HIREDATE
                              FROM EMP
                              WHERE ENAME = 'SCOTT');
                              

SELECT E.EMPNO,
       E.ENAME,
       E.JOB,
       E.SAL,
       D.DEPTNO,
       D.DNAME,
       D.LOC
  FROM EMP E, DEPT D
 WHERE     E.DEPTNO = D.DEPTNO
       AND E.DEPTNO = 20
       AND E.SAL > (SELECT AVG (SAL) FROM EMP);
       
SELECT E.EMPNO,
       E.ENAME,
       E.JOB,
       E.SAL,
       D.DEPTNO,
       D.DNAME,
       D.LOC
  FROM EMP E, DEPT D
 WHERE     E.DEPTNO = D.DEPTNO
       AND E.DEPTNO = 20
       AND E.SAL > (SELECT AVG (SAL) FROM EMP);

SELECT * 
FROM EMP
WHERE DEPTNO IN (20,30);


SELECT *
  FROM EMP
 WHERE SAL IN (  SELECT MAX (SAL)
                   FROM EMP
               GROUP BY DEPTNO);
               
 
 SELECT *
  FROM EMP
 WHERE SAL = ANY (  SELECT MAX (SAL)
                      FROM EMP
                  GROUP BY DEPTNO);
                  

SELECT *
  FROM EMP
 WHERE SAL = SOME (  SELECT MAX (SAL)
                       FROM EMP
                   GROUP BY DEPTNO);
                   


  SELECT *
    FROM EMP
   WHERE SAL < ANY (SELECT SAL
                      FROM EMP
                     WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;


SELECT SAL
  FROM EMP
 WHERE DEPTNO = 30;
 
 
SELECT *
  FROM EMP
 WHERE SAL > ANY (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
                   

SELECT *
  FROM EMP
 WHERE SAL < ALL (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
 

SELECT *
  FROM EMP
 WHERE SAL > ALL (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
                   

SELECT *
FROM EMP 
WHERE SAL > ALL(SELECT SAL 
                FROM EMP
                WHERE DEPTNO = 30);
                
/* Formatted on 2020/11/25 오전 11:44:29 (QP5 v5.360) */
SELECT *
  FROM EMP
 WHERE EXISTS
           (SELECT DNAME
              FROM DEPT
             WHERE DEPTNO = 10);
 

SELECT *
  FROM EMP
 WHERE EXISTS
           (SELECT DNAME
              FROM DEPT
             WHERE DEPTNO = 50);
             
SELECT *
FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
FROM EMP GROUP BY DEPTNO);

SELECT E10.EMPNO,E10.ENAME,E10.DEPTNO,D.DNAME,D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10)E10,
    (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;
    
    
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

/* Formatted on 2020/11/25 오후 1:38:28 (QP5 v5.360) */
SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       (SELECT GRADE
          FROM SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL)    AS SALGRADE,
       DEPTNO,
       (SELECT DNAME
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO)           AS DNAME
  FROM EMP E;
  
SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       (SELECT GRADE
          FROM SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL)    AS SALGRADE,
       DEPTNO,
       (SELECT DNAME
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO)           AS DNAME
  FROM EMP E;
  
  
  CREATE TABLE DEPT_TEMP
  AS SELECT * FROM DEPT;
  
  INSERT INTO DEPT_TEMP (DEPTNO,DNAME,LOC)
                VALUES ( 50,'DATABASE','SEOUL');
                
                SELECT * FROM DEPT_TEMP;
                
                
-- insert문에 열 지정 없이 데이터 추가하기
 INSERT INTO DEPT_TEMP
 VALUES (60,'NETWORK','BUSAN');
 
/* Formatted on 2020/11/25 오후 3:55:42 (QP5 v5.360) */
SELECT *
  FROM DEPT_TEMP
 WHERE DEPTNO = '60';


INSERT INTO DEPT_TEMP (DEPTNO,DNAME,LOC)
VALUES(70,'WEB',NULL);

SELECT * FROM DEPT_TEMP
WHERE DEPTNO = '70';


INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC)
VALUES(80,'MOBILE','');

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO,LOC)
VALUES(90,'INSERT');

SELECT * FROM DEPT_TEMP;

/* Formatted on 2020/11/25 오후 4:00:39 (QP5 v5.360) */
CREATE TABLE EMP_TEMP
AS
    SELECT *
      FROM EMP
     WHERE 1 <> 1;

INSERT INTO EMP_TEMP (EMPNO, ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999,'홍길동','PRESIDENT',NULL,'2001/01/01',
5000,1000,10);
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(1111,'성춘향','MANAGER',9999,'2001-01-05',4000,NULL,20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(1111,'성춘향','MANAGER',9999,'2001-01-05',4000,NULL,20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(2111,'이순신','MANAGER',9999,NULL,4000,NULL,20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (2111,'이순신','MANAGER',9999,TO_DATE('07/01/2001', 'DD/MM/YYYY'),
4000,NULL,20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (3111,'심청이','MANAGER',9999,SYSDATE,4000,NULL,30);
SELECT * FROM EMP_TEMP;