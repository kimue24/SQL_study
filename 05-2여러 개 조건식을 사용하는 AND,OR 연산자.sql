-- AND �����ڷ� ���� ���� ���ǽ� ����ϱ�

SELECT * FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- OR �����ڷ� ���� ���� ��� ���� ����ϱ�

SELECT * 
FROM EMP
WHERE DEPTNO = 30
OR JOB ='CLERK';