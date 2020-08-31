
--대 소문자를 바꿔주는 UPPER,LOWER,INITCAP 함수
SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
FROM EMP;

-- UPPER 함수로 문자열 비교하기(사원 이름이 SCOTT인 데이터 찾기
SELECT *
FROM EMP
WHERE UPPER(ENAME) = 'SCOTT';

--UPPER 함수로 문자열 비교하기 (사원 이름에 SCOTT가 포함된 데이터 찾기)
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE '%SCOTT%';

--선택한 열의 문자열 길이 구하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--사원 이름의 길이가 5 이상인 행 출력하기
SELECT ENAME,LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

--LENGTH 함수와 LENGTHB('한글')
SELECT LENGTH('한글'),LENGTHB('한글')
FROM DUAL;

--SUBSTR함수
SELECT JOB,SUBSTR(JOB,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5)
FROM EMP;

--예제
SELECT SUBSTR(ENAME,3)
FROM EMP;

--SUBSTR 함수 안에 다른 함수 함께 사용하기

SELECT JOB,
        SUBSTR(JOB, -LENGTH(JOB)),
        SUBSTR(JOB, -LENGTH(JOB),2),
        SUBSTR(JOB, -3)
        FROM EMP;
        
 -- INSTR 함수로 문자열 데이터에서 특정 문자열 찾기
 SELECT INSTR('HELLO,ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO,ORACEL!', 'L',5) AS INSTR_2,
        INSTR('HELLO,ORACLE!', 'L',2,2) AS INSTR_3
        FROM DUAL;
        
-- INSTR 함수로 사원 이름에 문자 S가 있는 행 구하기
SELECT *
FROM EMP
WHERE INSTR(ENAME,'S') >0;

--LIKE 연산자로 사원 이름에 문자 S 가 있는 행 구하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

--REPLACE 함수
SELECT '010-9999-9999' AS REPLACE_BEFORE,
        REPLACE('010-9999-9999','-',' ') AS REPLACE_1,
        REPLACE('010-9999-9999','-') AS REPLACE_2
        FROM DUAL;

--데이터의 빈 공간을 특정 문자로 채우는 LPAD,RPAD 함수

SELECT 'ORACLE',
    LPAD('ORACLE',10,'#') AS LPAD_1,
    RPAD('ORACLE',10,'*') AS RPAD_1,
    LPAD('ORACLE',10) AS LPAD_2,
    RPAD('ORACLE',10) AS RPAD_2
    FROM DUAL;
    
--PRAD 함수를 사용하여 개인정보 뒷자리를 *로만들기

SELECT 
       RPAD('910413-',14,'*') AS PRAD_JMNO,
       RPAD('010-4311-',13,'*') AS PRAD_PHONE
       FROM DUAL;
       
       
--두 열사이에 콜론(:)을 넣고 연결하기

SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO,CONCAT(' : ', ENAME))
       FROM EMP
       WHERE ENAME = 'SCOTT';
       
 --TRIM 함수로 공백 제거하여 출력하기
 
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
       
       
--ROUND 함수를 사용하여 반올림된 숫자 출력하기

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
    
-- CEIL,FLOOR 함수로 숫자 출력하기
    SELECT CEIL(3.14),
        FLOOR(3.14),
        CEIL(-3.14),
        FLOOR(-3.14)
        FROM DUAL;

--MOD 함수를 사용하여 나머지 값 출력하기

SELECT MOD(15,6),
       MOD(10,2),
       MOD(11,2)
FROM DUAL;

--SYSDATE 함수를 사용하여 날짜 출력하기

SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
       FROM DUAL;
    
--몇 개월 이후 날짜를 구하는 ADD_MONTHS 함수

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE,3)
    FROM DUAL;
    
-- 입사 10주년이 되는 사원들 데이터를 출력하기
SELECT EMPNO, ENAME, HIREDATE,
        ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
        FROM EMP;
--입사 32년 미만인 사원 데이터 출력하기
SELECT EMPNO,
       ENAME,HIREDATE,SYSDATE
       FROM EMP
       WHERE ADD_MONTHS(HIREDATE,500) > SYSDATE;
       
--HIREDATE와 SYSDATE사이의 개월 수를 MONTHS_BETWEEN 함수로 출력하기

SELECT EMPNO, ENAME,HIREDATE,SYSDATE,
        MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1,
        MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
        TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
        FROM EMP;
        
SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '월요일'),
        LAST_DAY(SYSDATE)
        FROM DUAL;
        
SELECT EMPNO,ENAME,EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';


-- 형변환 오류
SELECT 'ABCD' + EMPNO,EMPNO
FROM EMP
WHERE ENAME = 'SCOTT';

--SYSDATE 날짜 형식 지정하여 출력하기
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT SYSDATE,
        TO_CHAR(SYSDATE,'MM') AS MM,
        TO_CHAR(SYSDATE,'MON') AS MON,
        TO_CHAR(SYSDATE,'MONTH') AS MONTH,
        TO_CHAR(SYSDATE,'DD') AS DD,
        TO_CHAR(SYSDATE,'DY') AS DY,
        TO_CHAR(SYSDATE,'DAY') AS DAY
        FROM DUAL;
        
--여러 언어로 날짜(월) 출력하기

SELECT SYSDATE,
            TO_CHAR(SYSDATE,'MM') AS MM,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MON_JPN,
            TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MONTH_JPN,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
            FROM DUAL;
            
--SYSDATE 시간 형식 지정하여 출력하기
    SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
    TO_CHAR(SYSDATE, 'HH12:MI:SS') AS HHMISS_AM,
    TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
    FROM DUAL;
    
--여러가지 숫자 형식을 사용하여 급여 출력하기

SELECT SAL,
        TO_CHAR(SAL, '$999,9999') AS SAL_$,
        TO_CHAR(SAL, 'L999,9999') AS SAL_L,
        TO_CHAR(SAL, '999,999.00') AS SAL_1,
        TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '00999999.99') AS SAL_3,
        TO_CHAR(SAL, '$999,999,00') AS SAL_4
        FROM EMP;
        
--문자 데이터와 숫자 데이터를 연산하여 출력하기

SELECT 1300 - '1500',
        '1300' + 1500
        FROM DUAL;

--문자 데이터끼리 연산하여 출력하기(에러)
 SELECT '1,300' - '1,500'
 FROM DUAL;        
 
 SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
 FROM DUAL;
 
 --TO DATE 함수로 문자 데이터를 날짜 데이터로 변환하기
 
 SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
        TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
        FROM DUAL;
        

SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

--NVL 함수를 사용하여 출력하기

SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,
        NVL(COMM,0),
        SAL + NVL(COMM,0)
        FROM EMP;
        
        
SELECT EMPNO, ENAME, COMM,
        NVL2(COMM,'0','X'),
        NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
        FROM EMP;
        
        
--DECODE 함수를 사용하여 출력하기

SELECT EMPNO, ENAME,JOB,SAL,
    DECODE(JOB,
    'MANAGER', SAL*1.1,
    'SALESMAN', SAL*1.05,
    'ANALYST', SAL,
    SAL*1.03) AS UPSAL
    FROM EMP;
    
    
--CASE문을 사용하여 출력하기

SELECT EMPNO,ENAME,JOB,SAL,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANNLYST' THEN SAL
ELSE SAL*1.03
END AS UPSAL
FROM EMP;    

-- 열 값에 따라서 출력 값이 달라지는 CASE문
SELECT EMPNO,ENAME,COMM,
CASE WHEN COMM IS NULL THEN '해당사항없음'
WHEN COMM = 0 THEN '수당없음'
WHEN COMM > 0 THEN '수당 : ' || COMM
END AS COMM_TEXT
FROM EMP;