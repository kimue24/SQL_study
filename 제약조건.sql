--제약조건

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
    );
    
    DESC TABLE_NOTNULL;
    
-- 제약 조건이 NOT NULL인 열에 NULL 값 넣어보기

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD,TEL)
VALUES ('TEST_ID_01', NULL,'010-1234-5678');
-- 제약조건이 NOT NULL인 열에 NULL을 인설트하면 값이 들어가지지 않습니다.

--제약조건이 없는 TEL 열에 NULL 값 넣어보기

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID_01', '1234');

SELECT * FROM TABLE_NOTNULL;

--정상적으로 NULL 값이 TEL에는 들어갑니다. TEL 에는 NOT NULL이 아니기 때문입니다.

UPDATE TABLE_NOTNULL
SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01';

--널값으로 업데이트가 되지않습니다. 왜냐하면 NOT NULL 이기 때문입니다..

--제약조건 살펴보기

SELECT OWNER, CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--테이블을 생성할 때 제약조건에 이름 지정하기

CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_MN NOT NULL,
        LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_MN NOT NULL,
        TEL VARCHAR2(20)
        );
        
        SELECT OWNER, CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME
        FROM USER_CONSTRAINTS;
        
--TEL 열에 NOT NULL 추가하기

ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

--TEL 열 데이터 수정하기
UPDATE TABLE_NOTNULL
SET TEL = '010-1234-5678'
WHERE LOGIN_ID = 'TEST_ID_01';

--확인
UPDATE TABLE_NOTNULL
SET TEL = '010-1234-5678';

--NOT NULL 제약 조건 추가하기
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

--제약조건 확인하기

SELECT OWNER,CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

-- 제약조건에 이름 지정해서 추가하기
ALTER TABLE TABLE_NOTNULL2
MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

SELECT OWNER,CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--테이블 확인
DESC TABLE_NOTNULL2;

--이미 생성된 제약 조건 이름 변경하기
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;
--조회
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--제약조건 삭제하기
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

--중복되지 않는 값 UNIQUE

--제약 조건 지정하기(테이블 생성할 때)

-- 테이블_유니크 라는 테이블에 로그인 아이디는 유니크, 패스워드는 NOT NULL, 전화번호는 아무것도 없는 테이블을 만들었습니다.
CREATE TABLE TABLE_UNIQUE(
LOGIN_ID VARCHAR2(20) UNIQUE,
LOGIN_PWD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);


--제약조건 확인

-- USER_CONSTRAINTS 데이터 사전 뷰로 제약 조건 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE';


--TABLE_UNIQUE 테이블에 데이터 입력하기
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD, TEL)
VALUES('TEST_ID_01','PWD01','010-1234-1234');

SELECT * FROM TABLE_UNIQUE;