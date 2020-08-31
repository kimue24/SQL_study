
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
       
       
--�� �����̿� �ݷ�(:)�� �ְ� �����ϱ�

SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO,CONCAT(' : ', ENAME))
       FROM EMP
       WHERE ENAME = 'SCOTT';
       
 --TRIM �Լ��� ���� �����Ͽ� ����ϱ�
 
SELECT '['|| TRIM(' _ _Oracle_ _ ') || ']' AS TRIM,
       '['|| TRIM(LEADING FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_LEADING,
       '['|| TRIM(TRAILING FROM '_ _ Oracle_ _ ') || ']' AS TRIM_TRAILING,
       '['|| TRIM(BOTH FROM ' _ _Oracle_ _ ') ||']' AS TRIM_BOTH
       FROM DUAL;
       
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM,
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _')||']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') ||']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
       FROM DUAL;
       
SELECT '[' || TRIM (' _Oracle_ ') || ']' AS TRIM,
       '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
       '[' || RTRIM('<_Oracle_>','>_') || ']' AS RTRIM_2
       FROM DUAL;
       
       
--ROUND �Լ��� ����Ͽ� �ݿø��� ���� ����ϱ�

SELECT ROUND(1234,5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
    FROM DUAL;
    
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_0,
       TRUNC(1234.5678,1) AS TRUNC_1,
       TRUNC(1234.5678,2) AS TRUNC_2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
    FROM DUAL;
    
-- CEIL,FLOOR �Լ��� ���� ����ϱ�
    SELECT CEIL(3.14),
        FLOOR(3.14),
        CEIL(-3.14),
        FLOOR(-3.14)
        FROM DUAL;

--MOD �Լ��� ����Ͽ� ������ �� ����ϱ�

SELECT MOD(15,6),
       MOD(10,2),
       MOD(11,2)
FROM DUAL;

--SYSDATE �Լ��� ����Ͽ� ��¥ ����ϱ�

SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
       FROM DUAL;
    
--�� ���� ���� ��¥�� ���ϴ� ADD_MONTHS �Լ�

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE,3)
    FROM DUAL;
    
-- �Ի� 10�ֳ��� �Ǵ� ����� �����͸� ����ϱ�
SELECT EMPNO, ENAME, HIREDATE,
        ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
        FROM EMP;
--�Ի� 32�� �̸��� ��� ������ ����ϱ�
SELECT EMPNO,
       ENAME,HIREDATE,SYSDATE
       FROM EMP
       WHERE ADD_MONTHS(HIREDATE,500) > SYSDATE;
       
--HIREDATE�� SYSDATE������ ���� ���� MONTHS_BETWEEN �Լ��� ����ϱ�

SELECT EMPNO, ENAME,HIREDATE,SYSDATE,
        MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1,
        MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
        TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
        FROM EMP;
        
SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '������'),
        LAST_DAY(SYSDATE)
        FROM DUAL;
        
SELECT EMPNO,ENAME,EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';


-- ����ȯ ����
SELECT 'ABCD' + EMPNO,EMPNO
FROM EMP
WHERE ENAME = 'SCOTT';

--SYSDATE ��¥ ���� �����Ͽ� ����ϱ�
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM DUAL;

SELECT SYSDATE,
        TO_CHAR(SYSDATE,'MM') AS MM,
        TO_CHAR(SYSDATE,'MON') AS MON,
        TO_CHAR(SYSDATE,'MONTH') AS MONTH,
        TO_CHAR(SYSDATE,'DD') AS DD,
        TO_CHAR(SYSDATE,'DY') AS DY,
        TO_CHAR(SYSDATE,'DAY') AS DAY
        FROM DUAL;
        
--���� ���� ��¥(��) ����ϱ�

SELECT SYSDATE,
            TO_CHAR(SYSDATE,'MM') AS MM,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MON_JPN,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MONTH_JPN,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
            FROM DUAL;
            
--SYSDATE �ð� ���� �����Ͽ� ����ϱ�
    SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
    TO_CHAR(SYSDATE, 'HH12:MI:SS') AS HHMISS_AM,
    TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
    FROM DUAL;
    
--�������� ���� ������ ����Ͽ� �޿� ����ϱ�

SELECT SAL,
        TO_CHAR(SAL, '$999,9999') AS SAL_$,
        TO_CHAR(SAL, 'L999,9999') AS SAL_L,
        TO_CHAR(SAL, '999,999.00') AS SAL_1,
        TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '00999999.99') AS SAL_3,
        TO_CHAR(SAL, '$999,999,00') AS SAL_4
        FROM EMP;
        
--���� �����Ϳ� ���� �����͸� �����Ͽ� ����ϱ�

SELECT 1300 - '1500',
        '1300' + 1500
        FROM DUAL;

--���� �����ͳ��� �����Ͽ� ����ϱ�(����)
 SELECT '1,300' - '1,500'
 FROM DUAL;        
 
 SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
 FROM DUAL;
 
 --TO DATE �Լ��� ���� �����͸� ��¥ �����ͷ� ��ȯ�ϱ�
 
 SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
        TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
        FROM DUAL;
        

SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

--NVL �Լ��� ����Ͽ� ����ϱ�

SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,
        NVL(COMM,0),
        SAL + NVL(COMM,0)
        FROM EMP;
        
        
SELECT EMPNO, ENAME, COMM,
        NVL2(COMM,'0','X'),
        NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
        FROM EMP;
        
        
--DECODE �Լ��� ����Ͽ� ����ϱ�

SELECT EMPNO, ENAME,JOB,SAL,
    DECODE(JOB,
    'MANAGER', SAL*1.1,
    'SALESMAN', SAL*1.05,
    'ANALYST', SAL,
    SAL*1.03) AS UPSAL
    FROM EMP;
    
    
--CASE���� ����Ͽ� ����ϱ�

SELECT EMPNO,ENAME,JOB,SAL,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANNLYST' THEN SAL
ELSE SAL*1.03
END AS UPSAL
FROM EMP;    

-- �� ���� ���� ��� ���� �޶����� CASE��
SELECT EMPNO,ENAME,COMM,
CASE WHEN COMM IS NULL THEN '�ش���׾���'
WHEN COMM = 0 THEN '�������'
WHEN COMM > 0 THEN '���� : ' || COMM
END AS COMM_TEXT
FROM EMP;