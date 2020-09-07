--���̺� ������ �߰��ϱ�

-- DEPT ���̺� �����ؼ� DEPT_TEMP���̺����
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

--FRPT_TEMP ���̺� ��ü �� ��ȸ�ϱ�
SELECT * FROM DEPT_TEMP;

--DEPT_TEMP ���̺� ������ �߰��ϱ�

INSERT INTO DEPT_TEMP (DEPTNO, DNAME,LOC)
                VALUES (50, 'DATABASE','SEOUL');

--DEPT_TEMP �߰��� ������ Ȯ���ϱ�

SELECT * FROM DEPT_TEMP;

--INSERT���� �� ���� ���� ������ �߰��ϱ�
INSERT INTO DEPT_TEMP
        VALUES(60,'NETWORK','BUSAN');
        
--���
SELECT * FROM DEPT_TEMP;

--���̺� NULL ������ �Է��ϱ�

INSERT INTO DEPT_TEMP (DEPTNO, DNAME,LOC)
            VALUES ( 70,'WEB',NULL);

SELECT * FROM DEPT_TEMP;
        
--�� ���� ���ڿ��� NULL�� �Է��ϱ�

INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC)
            VALUES( 80,'MOBILE','');

SELECT * FROM DEPT_TEMP;

--�� �����͸� ���� �ʴ� ������� NULL' ������ �Է��ϱ�

INSERT INTO DEPT_TEMP(DEPTNO, LOC)
            VALUES (90, 'INCHEON');
            
SELECT * FROM DEPT_TEMP;

-- ���̺��� ��¥ ������ �Է��ϱ� , DROP ���̺� �� ��õ�

DROP TABLE EMP_TEMP;

CREATE TABLE EMP_TEMP
AS SELECT * 
FROM EMP
WHERE 1<> 1;

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO, ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
                VALUES(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',
                    5000,1000,10);

SELECT * FROM EMP_TEMP;

--��¥ ������ �ٸ� ������� INSERT�ϱ�

INSERT INTO EMP_TEMP (EMPNO, ENAME,JOB,MGR,HIREDATE,SAL,COMM, DEPTNO)
       VALUES  ( 1111,'������','MANAGER',9999,'2001-01-05',40000,NULL,20);

SELECT * FROM EMP_TEMP;

--��¥ ������ ������ �ݴ�� ������ ( ����!)

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES (2111,'�̼���','MANAGER',9999,'07/01/2001', 4000, NULL,20);


INSERT INTO EMP_TEMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
                VALUES (2111, '�̼���','MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'),
                4000,NULL,20);

SELECT * FROM EMP_TEMP;

--SYSDATE�� ����Ͽ� ��¥ ������ �Է��ϱ�

INSERT INTO EMP_TEMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
                VALUES (3111, '��û��','MANAGER',9999,SYSDATE,4000,NULL,30);
 
SELECT * FROM EMP_TEMP;               



--���������� ���� ������ �߰��ϱ�

INSERT INTO EMP_TEMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE = 1;

SELECT * FROM EMP_TEMP;


--���̺� �ִ� ������ �����ϱ�

CREATE TABLE DEPT_TEMP2
 AS SELECT * FROM DEPT;

UPDATE DEPT_TEMP2
SET DNAME = 'DATABASE',
LOC = 'SEOUL'
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
    SET (DNAME,LOC) = (SELECT DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

--��ȸ
SELECT * FROM DEPT_TEMP2;                       


--���������� ������ �Ϻκ� �����ϱ�

UPDATE DEPT_TEMP2
SET DNAME = (SELECT DNAME
            FROM DEPT
            WHERE DEPTNO =40),
            
     LOC = (SELECT LOC
            FROM DEPT
            WHERE DEPTNO = 40)
            WHERE DEPTNO =40;

SELECT * FROM DEPT_TEMP2;

--UPDATE���� WHERE���� �������� ����ϱ�

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPT_TEMP
                WHERE DNAME = 'OPERATIONS');

SELECT * FROM DEPT_TEMP2;

--������ �����ϱ�

CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
WHERE JOB ='MANAGER';

SELECT * FROM EMP_TEMP2;

--WHERE���� ���������� ����Ͽ� ������ �Ϻθ� �����ϱ�

DELETE FROM EMP_TEMP2
    WHERE EMPNO IN (SELECT E.EMPNO
                    FROM EMP_TEMP2 E, SALGRADE S
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE =3
                    AND DEPTNO = 30);

SELECT * FROM EMP_TEMP2;

--������ ��ü �����ϱ�

DELETE FROM EMP_TEMP2;

SELECT * FROM EMP_TEMP2;





































































































































































