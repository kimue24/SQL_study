
--�� �ҹ��ڸ� �ٲ��ִ� UPPER,LOWER,INITCAP �Լ�
SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
FROM EMP;

-- UPPER �Լ��� ���ڿ� ���ϱ�(��� �̸��� SCOTT�� ������ ã��
SELECT *
FROM EMP
WHERE UPPER(ENAME) = 'SCOTT';

--UPPER �Լ��� ���ڿ� ���ϱ� (��� �̸��� SCOTT�� ���Ե� ������ ã��)
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE '%SCOTT%';

--������ ���� ���ڿ� ���� ���ϱ�
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--��� �̸��� ���̰� 5 �̻��� �� ����ϱ�
SELECT ENAME,LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

--LENGTH �Լ��� LENGTHB('�ѱ�')
SELECT LENGTH('�ѱ�'),LENGTHB('�ѱ�')
FROM DUAL;

--SUBSTR�Լ�
SELECT JOB,SUBSTR(JOB,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5)
FROM EMP;

--����
SELECT SUBSTR(ENAME,3)
FROM EMP;

--SUBSTR �Լ� �ȿ� �ٸ� �Լ� �Բ� ����ϱ�

SELECT JOB,
        SUBSTR(JOB, -LENGTH(JOB)),
        SUBSTR(JOB, -LENGTH(JOB),2),
        SUBSTR(JOB, -3)
        FROM EMP;
        
 -- INSTR �Լ��� ���ڿ� �����Ϳ��� Ư�� ���ڿ� ã��
 SELECT INSTR('HELLO,ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO,ORACEL!', 'L',5) AS INSTR_2,
        INSTR('HELLO,ORACLE!', 'L',2,2) AS INSTR_3
        FROM DUAL;
        
-- INSTR �Լ��� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT *
FROM EMP
WHERE INSTR(ENAME,'S') >0;

--LIKE �����ڷ� ��� �̸��� ���� S �� �ִ� �� ���ϱ�
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

--REPLACE �Լ�
SELECT '010-9999-9999' AS REPLACE_BEFORE,
        REPLACE('010-9999-9999','-',' ') AS REPLACE_1,
        REPLACE('010-9999-9999','-') AS REPLACE_2
        FROM DUAL;

--�������� �� ������ Ư�� ���ڷ� ä��� LPAD,RPAD �Լ�

SELECT 'ORACLE',
    LPAD('ORACLE',10,'#') AS LPAD_1,
    RPAD('ORACLE',10,'*') AS RPAD_1,
    LPAD('ORACLE',10) AS LPAD_2,
    RPAD('ORACLE',10) AS RPAD_2
    FROM DUAL;
    
--PRAD �Լ��� ����Ͽ� �������� ���ڸ��� *�θ����

SELECT 
       RPAD('910413-',14,'*') AS PRAD_JMNO,
       RPAD('010-4311-',13,'*') AS PRAD_PHONE
       FROM DUAL;