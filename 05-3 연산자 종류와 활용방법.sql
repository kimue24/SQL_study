--���� ��� �����ڸ� ����� ��

SELECT * 
FROM EMP
WHERE SAL * 12 = 36000;

--��� �� �����ڸ� ����Ͽ� ����ϱ�

SELECT * 
FROM EMP
WHERE SAL >= 3000;

--���ڿ��� ��� �� �����ڷ� ���ϱ�(��� ���ڿ��� ���� ���� ���϶�)

SELECT *
FROM EMP
WHERE ENAME<= 'FORZ';

--� �� ������(!=)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL !=3000;

--� �� ������(<>)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL <> 3000;

--� �� ������(^=)�� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL ^= 3000;
--�� ���� ������


-- NOT �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

--IN������
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'SLERK';
    
--�����ڸ� ����Ͽ� ����ϱ�

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN','CLERK');

-- � �� �����ڿ� AND �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE JOB != 'MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

-- IN �����ڿ� �� ���� �����ڸ� ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');