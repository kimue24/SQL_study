--���̺� ���� ���캸��
DESC EMP;

DESC DEPT;

DESC SALGRADE;

-- *�� ���̺� ��ü ����ϱ�
SELECT * FROM EMP;

--���� ��ǥ �����Ͽ� ����ϱ�
SELECT EMPNO,ENAME,DEPTNO
FROM EMP;

--DISTINCT�� ���� �ߺ� �����ϱ�
SELECT DISTINCT DEPTNO
FROM EMP;

--���� �� ���� ����Ͽ� �ߺ� �����ϱ�
SELECT DISTINCT JOB,DEPTNO
FROM EMP;

--��å �μ� ����ϱ� ALL ���
SELECT ALL JOB,DEPTNO
FROM EMP;

--���� ������� ����Ͽ� ����ϱ�
SELECT ENAME,SAL, SAL*12+COMM,COMM
FROM EMP;

--��Ī���
SELECT ENAME,SAL,SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

--EMP ���̺��� ��� ���� �޿� �������� �������� �����ϱ�
SELECT *
FROM EMP
ORDER BY SAL;

--�������� ����

SELECT *
FROM EMP
ORDER BY SAL;

--�������� ����ϱ�

SELECT *
FROM EMP
ORDER BY SAL DESC;

SELECT *
FROM EMP
ORDER BY EMPNO DESC;

--EMP ���̺��� ��ü���� �μ� ��ȣ
SELECT *
FROM EMP
ORDER BY DEPTNO ASC,SAL DESC;

