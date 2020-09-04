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
