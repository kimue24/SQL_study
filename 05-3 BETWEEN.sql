-- ��� �� �����ڿ� AND �����ڸ� ����Ͽ� ����ϱ�

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <=3000;

--BETWEEN A AND B �����ڸ� ����Ͽ� ����ϱ�
SELECT * 
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--BETWEEN A AND B �����ڸ� NOT �����ڸ� ����Ͽ� ����ϱ�
SELECT * 
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

--LIKE ������ ����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- ��� �̸��� �� ��° ���ڰ� L�� ����� ����ϱ�
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ����ϱ�
SELECT *
FROM EMP 
WHERE ENAME LIKE '%AM%';

--���ϵ� ī�� ���ڰ� ������ �Ϻ��� ���

SELECT *
FROM SOME_TABLE
WHERE SOME_COLUMN LIKE 'A|_A%' ESCAPE '|';

