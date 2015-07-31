-- 순서 무작위로 조회해오기
SELECT
	C.CONTENTID, A.AREACODE, A.READCOUNT, B.NAME AREANAME, C.FIRSTIMAGE, C.TITLE
FROM
  	(SELECT AREACODE, MAX(READCOUNT) READCOUNT FROM YJ_PLACE GROUP BY AREACODE) A,
  	(SELECT AREACODE, NAME FROM YJ_AREACODE WHERE SIGUNGUCODE IS NULL) B,
  	YJ_PLACE C
WHERE
	A.AREACODE = B.AREACODE
  	AND A.READCOUNT = C.READCOUNT
ORDER BY DBMS_RANDOM.RANDOM