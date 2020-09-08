SELECT * FROM DICT;

SELECT * FROM DICTIONARY;

SELECT TABLE_NAME
FROM USER_TABLES;

--SCOTT ������ ������ �ִ� ��ü ���� ���캸��(USER_���ξ� ���)
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

--SCOTT �������� DBA_���ξ� ����ϱ�
SELECT * FROM DBA_TABELS;

--SCOTT ������ ����� �� �ִ� ��ü ���캸��
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

--SCOTT �������� DBA_���ξ� ����ϱ�

SELECT * FROM DBA_TABLES;

--SYSTEM �������� DBA_ ���ξ� ����ϱ� (SYSTEM �������� �������� ��(����)
SELECT * FROM DBA_TABLES;

--SCOTT ������ ������ �ε��� ���� �˾ƺ���(SCOTT �����϶�)
SELECT *
FROM USER_INDEXES;

--SCOTT ������ ������ �ε��� �÷� ���� �˾ƺ���(SCOTT �����϶�)
SELECT * 
FROM USER_IND_COLUMNS;

--EMP ���̺��� SAL ���� �ε����� �����ϱ�
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);

--���� �ε��� Ȯ��
SELECT * FROM USER_IND_COLUMNS;

--�ε��� ����
DROP INDEX IDX_EMP_SAL;

--������ �ε��� ���캸��

SELECT * FROM USER_IND_COLUMNS;

CREATE VIEW VW_EMP20
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP
    WHERE DEPTNO =20);
    
    SELECT * FROM USER_VIEWS;
 -- ������ �� ��ȸ�ϱ�
 SELECT *
 FROM VW_EMP20;
 
 -- �� ����
 
DROP VIEW VW_EMP20;

-- �� ���� ���� �䰡 �������� �ʽ��ϴ�.

SELECT *
FROM VW_EMP20;

SELECT ROWNUM, E.*
FROM EMP E;

--EMP ���̺��� SAL �� �������� �����ϱ�

SELECT ROWNUM, E.*
FROM EMP E
ORDER BY SAL DESC;
-- �ζ��� ��
SELECT ROWNUM, E.*
FROM (SELECT * 
        FROM EMP E
        ORDER BY SAL DESC) E;
        
--�ζ��� ��(WITH�� ���)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E;

--�ζ��� ��� TOP-N �����ϱ�(�������� ���)
SELECT ROWNUM, E.*
FROM (SELECT *
        FROM EMP E
        ORDER BY SAL DESC) E
        WHERE ROWNUM <=3;
        
--�ζ��� ��� TOP_N �����ϱ�(WITH�� ���)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <=3;
--PAGE 349