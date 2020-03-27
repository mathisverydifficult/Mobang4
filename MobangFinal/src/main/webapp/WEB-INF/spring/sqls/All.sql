DROP TABLE USER_TB;
CREATE TABLE USER_TB
(
    SEQ            INT         NOT NULL, 
    EMAIL          VARCHAR2    NOT NULL, 
    NAME           VARCHAR2    NOT NULL, 
    PWD            VARCHAR2    NOT NULL, 
    PHONE          VARCHAR2    NOT NULL, 
    ROLE           VARCHAR2    NOT NULL, 
    FILE           VARCHAR2    NULL, 
    CONFIRM        VARCHAR2    NOT NULL, 
    CLEAN          VARCHAR2    NULL, 
    LIFESTYLE      VARCHAR2    NULL, 
    SHOWER         VARCHAR2    NULL, 
    FAVORITEAGE    VARCHAR2    NULL, 
    GENDER         VARCHAR2    NULL, 
    ANIMAL         VARCHAR2    NULL, 
    NEEDS          VARCHAR2    NULL, 
    CONSTRAINT USER_TB_PK PRIMARY KEY (EMAIL)
);



DROP TABLE ROOM_TB;
CREATE TABLE ROOM_TB
(
    NO_RM           VARCHAR2    NULL, 
    EMAIL           VARCHAR2    NOT NULL REFERENCES AGENTJOIN_TB(EMAIL) ON DELETE CASCADE, 
    PHONE_RM        VARCHAR2    NULL, 
    AGTNAME_RM      VARCHAR2    NOT NULL, 
    PLUSYN_RM       VARCHAR2    NOT NULL, 
    TITLE_RM        VARCHAR2    NOT NULL, 
    PICTURE_RM      VARCHAR2    NOT NULL, 
    HEAT_RM         VARCHAR2    NOT NULL, 
    BUILTIN_RM      VARCHAR2    NOT NULL, 
    ANIMAL_RM       VARCHAR2    NOT NULL, 
    ELEVATOR_RM     VARCHAR2    NOT NULL, 
    VERANDA_RM      VARCHAR2    NOT NULL, 
    ROOMIN_RM       VARCHAR2    NOT NULL, 
    CONTENT_RM      VARCHAR2    NOT NULL, 
    AIRCON_RM       VARCHAR2    NULL, 
    WASHER_RM       VARCHAR2    NULL, 
    DESK_RM         VARCHAR2    NULL, 
    TV_RM           VARCHAR2    NULL, 
    REF_RM          VARCHAR2    NULL, 
    BED_RM          VARCHAR2    NULL, 
    SHOWHOUSE_RM    VARCHAR2    NULL, 
    CLOSET_RM       VARCHAR2    NULL, 
    DOORLOCK_RM     VARCHAR2    NULL, 
    MICROWAVE_RM    VARCHAR2    NULL, 
    RENT_RM         VARCHAR2    NULL, 
    ROOMPRICE_RM    VARCHAR2    NULL, 
    EXPENSE_RM      VARCHAR2    NULL, 
    ROOMTYPE_RM     VARCHAR2    NULL, 
    ADDR_RM         VARCHAR2    NOT NULL, 
    ADDR_DT_RM      VARCHAR2    NOT NULL, 
    ROOMSIZE_RM     VARCHAR2    NOT NULL, 
    ROOMSIZE2_RM    VARCHAR2    NOT NULL, 
    FLOOR_RM        VARCHAR2    NOT NULL, 
    FLOOR2_RM       VARCHAR2    NOT NULL, 
    PARKING_RM      VARCHAR2    NULL, 
    CONSTRAINT ROOM_TB_PK PRIMARY KEY (NO_RM)
);





DROP TABLE REVIEW_TB;
CREATE TABLE REVIEW_TB
(
    EMAIL       VARCHAR2    NOT NULL, 
    AGEMAIL     VARCHAR2    NOT NULL REFERENCES AGENTJOIN_TB(EMAIL) ON DELETE CASCADE, 
    RCONTENT    VARCHAR2    NOT NULL, 
    STAR        VARCHAR2    NOT NULL, 
    CONSTRAINT REVIEW_TB_PK PRIMARY KEY (EMAIL)
);



DROP TABLE ALARM_TB;
CREATE TABLE ALARM_TB
(
    NO_AL          INT         NOT NULL, 
    EMAIL          VARCHAR2    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    ROOMNUM_AL     VARCHAR2    NOT NULL, 
    CATEGORY_AL    VARCHAR2    NOT NULL, 
    DATE_AL        DATE        NOT NULL, 
    CONSTRAINT ALARM_TB_PK PRIMARY KEY (NO_AL)
);




DROP TABLE ITEM_TB;
CREATE TABLE ITEM_TB
(
    NAME_IT     VARCHAR2    NOT NULL, 
    PRICE_IT    VARCHAR2    NOT NULL, 
    CONSTRAINT ITEM_TB_PK PRIMARY KEY (NAME_IT)
);



DROP TABLE PAY_TB;
CREATE TABLE PAY_TB
(
    NAME_IT      VARCHAR2    NOT NULL REFERENCES ITEM_TB(NAME_IT) ON DELETE CASCADE, 
    EMAIL        VARCHAR2    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    ADDR_PAY     VARCHAR2    NOT NULL, 
    TOTAL_PAY    VARCHAR2    NOT NULL, 
    CONSTRAINT PAY_TB_PK PRIMARY KEY (NAME_IT)
)


DROP TABLE AGENTJOIN_TB;
CREATE TABLE AGENTJOIN_TB
(
    EMAIL             VARCHAR2    NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
    MOBILE_AGT        VARCHAR2    NOT NULL, 
    PHONE_AGT         VARCHAR2    NOT NULL, 
    ADDR_AGT          VARCHAR2    NOT NULL, 
    QUALNO_AGT        VARCHAR2    NOT NULL, 
    COMNO_AGT         VARCHAR2    NOT NULL, 
    QUALNOPATH_AGT    VARCHAR2    NOT NULL, 
    COMNOPATH_AGT     VARCHAR2    NOT NULL, 
    NAME_AGT          VARCHAR2    NOT NULL, 
    DDAY_AGT          VARCHAR2    NULL, 
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
    EMAIL         VARCHAR2        NOT NULL REFERENCES USER_TB(EMAIL) ON DELETE CASCADE, 
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


