--열에 연산식을 사용하여 출력하기
SELECT ENAME, SAL, SAL*12+COMM, COMM
FROM EMP;

--곱하기를 사용하지 않고 사원의 연간 총 수입 출력하기
SELECT ENAME, SAL*12+COMM, COMM
FROM EMP;

--별칭을 사용하여 사원의 연간 총 수입 출력하기
SELECT ENAME AS 이름, SAL AS 급여, SAL*12+COMM AS 추가금,COMM AS 별칭
FROM EMP;