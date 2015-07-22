--[YJ_MEMBER] 회원

CREATE TABLE YJ_MEMBER (
  MEM_NO NUMBER PRIMARY KEY,
  MEM_EMAIL VARCHAR2(50) NOT NULL,
  MEM_NAME VARCHAR2(50) NOT NULL,
  MEM_PASSWORD VARCHAR2(100) NOT NULL,
  MEM_BIRTH VARCHAR2(8) ,
  MEM_GENDER VARCHAR2(2)
);


--[YJ_MEM_FAVORITE ]  성향

CREATE TABLE YJ_MEM_FAVORITE (
  MEM_NO NUMBER NOT NULL REFERENCES YJ_MEMBER(MEM_NO),
  ACCOM NUMBER DEFAULT 0,
  SHOPPING NUMBER DEFAULT 0,
  Restaurants NUMBER DEFAULT 0,
  Nature NUMBER DEFAULT 0,
  Culture NUMBER DEFAULT 0,
  Leisure NUMBER DEFAULT 0
);

--[YJ_PANORAMA] 파노라마

CREATE TABLE YJ_PANORAMA (
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_NO),
  PANO_NO NUMBER PRIMARY KEY,
  PANO_TITLE VARCHAR2(50) not NULL,
  PANO_LIKE NUMBER DEFAULT 0,
  PANO_REGDATE DATE
);

--[YJ_PANO_DAY] 파노라마 일정

CREATE TABLE YJ_PANO_DAY (
  PANO_NO NUMBER REFERENCES YJ_PANORAMA(PANO_NO),
  PANO_DAY_NO NUMBER PRIMARY KEY,
  PANO_DAY_DATE numBER deFAULT 1,
  PANO_DAY_LOCA VARCHAR2(20)
);

--[YJ_PANO_DAY_REPLY] 파노라마 일정에 리플

CREATE TABLE YJ_PANO_DAY_REPLY (
 PONO_NO NUMBER REFERENCES YJ_PANORAMA(PANO_NO),
 PANO_DAY_NO NUMBER REFERENCES YJ_PANO_DAY(PANO_DAY_NO),
 YJ_PANO_DAY_REPLY VARCHAR2(100)
);

--[YJ_PANO_DAY_PHOTO] 파노라마 일정에 사진

CREATE TABLE YJ_PANO_DAY_PHOTO (
  PONO_NO NUMBER REFERENCES YJ_PANORAMA(PANO_NO),
  PANO_DAY_NO NUMBER REFERENCES YJ_PANO_DAY(PANO_DAY_NO),
  PANO_DAY_PHOTO VARCHAR2(20)
);

--[YJ_BOOKMARK] 북마크

CREATE TABLE YJ_BOOKMARK (
    
    BOOKMARK_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_NO),
    LOCATION_ID VARCHAR2(20) 
);

--[ YJ_PLAN ]

PLAN_NO : NUMBER primary key seq.nextVal not null
PALN_WRITER 
PLAN_TITLE : VARCHAR(50) title String not null
PLAN_TREVEL_CNT 여행총날짜 : NUMBER 1>PLAN_TREVEL_CNT
PLAN_START_DAY : DATE 2015 7 23 not null
PLAN_STOP_DAY : DATE 2015 7 25 not null
PLAN_LIKE_CNT 좋아요
PLAN_CNT 조회수
PLAN_DAY_NO 외래키 forienKEY not null;

CREATE TABLE YJ_PLAN (
  PLAN_NO NUMBER PRIMARY KEY,
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_no),
  PLAN_TITLE VARCHAR(50) NOT NULL,
  PLAN_TREVEL_CNT NUMBER ,
  PLAN_START_DAY DATE,
  PLAN_FINISH_DAY DATE,
  PLAN_LIKE_CNT NUMBER
);



--[ YJ_PLAN_COMMENT ]

PLAN_COMMENT_NO primaryKey
PLAN_WRITER 
PLAN_CONENT
PLAN_NO forienkey;

CREATE TABLE YJ_PLAN_COMMENT (
  PLAN_COMMENT_NO NUMBER PRIMARY KEY,
  MEM_NO NUMBER REFERENCES YJ_MEMBER(MEM_no),
  PLAN_CONENT VARCHAR2(1000),
  PLAN_NO NUMBER REFERENCES YJ_PLAN(PLAN_NO)
);

CREATE TABLE YJ_PLAN_DAY (
  PLAN_NO NUMBER REFERENCES YJ_PLAN(PLAN_NO),
  PLAN_DAY_NO NUMBER PRIMARY KEY,
  PLAN_DAY_DATE DATE
);

--[ YJ_PLAN_DAY ]

PLAN_DAY_NO : NUMBER primaryKEY seq
PLAN_DAY_DATE : DATE 2015 7 23 
PLAN_PLACE_NO 외래키 forienKEY;

CREATE TABLE YJ_PLAN_PLACE (
  YJ_PLAN_PLACE NUMBER PRIMARY KEY,
  PLAN_DAY_NO NUMBER REFERENCES YJ_PLAN_DAY(PLAN_DAY_NO),
  CONTENTID VARCHAR2(50) 
);

--[ YJ_PLAN_PLACE ]
CREATE TABLE "HR"."YJ_PLAN_PLACE" 
   (
   "PLAN_PLACE_NO" NUMBER primary key, 
   "PLAN_DAY_NO" NUMBER, 
   "CONTENTID" VARCHAR2(50 BYTE) 
   );
   
   
-- 지역코드

DROP TABLE YG_PLACE CASCADE CONSTRAINTS;


CREATE TABLE YG_PLACE (
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

COMMENT ON COLUMN YG_PLACE.CONTENTID IS '콘텐츠 ID';
COMMENT ON TABLE YG_PLACE IS '지역기반정보';
COMMENT ON COLUMN YG_PLACE.ADDR1 IS '주소(예 서울 중구 다동)';
COMMENT ON COLUMN YG_PLACE.ADDR2 IS '상세주소';
COMMENT ON COLUMN YG_PLACE.ZIPCODE IS '우편번호';
COMMENT ON COLUMN YG_PLACE.AREACODE IS '지역코드';
COMMENT ON COLUMN YG_PLACE.BOOKTOUR IS '교과서 속 여행지 여부(1=여행지, 0=해당없음)';
COMMENT ON COLUMN YG_PLACE.CAT1 IS '대분류 코드';
COMMENT ON COLUMN YG_PLACE.CAT2 IS '중분류 코드';
COMMENT ON COLUMN YG_PLACE.CAT3 IS '소분류 코드';

COMMENT ON COLUMN YG_PLACE.CONTENTTYPEID IS '관광타입(관광지, 숙박 등) ID';
COMMENT ON COLUMN YG_PLACE.CREATEDTIME IS '콘텐츠 최초 등록일';
COMMENT ON COLUMN YG_PLACE.FIRSTIMAGE IS '원본 대표이미지(약 500*333 size) URL 응답';
COMMENT ON COLUMN YG_PLACE.FIRSTIMAGE2 IS '썸네일 대표이미지(약 150*100 size) URL 응답';
COMMENT ON COLUMN YG_PLACE.MAPX IS 'GPS X좌표(WGS84 경도 좌표) 응답';
COMMENT ON COLUMN YG_PLACE.MAPY IS 'GPS Y좌표(WGS84 위도 좌표) 응답';
COMMENT ON COLUMN YG_PLACE.MLEVEL IS 'Map Level 응답';
COMMENT ON COLUMN YG_PLACE.MODIFIEDTIME IS '콘텐츠 수정일';
COMMENT ON COLUMN YG_PLACE.READCOUNT IS '콘텐츠 조회수(korean.visitkorea.or.kr 웹사이트 기준)';
COMMENT ON COLUMN YG_PLACE.SIGUNGUCODE IS '시군구코드';
COMMENT ON COLUMN YG_PLACE.TEL IS '전화번호';
COMMENT ON COLUMN YG_PLACE.TELNAME IS '전화번호명';
COMMENT ON COLUMN YG_PLACE.TITLE IS '콘텐츠 제목';
COMMENT ON COLUMN YG_PLACE.HOMEPAGE IS '홈페이지 주소';
COMMENT ON COLUMN YG_PLACE.EVENTSTARTDATE IS '행사 시작일(형식:YYYYMMDD)';
COMMENT ON COLUMN YG_PLACE.EVENTENDDATE IS '행사 종료일(형식:YYYYMMDD)';
COMMENT ON COLUMN YG_PLACE.OVERVIEW IS '개요';


-- 지역코드

DROP TABLE YG_AREACODE CASCADE CONSTRAINTS;



CREATE TABLE YG_AREACODE (
  AREACODE      VARCHAR2(50),
  SIGUNGUCODE	VARCHAR2(50),	
  NAME     VARCHAR2(100)      NOT NULL, 
  RNUM    NUMBER            NOT NULL
);

COMMENT ON TABLE YG_AREACODE IS '지역코드';
COMMENT ON COLUMN YG_AREACODE.AREACODE IS '지역코드';
COMMENT ON COLUMN YG_AREACODE.SIGUNGUCODE IS '시군구코드';
COMMENT ON COLUMN YG_AREACODE.NAME IS '지역명 또는 시군구명';
COMMENT ON COLUMN YG_AREACODE.RNUM IS '일련번호';


-- 지역코드

DROP TABLE YG_CATEGORYCODE CASCADE CONSTRAINTS;



CREATE TABLE YG_CATEGORYCODE (
	CONTENTTYPEID	varchar2(30),
	CAT1      VARCHAR2(50),
	CAT2      VARCHAR2(50),
	CAT3      VARCHAR2(50),
	CAT1NAME     VARCHAR2(100),
	CAT2NAME     VARCHAR2(100),
	CAT3NAME     VARCHAR2(100),
	RNUM    NUMBER    
);

COMMENT ON TABLE YG_CATEGORYCODE IS '서비스분류코드';
COMMENT ON COLUMN YG_CATEGORYCODE.CONTENTTYPEID IS '콘텐츠타입 12:관광지, 14:문화시설, 15:축제/공연/행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT1 IS '대분류코드';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT2 IS '중분류코드';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT3 IS '소분류코드';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT1NAME IS '대분류 코드명';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT2NAME IS '중분류 코드명';
COMMENT ON COLUMN YG_CATEGORYCODE.CAT3NAME IS '소분류 코드명';
COMMENT ON COLUMN YG_CATEGORYCODE.RNUM IS '일련번호';

