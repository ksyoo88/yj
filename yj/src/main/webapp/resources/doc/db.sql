DROP TABLE YJ_MEMBER CASCADE CONSTRAINTS; --회원 테이블
DROP TABLE YJ_MEM_FAVORITE CASCADE CONSTRAINTS; -- 회원 성향 테이블
DROP TABLE YJ_PANORAMA CASCADE CONSTRAINTS; -- 파노라마 테이블
DROP TABLE YJ_PANO_DAY CASCADE CONSTRAINTS; -- 파노라마 일정 테이블
DROP TABLE YJ_PANO_DAY_REPLY CASCADE CONSTRAINTS; -- 파노라마 일정 댓글 테이블
DROP TABLE YJ_PANO_REPLY CASCADE CONSTRAINTS; -- 파노라마 일정 댓글 테이블
DROP TABLE YJ_PANO_DAY_PHOTO CASCADE CONSTRAINTS; -- 파노라마 일정 사진 테이블
DROP TABLE YJ_BOOKMARK CASCADE CONSTRAINTS; -- 북마크 테이블
DROP TABLE YJ_PLAN CASCADE CONSTRAINTS; -- 플랜 테이블
DROP TABLE YJ_PLAN_COMMENT CASCADE CONSTRAINTS; -- 플랜 댓글 테이블
DROP TABLE YJ_PLAN_DAY CASCADE CONSTRAINTS; -- 
DROP TABLE YJ_PLACE CASCADE CONSTRAINTS; --
DROP TABLE YJ_AREACODE CASCADE CONSTRAINTS; -- 지역코드
DROP TABLE YJ_CATEGORYCODE CASCADE CONSTRAINTS; -- 서비스분류코드
DROP TABLE YJ_PANO_LIKE CASCADE CONSTRAINTS; -- 서비스분류코드
DROP TABLE YJ_TEMP_PHOTO CASCADE CONSTRAINTS; -- 서비스분류코드

--------------------------------------------------------------------------새로생김 
DROP TABLE YJ_PLAN_LIKE CASCADE CONSTRAINTS; -- 일정 좋아요 테이블
----------------------------------------------------------------------------

DROP SEQUENCE MEM_SEQ; -- 회원번호 시퀀스
DROP SEQUENCE PANO_SEQ; -- 파노라마 시퀀스
DROP SEQUENCE PANO_DAY_PHOTO_SEQ; -- 플랜 댓글 시퀀스
DROP SEQUENCE BOOKMARK_SEQ; -- 북마크 시퀀스
DROP SEQUENCE PLAN_SEQ; -- 플랜 시퀀스
DROP SEQUENCE PLAN_COMMENT_SEQ; -- 플랜 댓글 시퀀스
DROP SEQUENCE PLAN_DAY_SEQ; -- 플랜 날짜 시퀀스



--[YJ_MEMBER] 회원
CREATE TABLE YJ_MEMBER (
  MEM_NO NUMBER PRIMARY KEY,
  MEM_EMAIL VARCHAR2(50) NOT NULL,
  MEM_NAME VARCHAR2(50) NOT NULL,
  MEM_PASSWORD VARCHAR2(100) NOT NULL,
  MEM_BIRTH VARCHAR2(8),
  MEM_GENDER CHAR(1),
  MEM_PHOTO VARCHAR2(1000)
);

COMMENT ON TABLE YJ_MEMBER IS '회원정보';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_EMAIL" IS '이메일-기본키';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_NAME" IS '이름';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_PASSWORD" IS '비번';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_BIRTH" IS '생일';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_GENDER" IS '성별';
COMMENT ON COLUMN "HR"."YJ_MEMBER"."MEM_PHOTO" IS '프로필 사진';

CREATE SEQUENCE MEM_SEQ
    START WITH 1
    INCREMENT BY 1
;


--[YJ_MEM_FAVORITE ]  성향

CREATE TABLE YJ_MEM_FAVORITE (
  MEM_NO NUMBER NOT NULL REFERENCES YJ_MEMBER(MEM_NO),
  ACCOM NUMBER DEFAULT 0,
  SHOPPING NUMBER DEFAULT 0,
  RESTAURANTS NUMBER DEFAULT 0,
  NATURE NUMBER DEFAULT 0,
  CULTURE NUMBER DEFAULT 0,
  LEISURE NUMBER DEFAULT 0
);
COMMENT ON TABLE YJ_MEMBER IS '회원 선호도 정보';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."ACCOM" IS '숙박';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."SHOPPING" IS '쇼핑';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."RESTAURANTS" IS '음식';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."NATURE" IS '자연';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."CULTURE" IS '문화';
COMMENT ON COLUMN "HR"."YJ_MEM_FAVORITE"."LEISURE" IS '레져';


--[YJ_PANORAMA] 파노라마

CREATE TABLE YJ_PANORAMA (
  PANO_NO NUMBER PRIMARY KEY,
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_NO),
  PANO_TITLE VARCHAR2(1000) NOT NULL,
  PANO_LIKE NUMBER DEFAULT 0,
  PANO_REGDATE DATE
);
COMMENT ON TABLE YJ_PANORAMA IS '파노라마 테이블';
COMMENT ON COLUMN "HR"."YJ_PANORAMA"."PANO_NO" IS '파노번호';
COMMENT ON COLUMN "HR"."YJ_PANORAMA"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_PANORAMA"."PANO_TITLE" IS '파노제목';
COMMENT ON COLUMN "HR"."YJ_PANORAMA"."PANO_LIKE" IS '좋아요';
COMMENT ON COLUMN "HR"."YJ_PANORAMA"."PANO_REGDATE" IS '등록일';

CREATE SEQUENCE PANO_SEQ
    START WITH 1
    INCREMENT BY 1
;

--[YJ_PANO_DAY] 파노라마 일정

CREATE TABLE YJ_PANO_DAY (
  PANO_NO NUMBER REFERENCES YJ_PANORAMA(PANO_NO),
  PANO_DAY_NO NUMBER PRIMARY KEY,
  PANO_DAY_DATE NUMBER DEFAULT 1,
  PANO_DAY_LOCA VARCHAR2(20),
  PANO_DAY_MEMO VARCHAR2(4000)
);
COMMENT ON TABLE YJ_PANO_DAY IS '파노라마 일정 테이블';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY"."PANO_NO" IS '파노번호';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY"."PANO_DAY_NO" IS '파노데이번호';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY"."PANO_DAY_DATE" IS '몇번째날';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY"."PANO_DAY_LOCA" IS '장소정보-장소';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY"."PANO_DAY_MEMO" IS '장소정보-메모';

CREATE SEQUENCE PANO_DAY
  START WITH 1
  INCREMENT BY 1
;

--[YJ_PANO_DAY_REPLY] 파노라마 일정에 리플

CREATE TABLE YJ_PANO_REPLY (   
   PANO_REPLY_NO NUMBER PRIMARY KEY,
   PANO_NO NUMBER REFERENCES YJ_PANORAMA(PANO_NO), 
   PANO_REPLY_WRITER NUMBER NOT NULL REFERENCES YJ_MEMBER(MEM_NO), 
   PANO_REPLY VARCHAR2(4000), 
   PANO_REPLY_REGDATE DATE
   );
   
   COMMENT ON TABLE YJ_PANO_REPLY IS '파노라마 댓글 테이블';
   COMMENT ON COLUMN "HR"."YJ_PANO_REPLY"."PANO_REPLY_NO" IS '리플번호';
   COMMENT ON COLUMN "HR"."YJ_PANO_REPLY"."PANO_NO" IS '파노번호';
   COMMENT ON COLUMN "HR"."YJ_PANO_REPLY"."PANO_REPLY" IS '파노데이리플';
   COMMENT ON COLUMN "HR"."YJ_PANO_REPLY"."PANO_REPLY_WRITER" IS '작성자 회원 번호';
   COMMENT ON COLUMN "HR"."YJ_PANO_REPLY"."PANO_REPLY_REGDATE" IS '작성일자';

CREATE SEQUENCE PANO_REPLY_SEQ
    START WITH 1
    INCREMENT BY 1
;

--[YJ_PANO_DAY_PHOTO] 파노라마 일정에 사진

CREATE TABLE YJ_PANO_DAY_PHOTO (
  PANO_DAY_PHOTO_NO NUMBER PRIMARY KEY,
  PANO_DAY_NO NUMBER REFERENCES YJ_PANO_DAY(PANO_DAY_NO),
  PANO_DAY_PHOTO VARCHAR2(1000)
);
COMMENT ON TABLE YJ_PANO_DAY_PHOTO IS '파노라마 일정 사진 테이블';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY_PHOTO"."PANO_DAY_PHOTO_NO" IS '파노데이포토번호';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY_PHOTO"."PANO_DAY_NO" IS '파노데이번호';
COMMENT ON COLUMN "HR"."YJ_PANO_DAY_PHOTO"."PANO_DAY_PHOTO" IS '사진정보';
CREATE SEQUENCE PANO_DAY_PHOTO_SEQ
    START WITH 1
    INCREMENT BY 1
;

--[YJ_BOOKMARK] 북마크
CREATE TABLE YJ_BOOKMARK (
    BOOKMARK_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_NO),
    LOCATION_ID VARCHAR2(20) 
);
COMMENT ON TABLE YJ_BOOKMARK IS '북마크 테이블';
COMMENT ON COLUMN "HR"."YJ_BOOKMARK"."BOOKMARK_NO" IS '북마크 번호';
COMMENT ON COLUMN "HR"."YJ_BOOKMARK"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_BOOKMARK"."LOCATION_ID" IS '장소정보 ';
CREATE SEQUENCE BOOKMARK_SEQ
    START WITH 1
    INCREMENT BY 1
;

--[ YJ_PLAN ]

CREATE TABLE YJ_PLAN (
  PLAN_NO NUMBER PRIMARY KEY,
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_no),
  PLAN_TITLE VARCHAR(50) NOT NULL,
  PLAN_TREVEL_CNT NUMBER ,
  PLAN_START_DAY DATE,
  PLAN_FINISH_DAY DATE,
  PLAN_LIKE_CNT NUMBER
);
COMMENT ON TABLE YJ_PLAN IS '플랜 테이블';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_NO" IS '플랜번호';
COMMENT ON COLUMN "HR"."YJ_PLAN"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_TITLE" IS '플랜제목';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_TREVEL_CNT" IS '총여행일수';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_START_DAY" IS '시작일자';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_FINISH_DAY" IS '종료일자';
COMMENT ON COLUMN "HR"."YJ_PLAN"."PLAN_LIKE_CNT" IS '좋아요';
CREATE SEQUENCE PLAN_SEQ
    START WITH 1
    INCREMENT BY 1
;


--[ YJ_PLAN_COMMENT ]

CREATE TABLE YJ_PLAN_COMMENT (
  PLAN_COMMENT_NO NUMBER PRIMARY KEY,
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_no),
  PLAN_CONTENT VARCHAR2(1000),
  PLAN_NO NUMBER REFERENCES YJ_PLAN(PLAN_NO),
  PLAN_COMMENT_DATE DATE
);
COMMENT ON TABLE YJ_PLAN_COMMENT IS '플랜 댓글 테이블';
COMMENT ON COLUMN "HR"."YJ_PLAN_COMMENT"."PLAN_COMMENT_NO" IS '플랜댓글번호';
COMMENT ON COLUMN "HR"."YJ_PLAN_COMMENT"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "HR"."YJ_PLAN_COMMENT"."PLAN_CONTENT" IS '플랜댓글';
COMMENT ON COLUMN "HR"."YJ_PLAN_COMMENT"."PLAN_NO" IS '플랜번호';
COMMENT ON COLUMN "HR"."YJ_PLAN_COMMENT"."PLAN_COMMENT_DATE" IS '플랜댓글날짜';
CREATE SEQUENCE PLAN_COMMENT_SEQ
    START WITH 1
    INCREMENT BY 1
;

--[ YJ_PLAN_DAY ]
CREATE TABLE YJ_PLAN_DAY (
  PLAN_NO NUMBER REFERENCES YJ_PLAN(PLAN_NO),
  PLAN_DAY_NO NUMBER PRIMARY KEY,
  PLAN_DAY_DATE DATE,
  CONTENTID VARCHAR2(50)
);
COMMENT ON TABLE YJ_PLAN_DAY IS '플랜 날짜 테이블';
COMMENT ON COLUMN "HR"."YJ_PLAN_DAY"."PLAN_NO" IS '플랜번호';
COMMENT ON COLUMN "HR"."YJ_PLAN_DAY"."PLAN_DAY_NO" IS '플랜데이번호';
COMMENT ON COLUMN "HR"."YJ_PLAN_DAY"."PLAN_DAY_DATE" IS '플랜데이날짜';
COMMENT ON COLUMN "HR"."YJ_PLAN_DAY"."CONTENTID" IS '장소 아이디';

CREATE SEQUENCE PLAN_DAY_SEQ
    START WITH 1
    INCREMENT BY 1
;

-- 장소 정보
CREATE TABLE YJ_PLACE (
	CONTENTID VARCHAR2(50),
	ADDR1 VARCHAR2(1000),
	ADDR2 VARCHAR2(1000),
	ZIPCODE VARCHAR2(10),
	AREACODE VARCHAR2(50),
	BOOKTOUR VARCHAR2(10),
	CAT1 VARCHAR2(50),
	CAT2 VARCHAR2(50),
	CAT3 VARCHAR2(50),
	CONTENTTYPEID VARCHAR2(1000),
	CREATEDTIME DATE,
	FIRSTIMAGE VARCHAR2(1000),
	FIRSTIMAGE2 VARCHAR2(1000),
	MAPX VARCHAR2(50),
	MAPY VARCHAR2(50),
	MLEVEL VARCHAR2(10),
	MODIFIEDTIME DATE,
	READCOUNT NUMBER,
	SIGUNGUCODE VARCHAR2(50),
	TEL VARCHAR2(1000),
	TELNAME VARCHAR2(300),
	TITLE VARCHAR2(1000),
	HOMEPAGE VARCHAR2(4000),
	EVENTSTARTDATE VARCHAR2(8),
	EVENTENDDATE VARCHAR2(8),
	OVERVIEW CLOB
);

COMMENT ON COLUMN YJ_PLACE.CONTENTID IS '콘텐츠 ID';
COMMENT ON TABLE YJ_PLACE IS '지역기반정보';
COMMENT ON COLUMN YJ_PLACE.ADDR1 IS '주소(예 서울 중구 다동)';
COMMENT ON COLUMN YJ_PLACE.ADDR2 IS '상세주소';
COMMENT ON COLUMN YJ_PLACE.ZIPCODE IS '우편번호';
COMMENT ON COLUMN YJ_PLACE.AREACODE IS '지역코드';
COMMENT ON COLUMN YJ_PLACE.BOOKTOUR IS '교과서 속 여행지 여부(1=여행지, 0=해당없음)';
COMMENT ON COLUMN YJ_PLACE.CAT1 IS '대분류 코드';
COMMENT ON COLUMN YJ_PLACE.CAT2 IS '중분류 코드';
COMMENT ON COLUMN YJ_PLACE.CAT3 IS '소분류 코드';

COMMENT ON COLUMN YJ_PLACE.CONTENTTYPEID IS '관광타입(관광지, 숙박 등) ID';
COMMENT ON COLUMN YJ_PLACE.CREATEDTIME IS '콘텐츠 최초 등록일';
COMMENT ON COLUMN YJ_PLACE.FIRSTIMAGE IS '원본 대표이미지(약 500*333 size) URL 응답';
COMMENT ON COLUMN YJ_PLACE.FIRSTIMAGE2 IS '썸네일 대표이미지(약 150*100 size) URL 응답';
COMMENT ON COLUMN YJ_PLACE.MAPX IS 'GPS X좌표(WGS84 경도 좌표) 응답';
COMMENT ON COLUMN YJ_PLACE.MAPY IS 'GPS Y좌표(WGS84 위도 좌표) 응답';
COMMENT ON COLUMN YJ_PLACE.MLEVEL IS 'Map Level 응답';
COMMENT ON COLUMN YJ_PLACE.MODIFIEDTIME IS '콘텐츠 수정일';
COMMENT ON COLUMN YJ_PLACE.READCOUNT IS '콘텐츠 조회수(korean.visitkorea.or.kr 웹사이트 기준)';
COMMENT ON COLUMN YJ_PLACE.SIGUNGUCODE IS '시군구코드';
COMMENT ON COLUMN YJ_PLACE.TEL IS '전화번호';
COMMENT ON COLUMN YJ_PLACE.TELNAME IS '전화번호명';
COMMENT ON COLUMN YJ_PLACE.TITLE IS '콘텐츠 제목';
COMMENT ON COLUMN YJ_PLACE.HOMEPAGE IS '홈페이지 주소';
COMMENT ON COLUMN YJ_PLACE.EVENTSTARTDATE IS '행사 시작일(형식:YYYYMMDD)';
COMMENT ON COLUMN YJ_PLACE.EVENTENDDATE IS '행사 종료일(형식:YYYYMMDD)';
COMMENT ON COLUMN YJ_PLACE.OVERVIEW IS '개요';


-- 지역코드
CREATE TABLE YJ_AREACODE (
  AREACODE      VARCHAR2(50),
  SIGUNGUCODE	VARCHAR2(50),	
  AREANAME     VARCHAR2(100)      NOT NULL, 
  SIGUNGUNAME     VARCHAR2(100)      NOT NULL, 
  RNUM    NUMBER            NOT NULL
);

COMMENT ON TABLE YJ_AREACODE IS '지역코드';
COMMENT ON COLUMN YJ_AREACODE.AREACODE IS '지역코드';
COMMENT ON COLUMN YJ_AREACODE.SIGUNGUCODE IS '시군구코드';
COMMENT ON COLUMN YJ_AREACODE.NAME IS '지역명';
COMMENT ON COLUMN YJ_AREACODE.NAME IS '시군구명';
COMMENT ON COLUMN YJ_AREACODE.RNUM IS '일련번호';

--ALTER TABLE YJ_AREACODE ADD SIGUNGUNAME VARCHAR2(100);
--ALTER TABLE YJ_AREACODE RENAME COLUMN NAME TO AREANAME;

-- 서비스분류코드
CREATE TABLE YJ_CATEGORYCODE (
	CONTENTTYPEID	varchar2(30),
	CAT1      VARCHAR2(50),
	CAT2      VARCHAR2(50),
	CAT3      VARCHAR2(50),
	CAT1NAME     VARCHAR2(100),
	CAT2NAME     VARCHAR2(100),
	CAT3NAME     VARCHAR2(100),
	RNUM    NUMBER    
);

COMMENT ON TABLE YJ_CATEGORYCODE IS '서비스분류코드';
COMMENT ON COLUMN YJ_CATEGORYCODE.CONTENTTYPEID IS '콘텐츠타입 12:관광지, 14:문화시설, 15:축제/공연/행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT1 IS '대분류코드';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT2 IS '중분류코드';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT3 IS '소분류코드';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT1NAME IS '대분류 코드명';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT2NAME IS '중분류 코드명';
COMMENT ON COLUMN YJ_CATEGORYCODE.CAT3NAME IS '소분류 코드명';
COMMENT ON COLUMN YJ_CATEGORYCODE.RNUM IS '일련번호';

CREATE TABLE YJ_TEMP_PHOTO (
MEM_EMAIL VARCHAR2(50),
PHOTO_NAME VARCHAR2(1000),
PANO_DAY NUMBER
);

COMMENT ON TABLE YJ_TEMP_PHOTO IS '사진임시저장소';
COMMENT ON COLUMN YJ_TEMP_PHOTO.MEM_EMAIL IS '맴버이메일';
COMMENT ON COLUMN YJ_TEMP_PHOTO.PHOTO_NAME IS '사진이름(정보)';
COMMENT ON COLUMN YJ_TEMP_PHOTO.PANO_DAY IS '몇번째날';


--임시저장소에 있는 사진 파일을 파노 포토에 옮기는 작업
CREATE OR REPLACE PROCEDURE pano_save (v_email IN VARCHAR2, v_day IN NUMBER,v_panodayno IN NUMBER)
IS
  CURSOR pano_photo IS
  SELECT MEM_EMAIL,PHOTO_NAME,PANO_DAY  FROM YJ_TEMP_PHOTO WHERE  MEM_EMAIL = v_email AND PANO_DAY = v_day;
BEGIN  

  FOR temp IN pano_photo LOOP 
   DBMS_OUTPUT.PUT_LINE('파일이름 : ' ||temp.PHOTO_NAME);
  INSERT INTO YJ_PANO_DAY_PHOTO (PANO_DAY_NO,PANO_DAY_PHOTO,PANO_DAY_PHOTO_NO) VALUES (v_panodayno,temp.PHOTO_NAME,PANO_DAY_PHOTO_SEQ.nextval);
  END LOOP;

  commit;
END; 

CREATE TABLE PERSISTENT_LOGINS (
    username VARCHAR2(64),
    series VARCHAR2(64),
    token VARCHAR2(64),
    last_used timestamp
);

COMMENT ON TABLE PERSISTENT_LOGINS IS '유저 로그인정보 저장';
COMMENT ON COLUMN PERSISTENT_LOGINS.username IS '유저이름';
COMMENT ON COLUMN PERSISTENT_LOGINS.series IS '시리즈';
COMMENT ON COLUMN PERSISTENT_LOGINS.token IS '토큰';
COMMENT ON COLUMN PERSISTENT_LOGINS.last_used IS '마지막사용시간';

CREATE TABLE YJ_PANO_LIKE (
  MEM_NO NUMBER,
  PANO_NO NUMBER,
  PANO_LIKE VARCHAR2(2)
);
COMMENT ON TABLE YJ_PANO_LIKE IS '파노라마 좋아요 테이블';
COMMENT ON COLUMN YJ_PANO_LIKE.MEM_NO IS '멤버번호';
COMMENT ON COLUMN YJ_PANO_LIKE.PANO_NO IS '파노라마 번호';
COMMENT ON COLUMN YJ_PANO_LIKE.PANO_LIKE IS '좋아요 (-)';

---------------------------------------------------------------------------새로생김 아래

CREATE TABLE YJ_PLAN_LIKE (
  MEM_NO NUMBER,
  PLAN_NO NUMBER
);
COMMENT ON TABLE YJ_PLAN_LIKE IS '일정 좋아요 테이블';
COMMENT ON COLUMN YJ_PLAN_LIKE.MEM_NO IS '멤버번호';
COMMENT ON COLUMN YJ_PLAN_LIKE.PLAN_NO IS '일정 번호';

----------------------------------------------------------------------------