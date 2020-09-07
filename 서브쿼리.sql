--��������

-- ��� �̸��� JONES�� ����� �޿� ����ϱ�

SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

--�޿��� 2975���� ���� ��� ���� ����ϱ�

SELECT * 
FROM EMP
WHERE SAL > 2975;

--���������� JONES�� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�

SELECT *
FROM EMP
WHERE SAL > (SELECT SAL 
            FROM EMP
            WHERE ENAME = 'JONES');
            
--������ ��������
-- ������ ���������� ��¥�� ������

SELECT *
FROM EMP
WHERE HIREDATE <(SELECT HIREDATE
                from EMP
                WHERE ENAME = 'SCOTT');
                
--������ ���������� �Լ�
SELECT E.EMPNO, E.ENAME,E.SAL, E.JOB, D.DEPTNO,D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 20
        AND E.SAL > (SELECT AVG(SAL)
                      FROM EMP);

--IN ������ ����ϱ�

SELECT * 
FROM EMP
WHERE DEPTNO IN (20,30);

-- �� �μ����� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ����ϱ�

SELECT * 
FROM EMP
WHERE SAL IN (SELECT  MAX(SAL) 
            FROM EMP
            GROUP BY DEPTNO);
            
--ANY ������ ����ϱ�

SELECT * 
FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
--SOME ������ ����ϱ�
SELECT * FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
-- 30�� �μ� ������� �ִ� �޿����� ���� �޿� �޴� ��� ���� ����ϱ�

SELECT *
FROM EMP
WHERE SAL < ANY(SELECT SAL 
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--�μ� ��ȣ�� 30�� ������� �޿� ����ϱ�
SELECT SAL
FROM EMP
WHERE DEPTNO = 30;

--30�� �μ� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���� ����ϱ�
SELECT * 
FROM EMP
WHERE SAL > ANY (SELECT SAL 
                 FROM EMP 
                 WHERE DEPTNO = 30);
                 
 --�μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ����ϱ�
 SELECT *
 FROM EMP
 WHERE SAL < ALL (SELECT SAL 
                  FROM EMP
                  WHERE DEPTNO =30);


--�μ���ȣ�� 30���� ������� �ִ� �޿����� �� ���� �޿��� �޴� ��� ����ϱ�

SELECT *
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);
                
-- �������� ��� ���� �����ϴ� ���
SELECT * 
FROM EMP
WHERE EXISTS (SELECT DNAME 
                FROM DEPT
                WHERE DEPTNO = 10);
-- �������� ��� ���� �������� �ʴ� ���
SELECT * FROM EMP
WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 50);
                
-- ���� ���� ���� ���� ���߿� ��������
SELECT *
FROM EMP
WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);


--FROM���� ����ϴ� ���������� WITH��
--�ζ��� ��
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
        FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

--WITH�� ����ϱ�
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO,D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- ��ȣ ���� ��������
SELECT *
FROM EMP E1
WHERE SAL > (SELECT MIN(SAL)
            FROM EMP E2
            WHERE E2.DEPTNO = E1.DEPTNO)
ORDER BY DEPTNO,ENAME,JOB,SAL;

-- SELECT���� �������� ����ϱ�
SELECT EMPNO,ENAME,JOB,SAL,
            (SELECT GRADE
            FROM SALGRADE
            WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
            DEPTNO,
            (SELECT DNAME
            FROM DEPT
            WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

