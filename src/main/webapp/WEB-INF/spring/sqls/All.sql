DROP SEQUENCE USER_SEQ;
DROP TABLE USER_TB;

CREATE SEQUENCE USER_SEQ;
CREATE TABLE USER_TB(
	SEQ					NUMBER,
	EMAIL 				VARCHAR2(300),
	NAME 				VARCHAR2(100) 		NOT NULL,
	PWD 				VARCHAR2(100) 		NOT NULL,
	PHONE 				VARCHAR2(100) 		NOT NULL,
	AUTHORITY 			VARCHAR2(100) 		NOT NULL,
	USERFILE 			VARCHAR2(1000),
	CONFIRM 			VARCHAR2(100),
	CLEAN 				VARCHAR2(10),
	LIFESTYLE 			VARCHAR2(100),
	SHOWER 				VARCHAR2(100),
	FAVORITEAGE 		VARCHAR2(100),
	GENDER				VARCHAR2(50),
	ANIMAL				VARCHAR2(50),
	NEEDS				VARCHAR2(4000),
	ENABLED				VARCHAR2(2),
	CONSTRAINT USER_TB_PK PRIMARY KEY (EMAIL)
);

SELECT * FROM USER_TB;

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'admin@naver.com', '관리자', '{noop}1234', '010-0000-0000',
'ROLE_ADMIN', '', '', '', '', '', '', '', '', '', '1');

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'djkim1216@naver.com', '관리자', '{noop}1234', '010-0000-0003',
'ROLE_ADMIN', '', '', '', '', '', '', '', '', '', '1');

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'agent@naver.com', '공인중개사', '{noop}1234', '010-0000-0001',
'ROLE_MEMBER', '', '', '', '', '', '', '', '', '', '1');

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'user@naver.com', '세입자', '{noop}1234', '010-0000-0002',
'ROLE_USER', '', '', '', '', '', '', '', '', '', '1');

UPDATE USER_TB SET AUTHORITY = 'ROLE_MEMBER' WHERE SEQ = 2; 

SELECT * FROM USER_TB;

DROP TABLE ROOM_TB;
<<<<<<< HEAD

=======
DROP SEQUENCE ROOMSEQ;
CREATE SEQUENCE ROOMSEQ;
>>>>>>> agent_roominsert
CREATE TABLE ROOM_TB
(
    NO_RM           NUMBER    NOT NULL,  -- 방번호
    EMAIL           VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    TITLE_RM        VARCHAR2(1000)    NOT NULL, 
    PICTURE_RM      VARCHAR2(1000)    NOT NULL, 
    ANIMAL_RM       VARCHAR2(20)    NOT NULL, 
    ELEVATOR_RM     VARCHAR2(2)    NOT NULL, 
    VERANDA_RM      VARCHAR2(2)    NOT NULL, 
    ROOMIN_RM       DATE    	   NOT NULL, 
    CONTENT_RM      VARCHAR2(2000)    NOT NULL, 
    AIRCON_RM       VARCHAR2(10)    NULL, 
    WASHER_RM       VARCHAR2(2)    NULL,
    GASRANGE_RM		VARCHAR2(2)	   NULL,
    INDUCTION_RM	VARCHAR2(2)	   NULL,
    DESK_RM         VARCHAR2(2)    NULL, 
    TV_RM           VARCHAR2(2)    NULL, 
    REF_RM          VARCHAR2(2)    NULL, 
    BED_RM          VARCHAR2(2)    NULL, 
    SHOWHOUSE_RM    VARCHAR2(2)    NULL, 
    CLOSET_RM       VARCHAR2(2)    NULL, 
    MICROWAVE_RM    VARCHAR2(2)    NULL,
    SINK_RM			VARCHAR2(2)	   NULL,
    RENT_RM         VARCHAR2(10)    NOT NULL, 
    ROOMPRICE_RM    VARCHAR2(100)   NOT NULL, 
    EXPENSE_RM      VARCHAR2(50)   NOT NULL, 
    ROOMTYPE_RM     VARCHAR2(50)   NOT NULL, 
    ADDR_RM         VARCHAR2(100)    NOT NULL, 
    ADDR_DT_RM      VARCHAR2(100)    NOT NULL, 
    ROOMSIZE_RM     VARCHAR2(20)    NOT NULL, 
    ROOMSIZE2_RM    VARCHAR2(20)    NOT NULL, 
    FLOOR_RM        VARCHAR2(20)    NOT NULL, 
    FLOOR2_RM       VARCHAR2(20)    NOT NULL, 
    PARKING_RM      VARCHAR2(2)    NULL, 
    CONSTRAINT ROOM_TB_PK PRIMARY KEY (NO_RM)
);

INSERT INTO ROOM_TB VALUES
(
    1,
    'djkim1216@naver.com', 
    '',
    '김동주',
    'Y',
    '이천에서 제일 싼집',
    'resources/user/img/test/sokcho.JPG',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    sysdate,
    '이천에서 제일 싼건 거짓말입니다. 비싸ㅛ', 
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
    NULL,
    NULL,
    '전세',
    '1억2천만원',
    '7',
    '투룸',
    '경기도 이천시 구만리로 191',
    '동주건물1',
    '20',
    '18',
    '15',
    '20', 
    'Y'
);

INSERT INTO ROOM_TB VALUES
(
    2,
    'djkim1216@naver.com', 
    NULL,
    '집이없어중개사',
    'Y',
    '한강뷰',
    'FILEPATH+FILENAME',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    '20200331',
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
    NULL,
    NULL,
    '월세',
    '30',
    '10',
    '오피스텔',
    '광주시',
    '숯가마골',
    '20',
    '18',
    '4',
    '3', 
    'N'
);

INSERT INTO ROOM_TB VALUES
(
    3,
    'djkim1216@naver.com', 
    '',
    '김동주',
    'N',
    '이천에서 원룸 최고!',
    'resources/user/img/favorite_1.png',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    sysdate,
    '흥정가능', 
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
    NULL,
    NULL,
    '전세',
    '1억2천만원',
    '5',
    '원룸',
    '경기 이천시 중리천로115번길 45',
    '동주건물2',
    '20',
    '18',
    '15',
    '20', 
    'Y'
);

INSERT INTO ROOM_TB VALUES
(
    4,
    'djkim1216@naver.com', 
    '',
    '김동주',
    'N',
    '이천은 구데기입니다',
    'resources/user/img/favorite_2.png',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    sysdate,
    '모두가 떠나는 이시점', 
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
    NULL,
    NULL,
    '전세',
    '1억2천만원',
    '5',
    '원룸',
    '경기도 이천시 중리천로 76',
    '동주건물3',
    '20',
    '18',
    '15',
    '20', 
    'Y'
);

INSERT INTO ROOM_TB VALUES
(
    5,
    'djkim1216@naver.com', 
    '',
    '김동주',
    'N',
    '강남은 비싸다.',
    'resources/user/img/search.PNG',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    sysdate,
    '강남 오지고요 비싸고요 지리고요 짜증나고요', 
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
    NULL,
    NULL,
    '전세',
    '50억2천만원',
    '500',
    '쓰리룸',
    '서울 강남구 테헤란로14길 6 남도빌딩',
    'KH정보교육원',
    '20',
    '18',
    '4',
    '8', 
    'Y'
);

INSERT INTO ROOM_TB VALUES
(
    6,
    'djkim1216@naver.com', 
    '',
    '미래중개사',
    'N',
    '좋은집',
    'resources/user/img/test/suntown.jpg',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    sysdate,
    '강남 오지고요 비싸고요 지리고요 짜증나고요', 
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
    'Y'
);

SELECT * FROM room_tb;

DROP TABLE REVIEW_TB;
CREATE TABLE REVIEW_TB
(
    EMAIL       VARCHAR2(100)    NOT NULL, 
    AGEMAIL     VARCHAR2(100)    NOT NULL REFERENCES AGENTJOIN_TB(EMAIL) ON DELETE CASCADE, 
    RCONTENT    VARCHAR2(100)    NOT NULL,
    STAR        VARCHAR2(100)    NOT NULL, 
    CONSTRAINT REVIEW_TB_PK PRIMARY KEY (EMAIL)
);



DROP TABLE ALARM_TB;
CREATE TABLE ALARM_TB
(
    NO_AL          INT         NOT NULL, 
    EMAIL          VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    ROOMNUM_AL     VARCHAR2(100)    NOT NULL, 
    CATEGORY_AL    VARCHAR2(100)    NOT NULL, 
    DATE_AL        DATE        NOT NULL, 
    CONSTRAINT ALARM_TB_PK PRIMARY KEY (NO_AL)
);




DROP TABLE ITEM_TB;
CREATE TABLE ITEM_TB
(
    NAME_IT     VARCHAR2(100)    NOT NULL, 
    PRICE_IT    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT ITEM_TB_PK PRIMARY KEY (NAME_IT)
);



DROP TABLE PAY_TB;
CREATE TABLE PAY_TB
(
    NAME_IT      VARCHAR2(100)    NOT NULL REFERENCES ITEM_TB(NAME_IT) ON DELETE CASCADE, 
    EMAIL        VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    ADDR_PAY     VARCHAR2(100)    NOT NULL, 
    TOTAL_PAY    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT PAY_TB_PK PRIMARY KEY (NAME_IT)
)


DROP TABLE AGENTJOIN_TB;
CREATE TABLE AGENTJOIN_TB
(
    EMAIL             VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    MOBILE_AGT        VARCHAR2(100)    NOT NULL, 
    PHONE_AGT         VARCHAR2(100)    NOT NULL, 
    ADDR_AGT          VARCHAR2(100)    NOT NULL, 
    QUALNO_AGT        VARCHAR2(100)    NOT NULL, 
    COMNO_AGT         VARCHAR2(100)    NOT NULL, 
    QUALNOPATH_AGT    VARCHAR2(100)    NOT NULL, 
    COMNOPATH_AGT     VARCHAR2(100)    NOT NULL, 
    NAME_AGT          VARCHAR2(100)    NOT NULL, 
    DDAY_AGT          VARCHAR2(100)    NULL, 
    CONSTRAINT AGENTJOIN_TB_PK PRIMARY KEY (EMAIL)
);



DROP TABLE USERFAVORITE_TB;
CREATE TABLE USERFAVORITE_TB
(
    EMAIL        VARCHAR2    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    RECENT_FV    VARCHAR2    NULL REFERENCES ROOM_TB(NO_RM) ON DELETE NULL, 
    DIBS_FV      VARCHAR2    NULL REFERENCES ROOM_TB(NO_RM) ON DELETE NULL  
);



DROP TABLE SEARCH_TB;
CREATE TABLE SEARCH_TB
(
    EMAIL         VARCHAR2(100)        NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    CONTENT_SH    VARCHAR2(20)    NOT NULL, 
    DATE_SH       DATE            NOT NULL
);



DROP TABLE NOTICE_TB;
CREATE TABLE NOTICE_TB
(
    SEQ_NT        INT             NOT NULL, 
    TITLE_NT      VARCHAR2(20)    NOT NULL, 
    CONTENT_NT    VARCHAR2(20)    NOT NULL, 
    DATE_NT       DATE            NOT NULL, 
    CONSTRAINT NOTICE_TB_PK PRIMARY KEY (SEQ_NT)
);




DROP TABLE QNA_TB; 
CREATE TABLE QNA_TB
(
    SEQ_Q         NUMBER            NOT NULL, 
    GROUPSEQ_Q    NUMBER            NOT NULL, 
    ORDER_Q       NUMBER            NOT NULL, 
    TITLET_Q      VARCHAR2(40)      NOT NULL, 
    TITLE_Q       VARCHAR2(5)       NOT NULL, 
    CONTENT_Q     VARCHAR2(1000)    NOT NULL, 
    EMAIL         VARCHAR2(100)     NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    DATE_Q        DATE              NOT NULL,
    
    CONSTRAINT QNA_TB_PK PRIMARY KEY (SEQ_Q)
);


DROP TABLE FILEUPLOAD;
CREATE SEQUENCE FILEUPSEQ;
CREATE TABLE FILEUPLOAD
(
	SEQ_Q NUMBER,
	NAME VARCHAR2(1000),
	CONTENT VARCHAR2(1000)
);
SELECT * FROM FILEUPLOAD;
SELECT SEQ_Q, NAME, CONTENT FROM FILEUPLOAD WHERE NAME='cat3.jfif';
INSERT INTO FILEUPLOAD VALUES(1,'DK.PNG','안녕');

(SELECT  TITLE_RM,PICTURE_RM,PLUSYN_RM,ROOMTYPE_RM,ROOMPRICE_RM,FLOOR_RM,ROOMSIZE_RM,EXPENSE_RM
		 FROM ( 
		        SELECT NO_RM,TITLE_RM,PICTURE_RM,PLUSYN_RM,ROOMTYPE_RM,ROOMPRICE_RM,FLOOR_RM,ROOMSIZE_RM,EXPENSE_RM, 
		               ROW_NUMBER() OVER(ORDER BY NO_RM DESC) AS RNUM
		         FROM ROOM_TB
		                       ) MP
		WHERE (RNUM BETWEEN 1 AND 2) AND EMAIL = 'michaelhj@naver.com'
		ORDER BY NO_RM DESC
		

