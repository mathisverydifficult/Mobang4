--DROP SEQUENCE ROOMNOSEQ;
--DROP TABLE ROOM_TB;
--
--CREATE SEQUENCE ROOMNOSEQ;
--CREATE TABLE ROOM_TB(
--	NO_RM VARCHAR2 PRIMARY KEY,
--	EMAIL
--
--);

-- 공지사항 테이블
drop sequence noticeseq;
drop table notice_tb;

create sequence noticeseq;
create table notice_tb(
	seq_nt number primary key,
	title_nt varchar2(900) not null,
	content_nt varchar2(4000) not null,
	date_nt date not null
);

insert into notice_tb values(noticeseq.nextval,'방주인매물 노출 정책 변경사항 안내','안녕하세요. 모방입니다.',sysdate);
insert into notice_tb values(noticeseq.nextval,'공지사항','안녕하세요. 모방입니다.\n공지사항입니다.\n\r사랑합니다.',sysdate);
insert into notice_tb values(noticeseq.nextval,'공지사항2','안녕하세요. 모방입니다.'\n'공지사항입니다.'\n\r'사랑합니다.',sysdate);	-- insert 실패
insert into notice_tb values(noticeseq.nextval,'공지사항3','안녕하세요. 모방입니다.'||CHR(10) ||'공지사항입니다.'|| CHR(10) ||'사랑합니다.',sysdate);	--줄바꿈 실패
insert into notice_tb values(noticeseq.nextval,'공지사항ㅠ','안녕하세요. 모방입니다.'||CHR(13)||CHR(10)||'공지사항입니다.'||CHR(10)||'사랑합니다.',sysdate);	--줄바꿈 실패
insert into notice_tb values(noticeseq.nextval,'공지사하하하','안녕하세요. 모방입니다.'||CHAR(13)||CHAR(10)||'공지사항입니다.'||CHAR(10)||'사랑합니다.',sysdate);


SELECT SEQ_NT, TITLE_NT, CONTENT_NT, DATE_NT FROM NOTICE_TB;

SELECT  SEQ_NT, 
		        TITLE_NT, 
		        CONTENT_NT,
		        DATE_NT
		 FROM ( 
		        SELECT SEQ_NT, 
		               TITLE_NT, 
		               CONTENT_NT, 
		               DATE_NT, 
		               ROW_NUMBER() OVER(ORDER BY SEQ_NT DESC) AS RNUM
		         FROM NOTICE_TB
		                       ) MP
		WHERE RNUM BETWEEN 1 AND 2
		ORDER BY SEQ_NT DESC