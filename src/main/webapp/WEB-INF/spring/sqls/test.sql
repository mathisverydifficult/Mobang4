DROP SEQUENCE MYNOSEQ;
DROP TABLE MYBOARD;

CREATE SEQUENCE MYNOSEQ;
CREATE TABLE MYBOARD(
	MYNO NUMBER 				PRIMARY KEY,
	MYNAME VARCHAR2(1000) 		NOT NULL,
	MYTITLE VARCHAR2(2000) 		NOT NULL,
	MYCONTENT VARCHAR2(4000) 	NOT NULL,
	MYDATE DATE 				NOT NULL
);

INSERT INTO MYBOARD VALUES(MYNOSEQ.NEXTVAL,'관리자','스프링 테스트','spring mvc 어렵다',SYSDATE);

SELECT * FROM MYBOARD;


-----------------------------------------------------------------------------------
DROP SEQUENCE MEMBERSEQ;
DROP TABLE MYMEMBER;
CREATE SEQUENCE MEMBERSEQ;
CREATE TABLE MYMEMBER(
	MEMBERNO NUMBER PRIMARY KEY,
	MEMBERID VARCHAR2(1000) NOT NULL,
	MEMBERPW VARCHAR2(1000) NOT NULL,
	MEMBERNAME VARCHAR2(1000) NOT NULL


);

INSERT INTO MYMEMBER
VALUES(MEMBERSEQ.NEXTVAL, 'admin','1234','관리자');

INSERT INTO MYMEMBER
VALUES(MEMBERSEQ.NEXTVAL, 'kh','kh','일반');



SELECT MEMBERNO, MEMBERID, MEMBERPW, MEMBERNAME
FROM MYMEMBER;

SELECT * FROM MYMEMBER;


SELECT * FROM MYMYBOARD;

DROP TABLE TESTBOARD;
DROP SEQUENCE TESTSEQ;

CREATE SEQUENCE TESTSEQ;
CREATE TABLE TESTBOARD(
	MYNO NUMBER 				PRIMARY KEY,
	MYNAME VARCHAR2(1000) 		NOT NULL,
	MYTITLE VARCHAR2(2000) 		NOT NULL,
	MYCONTENT VARCHAR2(4000) 	NOT NULL,
	MYPATH VARCHAR2(200) 		NOT NULL,
	MYPREMIUM VARCHAR2(2)		NOT NULL,
	
	CONSTRAINT TEST_CHK CHECK(MYPREMIUM IN ('Y', 'N'))
);

ALTER TABLE TESTBOARD ADD(MYADDRESS VARCHAR2(500));

INSERT INTO TESTBOARD VALUES(TESTSEQ.NEXTVAL,'김동주','이천은 비싸냐','이천은 싸다','resources/user/img/test/sokcho.JPG','N','이천시');
INSERT INTO TESTBOARD VALUES(TESTSEQ.NEXTVAL,'김송주','강남은 비싸냐','강남은 제일 싸다','resources/user/img/test/sokcho.JPG','N','강남1');
INSERT INTO TESTBOARD VALUES(TESTSEQ.NEXTVAL,'김소주','의정부?','의정부는 비쌈','resources/user/img/test/sokcho.JPG','N','강남2');
DELETE FROM TESTBOARD;
SELECT * FROM TESTBOARD;

select * from testboard 
  		where myaddress like '%강남%';




-----------------------------------------------------------------------------------

DROP TABLE USER_TB;
CREATE TABLE USER_TB
(
    SEQ            INT         NOT NULL, 
    EMAIL          VARCHAR2(100)    NOT NULL, 
    NAME           VARCHAR2(10)    NOT NULL, 
    PWD            VARCHAR2(20)    NOT NULL, 
    PHONE          VARCHAR2(20)    NOT NULL, 
    USERROLE       VARCHAR2(10)    NOT NULL, 
    FILEPATH       VARCHAR2(1000)    NULL, 
    CONFIRM        VARCHAR2(2)    NOT NULL, 
    CLEAN          VARCHAR2(2)    NULL, 
    LIFESTYLE      VARCHAR2(2)    NULL, 
    SHOWER         VARCHAR2(2)    NULL, 
    FAVORITEAGE    VARCHAR2(2)    NULL, 
    GENDER         VARCHAR2(2)    NULL, 
    ANIMAL         VARCHAR2(2)    NULL, 
    NEEDS          VARCHAR2(20)    NULL, 
    CONSTRAINT USER_TB_PK PRIMARY KEY (EMAIL)
);

INSERT INTO USER_TB VALUES(
	2,
	'djkim1216@naver.com',
	'김동주',
	'123',
	'01089898989' ,
	'USER',
	NULL,
	'Y',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
);

INSERT INTO USER_TB VALUES(
	1,
	'michaelhj@naver.com',
	'곽',
	'123',
	'01039107929' ,
	'USER',
	NULL,
	'Y',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
);
SELECT * FROM USER_TB;

DROP TABLE ROOM_TB;
CREATE TABLE ROOM_TB
(
    NO_RM           NUMBER    NOT NULL,  -- 방번호
    EMAIL           VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    PHONE_RM        VARCHAR2(20)    NULL, 
    AGTNAME_RM      VARCHAR2(100)    NOT NULL, 
    PLUSYN_RM       VARCHAR2(2)    NOT NULL, 
    TITLE_RM        VARCHAR2(100)    NOT NULL, 
    PICTURE_RM      VARCHAR2(1000)    NOT NULL, 
    HEAT_RM         VARCHAR2(10)    NOT NULL, 
    BUILTIN_RM      VARCHAR2(2)    NOT NULL, 
    ANIMAL_RM       VARCHAR2(2)    NOT NULL, 
    ELEVATOR_RM     VARCHAR2(2)    NOT NULL, 
    VERANDA_RM      VARCHAR2(2)    NOT NULL, 
    ROOMIN_RM       DATE    	   NOT NULL, 
    CONTENT_RM      VARCHAR2(2000)    NOT NULL, 
    AIRCON_RM       VARCHAR2(2)    NULL, 
    WASHER_RM       VARCHAR2(2)    NULL, 
    DESK_RM         VARCHAR2(2)    NULL, 
    TV_RM           VARCHAR2(2)    NULL, 
    REF_RM          VARCHAR2(2)    NULL, 
    BED_RM          VARCHAR2(2)    NULL, 
    SHOWHOUSE_RM    VARCHAR2(2)    NULL, 
    CLOSET_RM       VARCHAR2(2)    NULL, 
    DOORLOCK_RM     VARCHAR2(2)    NULL, 
    MICROWAVE_RM    VARCHAR2(2)    NULL, 
    RENT_RM         VARCHAR2(10)    NOT NULL, 
    ROOMPRICE_RM    VARCHAR2(50)   NOT NULL, 
    EXPENSE_RM      VARCHAR2(50)   NOT NULL, 
    ROOMTYPE_RM     VARCHAR2(50)   NOT NULL, 
    ADDR_RM         VARCHAR2(50)    NOT NULL, 
    ADDR_DT_RM      VARCHAR2(50)    NOT NULL, 
    ROOMSIZE_RM     VARCHAR2(20)    NOT NULL, 
    ROOMSIZE2_RM    VARCHAR2(20)    NOT NULL, 
    FLOOR_RM        VARCHAR2(20)    NOT NULL, 
    FLOOR2_RM       VARCHAR2(20)    NOT NULL, 
    PARKING_RM      VARCHAR2(2)    NULL, 
    CONSTRAINT ROOM_TB_PK PRIMARY KEY (NO_RM)
);
INSERT INTO ROOM_TB VALUES(2,'djkim1216@naver.com',null,'김동주', 'N','이천에서 원룸 최고!','resources/user/img/test/sokcho.JPG','Y','Y','Y','Y','Y',sysdate,'흥정가능',
'Y','Y','Y','Y','Y',null,null,null,null,null,'전세','1억2천','5만원','원룸','경기도 이천시 구만리로 191','동주건물1','20','18','15층','20층','Y');

INSERT INTO ROOM_TB VALUES(3,'djkim1216@naver.com',null,'김동주', 'N','개구림.','resources/user/img/favorite_1.png','Y','Y','Y','Y','Y',sysdate,'즐',
'Y','Y','Y','Y','Y',null,null,null,null,null,'전세','1억2천','5만원','투룸','경기 이천시 중리천로115번길 45','동주건물2','20','18','15층','20층','Y')

INSERT INTO ROOM_TB VALUES(4,'djkim1216@naver.com',null,'김동주', 'N','이천은 구데기입니다.','resources/user/img/favorite_2.png','Y','Y','Y','Y','Y',sysdate,'킥',
'Y','Y','Y','Y','Y',null,null,null,null,null,'전세','1억2천','5만원','투룸','경기도 이천시 중리천로 76','동주건물3','20','18','15층','20층','Y')

INSERT INTO ROOM_TB VALUES(5,'djkim1216@naver.com',null,'김동주', 'N','강남은 비싸다.','resources/user/img/search.PNG','Y','Y','Y','Y','Y',sysdate,'넘나비싼것',
'Y','Y','Y','Y','Y',null,null,null,null,null,'전세','50억2천','500만원','쓰리룸','서울 강남구 테헤란로14길 6 남도빌딩','KH정보교육원','20','18','15층','20층','Y')

DELETE FROM room_tb WHERE no_rm=1;

select no_rm,agtname_rm,title_rm,picture_rm,plusyn_rm,addr_rm, addr_dt_rm from room_tb;

INSERT INTO ROOM_TB VALUES
(
    1,
    'michaelhj@naver.com', 
    NULL,
    '미래중개사',
    'Y',
    '좋은집',
    'suntown.JPG',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    '20200328',
    '좋은집입니다', 
    NULL,
    NULL,
    NULL,
    NULL,
    NULL, 
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '월세',
    '20',
    '10',
    '오피스텔',
    '경기도 고양시 덕양구 행신동 946',
    '햇빛마을',
    '20',
    '18',
    '3',
    '6', 
    'N'
);
SELECT * FROM ROOM_TB;

DELETE FROM ROOM_TB WHERE NO_RM=1;

select no_rm,agtname_rm,title_rm,picture_rm,plusyn_rm from room_tb;

DROP TABLE USERFAVORITE_TB;
CREATE TABLE USERFAVORITE_TB
(
    EMAIL        VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    RECENT_FV    NUMBER    NULL,
    DIBS_FV      NUMBER    NULL,   
    DATE_FV		 DATE	   NOT NULL,
    ROOM_EX		 VARCHAR2(2) NOT NULL
);

INSERT INTO USERFAVORITE_TB VALUES
(
	'michaelhj@naver.com',
	1,
	NULL,
	SYSDATE,
	'Y'
);
SELECT * FROM USERFAVORITE_TB;

SELECT EMAIL, RECENT_FV, DATE_FV, ROOM_EX
		FROM (SELECT EMAIL, RECENT_FV, DATE_FV, ROOM_EX
		FROM USERFAVORITE_TB
		WHERE EMAIL='michaelhj@naver.com' AND NOT RECENT_FV IS NULL
		ORDER BY DATE_FV DESC)
		WHERE ROWNUM <= 30;
	
SELECT EMAIL,DIBS_FV, DATE_FV, ROOM_EX
		FROM USERFAVORITE_TB
		WHERE EMAIL='michaelhj@naver.com' AND NOT DIBS_FV IS NULL
		ORDER BY DATE_FV DESC;
	
	
DELETE FROM USERFAVORITE_TB WHERE EMAIL='michaelhj@naver.com';


DROP TABLE SEARCH_TB;
CREATE SEQUENCE SEQ_SHSEQ;
CREATE TABLE SEARCH_TB
(
	SEQ_SH		  NUMBER      NOT NULL,
    EMAIL         VARCHAR2(100)        NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    CONTENT_SH    VARCHAR2(50)    NOT NULL, 
    DATE_SH       DATE            NOT NULL,
    CONSTRAINT SEARCH_TB_PK PRIMARY KEY (SEQ_SH)
);

INSERT  INTO SEARCH_TB VALUES 
(	
	SEQ_SHSEQ.NEXTVAL,
	'michaelhj@naver.com', -- 첫줄 공백 X
	'이천시9',
	SYSDATE
);

SELECT EMAIL, CONTENT_SH
	FROM SEARCH_TB
	WHERE EMAIL='michaelhj@naver.com'
	ORDER BY DATE_SH DESC;

SELECT SEQ_SH, EMAIL,
		   CONTENT_SH
	FROM (
	SELECT SEQ_SH, EMAIL, CONTENT_SH
	FROM SEARCH_TB
	WHERE EMAIL='michaelhj@naver.com'
	ORDER BY DATE_SH DESC
	)
	WHERE ROWNUM <= 5;	  

DROP TABLE NOTICE_TB;
DROP SEQUENCE SEQ_NT_SEQ;
CREATE SEQUENCE SEQ_NT_SEQ;
CREATE TABLE NOTICE_TB
(
    SEQ_NT        INT             NOT NULL, 
    TITLE_NT      VARCHAR2(100)    NOT NULL, 
    CONTENT_NT    VARCHAR2(3000)    NOT NULL, 
    DATE_NT       DATE            NOT NULL, 
    CONSTRAINT NOTICE_TB_PK PRIMARY KEY (SEQ_NT)
);

SELECT * FROM NOTICE_TB;
INSERT INTO NOTICE_TB VALUES
		(
		SEQ_NT_SEQ.NEXTVAL,
		'공지1',
		'어떤 내용을 공지할까요',
		SYSDATE
		);

-- reivew table
DROP TABLE REVIEW_TB;
CREATE TABLE REVIEW_TB
(
    EMAIL       VARCHAR2(100)    NOT NULL, 
    AGEMAIL     VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    RCONTENT    VARCHAR2(300)    NOT NULL,
    STAR        NUMBER    NOT NULL,
    RDATE		DATE 	  NOT NULL
);
--CONSTRAINT REVIEW_TB_PK PRIMARY KEY (EMAIL,AGEMAIL)
INSERT INTO REVIEW_TB VALUES
(
	'michaelhj@naver.com',
	'michaelhj@naver2.com',
	'이거 맞아? 너무 좋아~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',
	4.5,
	SYSDATE
);

SELECT * FROM REVIEW_TB;



INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'michaelhj@naver.com', '관리자', '{noop}1234', '010-0000-0000',
'ROLE_ADMIN', '', '', '', '', '', '', '', '', '', '1');
INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'michaelhj@naver2.com', '관리자', '{noop}1234', '010-0000-0000',
'ROLE_ADMIN', '', '', '', '', '', '', '', '', '', '1');



