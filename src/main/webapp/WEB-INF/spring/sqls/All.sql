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
VALUES(USER_SEQ.NEXTVAL, 'missdla4929@naver.com', '임미경', '{noop}1004', '010-7116-4929',
'ROLE_MEMBER', '', '', '', '', '', '', '', '', '', '1');

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'user@naver.com', '세입자', '{noop}1234', '010-0000-0002',
'ROLE_USER', '', '', '', '', '', '', '', '', '', '1');

INSERT INTO USER_TB
		VALUES(USER_SEQ.NEXTVAL, 'dwiano@naver.com', 'qqq', '1111', '2561489', 
		'ROLE_MEMBER', '123', '',
		'', '', '', 
		'', '', '', 
		'', '1')

INSERT INTO USER_TB 
VALUES(USER_SEQ.NEXTVAL, 'michaelhj@naver.com', '세입자', '{noop}1234', '010-0000-1234',
'ROLE_USER', '', '', '', '', '', '', '', '', '', '1');



UPDATE USER_TB SET AUTHORITY = 'ROLE_MEMBER' WHERE SEQ = 2; 

DELETE FROM USER_TB
WHERE EMAIL='missdla4929@naver.com';

DELETE FROM USER_TB
WHERE EMAIL='hyerin03158@gmail.com';

SELECT * FROM USER_TB;



DROP TABLE ROOM_TB;
DROP SEQUENCE ROOMSEQ;
CREATE SEQUENCE ROOMSEQ;
CREATE TABLE ROOM_TB
(
    NO_RM           NUMBER          NOT NULL,  -- 방번호
    EMAIL           VARCHAR2(300)   NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    TITLE_RM        VARCHAR2(1000)  NOT NULL, 
    PICTURE_RM      VARCHAR2(1000)  NOT NULL, 
    ANIMAL_RM       VARCHAR2(20)    NOT NULL, 
    ELEVATOR_RM     VARCHAR2(2)     NOT NULL, 
    VERANDA_RM      VARCHAR2(2)     NOT NULL, 
    ROOMIN_RM       DATE    	    NOT NULL, 
    CONTENT_RM      VARCHAR2(2000)  NOT NULL, 
    AIRCON_RM       VARCHAR2(10)    NULL, 
    WASHER_RM       VARCHAR2(10)    NULL,
    GASRANGE_RM		VARCHAR2(20)	NULL,
    INDUCTION_RM	VARCHAR2(10)	NULL,
    DESK_RM         VARCHAR2(10)    NULL, 
    TV_RM           VARCHAR2(10)    NULL, 
    REF_RM          VARCHAR2(10)    NULL, 
    BED_RM          VARCHAR2(10)    NULL, 
    SHOWHOUSE_RM    VARCHAR2(10)    NULL, 
    CLOSET_RM       VARCHAR2(10)    NULL, 
    MICROWAVE_RM    VARCHAR2(20)    NULL,
    SINK_RM			VARCHAR2(10)	NULL,
    RENT_RM         VARCHAR2(10)    NOT NULL, 
    ROOMPRICE_RM    VARCHAR2(100)   NOT NULL, 
    EXPENSE_RM      VARCHAR2(50)    NOT NULL, 
    ROOMTYPE_RM     VARCHAR2(50)    NOT NULL, 
    ADDR_RM         VARCHAR2(100)   NOT NULL, 
    ADDR_DT_RM      VARCHAR2(100)   NOT NULL, 
    ROOMSIZE_RM     VARCHAR2(20)    NOT NULL, 
    ROOMSIZE2_RM    VARCHAR2(20)    NOT NULL, 
    FLOOR_RM        VARCHAR2(20)    NOT NULL, 
    FLOOR2_RM       VARCHAR2(20)    NOT NULL, 
    PARKING_RM      VARCHAR2(2)     NULL, 
    CONSTRAINT ROOM_TB_PK PRIMARY KEY (NO_RM)
);

SELECT * FROM ROOM_TB;

INSERT INTO ROOM_TB VALUES
(
     roomseq.nextval,
    'djkim1216@naver.com', 
    '이천에서 제일 싼집',
    'resources/user/img/test/sokcho.JPG',
    'Y',
    'Y',
    'Y',
    sysdate,
    '이천에서 제일 싼건 거짓말입니다. 비싸ㅛ', 
    '에어컨',
    '세탁기',
    '가스레인지',
    '인덕션',
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
    roomseq.nextval,
    'djkim1216@naver.com', 
    '한강뷰',
    'FILEPATH+FILENAME',
    'Y',
    'Y',
    'Y',
    '20200331',
    '좋은집입니다', 
    NULL,
    '세탁기',
    '가스레인지',
    '책상',
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
    roomseq.nextval,
    'djkim1216@naver.com', 
    '이천에서 원룸 최고!',
    'resources/user/img/favorite_1.png',
    'Y',
    'Y',
    'Y',
    sysdate,
    '흥정가능', 
    NULL,
    NULL,
    NULL,
    NULL,
    'TV', 
    '냉장고',
    NULL,
    NULL,
    NULL,
    '옷장',
    '전자레인지',
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
    roomseq.nextval,
    'djkim1216@naver.com', 
    '이천은 구데기입니다',
    'resources/user/img/favorite_2.png',
    'Y',
    'Y',
    'Y',
    sysdate,
    '모두가 떠나는 이시점', 
    '에어컨',
    '세탁기',
    '가스레인지',
    '인덕션',
    '책상', 
    'TV',
    '냉장고',
    '침대',
    '신발장',
    '옷장',
    '전자레인지',
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
    roomseq.nextval,
    'djkim1216@naver.com', 
    '강남은 비싸다.',
    'resources/user/img/search.PNG',
    'Y',
    'Y',
    'Y',
    sysdate,
    '강남 오지고요 비싸고요 지리고요 짜증나고요', 
    NULL,
    NULL,
    '가스레인지',
    '인덕션',
    '책상', 
    'TV',
    '냉장고',
    '침대',
    '신발장',
    '옷장',
    '전자레인지',
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
    roomseq.nextval,
    'djkim1216@naver.com', 
    '좋은집',
    'resources/user/img/test/suntown.jpg',
    'Y',
    'Y',
    'Y',
    sysdate,
    '강남 오지고요 비싸고요 지리고요 짜증나고요', 
    '에어컨',
    NULL,
    '가스레인지',
    '인덕션',
    NULL, 
    NULL,
    '냉장고',
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
SELECT * FROM USERFAVORITE_TB;

DELETE FROM USERFAVORITE_TB;

  	select no_rm, title_rm,picture_rm,content_rm, addr_rm,addr_dt_rm,rent_rm, roomtype_rm, checkdib
  	from(
  	select no_rm,title_rm,picture_rm,content_rm, addr_rm,addr_dt_rm,rent_rm, roomtype_rm,
  	CASE WHEN B.DIBS_FV IS NULL THEN 1
	WHEN B.DIBS_FV IS NOT NULL THEN 2 END AS CHECKDIB
	FROM ROOM_TB A LEFT OUTER JOIN USERFAVORITE_TB B 
	ON(b.email='djkim1216@naver.com' AND A.NO_RM = B.DIBS_FV))
	WHERE checkdib='2';

	
  	select no_rm,title_rm,picture_rm,content_rm, addr_rm,addr_dt_rm,rent_rm, roomtype_rm,
  	CASE WHEN B.DIBS_FV IS NULL THEN 1
	WHEN B.DIBS_FV IS NOT NULL THEN 2 END AS CHECKDIB
	FROM ROOM_TB A LEFT OUTER JOIN USERFAVORITE_TB B 
	ON(A.NO_RM = B.DIBS_FV);

select no_rm, email, title_rm,picture_rm,content_rm, addr_rm,addr_dt_rm,rent_rm, roomtype_rm, checkdib
  	from(
  	select no_rm, a.EMAIL,title_rm,picture_rm,content_rm, addr_rm,addr_dt_rm,rent_rm, roomtype_rm,
  	CASE WHEN B.DIBS_FV IS NULL THEN 1
	WHEN B.DIBS_FV IS NOT NULL THEN 2 END AS CHECKDIB
	FROM ROOM_TB A LEFT OUTER JOIN USERFAVORITE_TB B 
	ON(a.EMAIL = 'user@naver.com' AND A.NO_RM = B.DIBS_FV));

 	select no_rm, title_rm,picture_rm,animal_rm,elevator_rm,veranda_rm,
	roomin_rm, content_rm,aircon_rm, washer_rm, gasrange_rm, induction_rm,
	desk_rm, tv_rm, ref_rm, bed_rm, showhouse_rm, closet_rm, microwave_rm, sink_rm,
	rent_rm, roomprice_rm, expense_rm, roomtype_rm, addr_rm, addr_dt_rm, roomsize_rm,
	roomsize2_rm, floor_rm, floor2_rm, parking_rm,
  	CASE WHEN B.DIBS_FV IS NULL THEN 1
	WHEN B.DIBS_FV IS NOT NULL THEN 2 END AS CHECKDIB
	FROM ROOM_TB A LEFT OUTER JOIN USERFAVORITE_TB B 
	ON(B.EMAIL='user@naver.com' AND A.NO_RM = B.DIBS_FV) 
	WHERE no_rm=6 ;

DROP TABLE REVIEW_TB;
CREATE TABLE REVIEW_TB
(
    EMAIL       VARCHAR2(300)    NOT NULL, 
    AGEMAIL     VARCHAR2(100)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    RCONTENT    VARCHAR2(300)    NOT NULL,
    STAR        NUMBER    NOT NULL,
    RDATE		DATE 	  NOT NULL
);



DROP TABLE ALARM_TB;
CREATE TABLE ALARM_TB
(
    NO_AL          NUMBER         NOT NULL, 
    EMAIL          VARCHAR2(300)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
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

INSERT INTO ITEM_TB
VALUES('일반','88000');
INSERT INTO ITEM_TB
VALUES('일반(오피스텔)','44000');
INSERT INTO ITEM_TB
VALUES('프리미엄(동)','142000');
INSERT INTO ITEM_TB
VALUES('프리미엄(역)','233000');
INSERT INTO ITEM_TB
VALUES('프리미엄(대학교)','130000');
INSERT INTO ITEM_TB
VALUES('플러스(정기권)','18000');
INSERT INTO ITEM_TB
VALUES('플러스(1일권)','1000');


DROP TABLE PAY_TB;
CREATE TABLE PAY_TB
(
    NAME_IT      VARCHAR2(100)    NOT NULL REFERENCES ITEM_TB(NAME_IT) ON DELETE CASCADE, 
    EMAIL        VARCHAR2(300)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    ADDR_PAY     VARCHAR2(100)    NULL, 
    STARTDATE_PAY    VARCHAR2(100)   NOT NULL, 
    ENDDATE_PAY    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT PAY_TB_PK PRIMARY KEY (NAME_IT)
)

INSERT INTO PAY_TB
VALUES('일반','missdla4929@naver.com','',TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(ADD_MONTHS(SYSDATE,+1),'YYYY-MM-DD'));

SELECT * FROM PAY_TB


DROP TABLE AGENTJOIN_TB;
CREATE TABLE AGENTJOIN_TB
(
    EMAIL             VARCHAR2(300)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    AGTNAME_AGT		  VARCHAR2(100)	  NOT NULL,
    MOBILE_AGT        VARCHAR2(20)    NOT NULL, 
    PHONE_AGT         VARCHAR2(20)    NOT NULL, 
    ADDR_AGT          VARCHAR2(100)   NOT NULL, 
    QUALNO_AGT        VARCHAR2(100)    NOT NULL, 
    COMNO_AGT         VARCHAR2(100)    NOT NULL, 
    QUALNOPATH_AGT    VARCHAR2(100)    NOT NULL, 
    COMNOPATH_AGT     VARCHAR2(100)    NOT NULL, 
    NAME_AGT          VARCHAR2(100)    NOT NULL,
    PLUSYN_AGT		  VARCHAR2(2)		NULL,
    CONSTRAINT AGENTJOIN_TB_PK PRIMARY KEY (EMAIL)
);

INSERT INTO AGENTJOIN_TB
VALUES('missdla4929@naver.com','도미솔중개소','010-0000-1010', '031-777-6666', '경기도 광주',
'면허번호', '사업자등록번호', '면허번호경로', '사업자등록번호경로', '임미경','Y');



DROP TABLE USERFAVORITE_TB;
CREATE TABLE USERFAVORITE_TB
(				
    EMAIL        VARCHAR2(300)    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    RECENT_FV    NUMBER, 	   
    DIBS_FV      NUMBER,	  
    DATE_FV		 DATE,
    ROOM_EX		 VARCHAR2(2) NOT NULL
);

SELECT * FROM USERFAVORITE_TB;


DROP TABLE SEARCH_TB;
DROP SEQUENCE SEQ_SHSEQ;
CREATE SEQUENCE SEQ_SHSEQ;
CREATE TABLE SEARCH_TB
(
	SEQ_SH		  NUMBER      NOT NULL,
    EMAIL         VARCHAR2(100)        NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    CONTENT_SH    VARCHAR2(50)    NOT NULL, 
    DATE_SH       DATE            NOT NULL,
    CONSTRAINT SEARCH_TB_PK PRIMARY KEY (SEQ_SH)
);



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



DROP TABLE QNA_TB; 
CREATE TABLE QNA_TB
(
    SEQ_Q         NUMBER            NOT NULL, 
    GROUPSEQ_Q    NUMBER            NOT NULL, 
    ORDER_Q       NUMBER            NOT NULL, 
    TITLET_Q      VARCHAR2(40)      NOT NULL, 
    TITLE_Q       VARCHAR2(5)       NOT NULL, 
    CONTENT_Q     VARCHAR2(1000)    NOT NULL, 
    EMAIL         VARCHAR2(300)     NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    DATE_Q        DATE              NOT NULL,
    
    CONSTRAINT QNA_TB_PK PRIMARY KEY (SEQ_Q)
);


