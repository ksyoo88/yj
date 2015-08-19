DROP TABLE yj_areacode;
DROP TABLE yj_bookmark;
DROP TABLE yj_categorycode;
DROP TABLE yj_mem_favorite;
DROP TABLE yj_member;
DROP TABLE yj_pano_day;
DROP TABLE yj_pano_day_photo;
DROP TABLE yj_pano_like;
DROP TABLE yj_pano_reply;
DROP TABLE yj_panorama;
DROP TABLE yj_place;
DROP TABLE yj_plan;
DROP TABLE yj_plan_comment;
DROP TABLE yj_plan_day;
DROP TABLE yj_plan_place;
DROP TABLE yj_temp_photo;


CREATE TABLE YJ_PLAN
(
   PLAN_NO INT primary key auto_increment   COMMENT '플랜번호',
   MEM_NO INT    COMMENT '회원번호',
   PLAN_TITLE VARCHAR(50) NOT NULL   COMMENT '플랜제목',
   PLAN_TREVEL_CNT INT    COMMENT '총여행일수',
   PLAN_START_DAY DATETIME    COMMENT '시작일자',
   PLAN_FINISH_DAY DATETIME    COMMENT '종료일자',
   PLAN_LIKE_CNT INT    COMMENT '좋아요'
)  COMMENT = '플랜 테이블';


CREATE TABLE YJ_PLAN_COMMENT
(
   PLAN_COMMENT_NO INT primary key auto_increment   COMMENT '플랜댓글번호',
   MEM_NO INT    COMMENT '회원번호',
   PLAN_CONTENT VARCHAR(1000)    COMMENT '플랜댓글',
   PLAN_NO INT    COMMENT '플랜번호',
   PLAN_COMMENT_DATE DATETIME    COMMENT '플랜댓글날짜'
)  COMMENT = '플랜 댓글 테이블';


CREATE TABLE YJ_PANO_REPLY
(
   PANO_REPLY_NO INT primary key auto_increment   COMMENT '리플번호',
   PANO_NO INT    COMMENT '파노번호',
   PANO_REPLY_WRITER INT NOT NULL   COMMENT '작성자 회원 번호',
   PANO_REPLY VARCHAR(4000)    COMMENT '파노데이리플',
   PANO_REPLY_REGDATE DATETIME    COMMENT '작성일자'
)  COMMENT = '파노라마 댓글 테이블';


CREATE TABLE YJ_BOOKMARK
(
   BOOKMARK_NO INT primary key auto_increment   COMMENT '북마크 번호',
   MEM_NO INT    COMMENT '회원번호',
   LOCATION_ID VARCHAR(20)    COMMENT '장소정보 '
)  COMMENT = '북마크 테이블';


CREATE TABLE YJ_PLAN_DAY
(
   PLAN_NO INT    COMMENT '플랜번호',
   PLAN_DAY_NO INT primary key auto_increment   COMMENT '플랜데이번호',
   PLAN_DAY_DATE DATETIME    COMMENT '플랜데이날짜',
   CONTENTID VARCHAR(50)    COMMENT '장소 아이디'
)  COMMENT = '플랜 날짜 테이블';


CREATE TABLE YJ_MEM_FAVORITE
(
   MEM_NO INT NOT NULL   COMMENT '회원번호',
   ACCOM INT   DEFAULT 0   COMMENT '숙박',
   SHOPPING INT   DEFAULT 0   COMMENT '쇼핑',
   RESTAURANTS INT   DEFAULT 0   COMMENT '음식',
   NATURE INT   DEFAULT 0   COMMENT '자연',
   CULTURE INT   DEFAULT 0   COMMENT '문화',
   LEISURE INT   DEFAULT 0   COMMENT '레져'
);

CREATE TABLE YJ_AREACODE
(
   AREACODE VARCHAR(50)    COMMENT '지역코드',
   SIGUNGUCODE VARCHAR(50)    COMMENT '시군구코드',
   AREANAME VARCHAR(100) NOT NULL   COMMENT '지역명 또는 시군구명',
   RNUM INT NOT NULL   COMMENT '일련번호',
   SIGUNGUNAME VARCHAR(100)
)  COMMENT = '지역코드';


CREATE TABLE YJ_PLACE
(
   CONTENTID VARCHAR(50)    COMMENT '콘텐츠 ID',
   ADDR1 VARCHAR(1000)    COMMENT '주소(예 서울 중구 다동)',
   ADDR2 VARCHAR(1000)    COMMENT '상세주소',
   ZIPCODE VARCHAR(10)    COMMENT '우편번호',
   AREACODE VARCHAR(50)    COMMENT '지역코드',
   BOOKTOUR VARCHAR(10)    COMMENT '교과서 속 여행지 여부(1=여행지, 0=해당없음)',
   CAT1 VARCHAR(50)    COMMENT '대분류 코드',
   CAT2 VARCHAR(50)    COMMENT '중분류 코드',
   CAT3 VARCHAR(50)    COMMENT '소분류 코드',
   CONTENTTYPEID VARCHAR(1000)    COMMENT '관광타입(관광지, 숙박 등) ID',
   CREATEDTIME varchar(20)    COMMENT '콘텐츠 최초 등록일',
   FIRSTIMAGE VARCHAR(1000)    COMMENT '원본 대표이미지(약 500*333 size) URL 응답',
   FIRSTIMAGE2 VARCHAR(1000)    COMMENT '썸네일 대표이미지(약 150*100 size) URL 응답',
   MAPX VARCHAR(50)    COMMENT 'GPS X좌표(WGS84 경도 좌표) 응답',
   MAPY VARCHAR(50)    COMMENT 'GPS Y좌표(WGS84 위도 좌표) 응답',
   MLEVEL VARCHAR(10)    COMMENT 'Map Level 응답',
   MODIFIEDTIME varchar(20)    COMMENT '콘텐츠 수정일',
   READCOUNT INT(20)    COMMENT '콘텐츠 조회수(korean.visitkorea.or.kr 웹사이트 기준)',
   SIGUNGUCODE VARCHAR(50)    COMMENT '시군구코드',
   TEL VARCHAR(1000)    COMMENT '전화번호',
   TELNAME VARCHAR(300)    COMMENT '전화번호명',
   TITLE VARCHAR(1000)    COMMENT '콘텐츠 제목',
   HOMEPAGE VARCHAR(4000)    COMMENT '홈페이지 주소',
   EVENTSTARTDATE VARCHAR(8)    COMMENT '행사 시작일(형식:YYYYMMDD)',
   EVENTENDDATE VARCHAR(8)    COMMENT '행사 종료일(형식:YYYYMMDD)',
   OVERVIEW LONGTEXT    COMMENT '개요'
)  COMMENT = '지역기반정보';


CREATE TABLE YJ_PANO_LIKE
(
   MEM_NO INT    COMMENT '멤버번호',
   PANO_NO INT    COMMENT '파노라마 번호',
   PANO_LIKE VARCHAR(2)    COMMENT '좋아요 (-)'
)  COMMENT = '파노라마 좋아요 테이블';


CREATE TABLE YJ_PLAN_PLACE
(
   PLAN_PLACE_NO INT PRIMARY KEY   COMMENT '플랜장소번호',
   PLAN_DAY_NO INT    COMMENT '플랜데이번호',
   CONTENTID VARCHAR(50)    COMMENT '장소아이디'
);


CREATE TABLE YJ_CATEGORYCODE
(
   CONTENTTYPEID VARCHAR(30)    COMMENT '콘텐츠타입 12:관광지, 14:문화시설, 15:축제/공연/행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식',
   CAT1 VARCHAR(50)    COMMENT '대분류코드',
   CAT2 VARCHAR(50)    COMMENT '중분류코드',
   CAT3 VARCHAR(50)    COMMENT '소분류코드',
   CAT1NAME VARCHAR(100)    COMMENT '대분류 코드명',
   CAT2NAME VARCHAR(100)    COMMENT '중분류 코드명',
   CAT3NAME VARCHAR(100)    COMMENT '소분류 코드명',
   RNUM INT    COMMENT '일련번호'
)  COMMENT = '서비스분류코드';


CREATE TABLE YJ_PANORAMA
(
   PANO_NO INT primary key auto_increment COMMENT '파노번호',
   MEM_NO INT    COMMENT '회원번호',
   PANO_TITLE VARCHAR(1000) NOT NULL   COMMENT '파노제목',
   PANO_LIKE INT   DEFAULT 0   COMMENT '좋아요',
   PANO_REGDATE DATETIME    COMMENT '등록일'
)  COMMENT = '파노라마 테이블';


CREATE TABLE YJ_MEMBER
(
   MEM_NO INT primary key auto_increment COMMENT '회원번호',
   MEM_EMAIL VARCHAR(50) NOT NULL   COMMENT '이메일-기본키',
   MEM_NAME VARCHAR(50) NOT NULL   COMMENT '이름',
   MEM_PASSWORD VARCHAR(100) NOT NULL   COMMENT '비번',
   MEM_BIRTH VARCHAR(8)    COMMENT '생일',
   MEM_GENDER CHAR(1)    COMMENT '성별',
   MEM_PHOTO VARCHAR(1000)
)  COMMENT = '회원 선호도 정보';

CREATE TABLE YJ_TEMP_PHOTO
(
   MEM_EMAIL VARCHAR(50)    COMMENT '맴버이메일',
   PHOTO_NAME VARCHAR(1000)    COMMENT '사진이름(정보)',
   PANO_DAY INT    COMMENT '몇번째날'
)  COMMENT = '사진임시저장소';


CREATE TABLE YJ_PANO_DAY_PHOTO
(
   PANO_DAY_PHOTO_NO INT primary key auto_increment   COMMENT '파노데이포토번호',
   PANO_DAY_NO INT    COMMENT '파노데이번호',
   PANO_DAY_PHOTO VARCHAR(1000)    COMMENT '사진정보'
)  COMMENT = '파노라마 일정 사진 테이블';


CREATE TABLE YJ_PANO_DAY
(
   PANO_NO INT    COMMENT '파노번호',
   PANO_DAY_NO INT primary key auto_increment   COMMENT '파노데이번호',
   PANO_DAY_DATE INT   DEFAULT 1   COMMENT '몇번째날',
   PANO_DAY_LOCA VARCHAR(20)    COMMENT '장소정보-장소',
   PANO_DAY_MEMO VARCHAR(4000)
)  COMMENT = '파노라마 일정 테이블';

CREATE TABLE PERSISTENT_LOGINS (
    username VARCHAR(64),
    series VARCHAR(64),
    token VARCHAR(64),
    last_used timestamp
);