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

--