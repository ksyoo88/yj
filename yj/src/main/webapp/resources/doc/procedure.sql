

--임시저장소에 있는 사진을 저장하면 파노라마에 저장된다.

CREATE OR REPLACE PROCEDURE pano_save (v_email IN VARCHAR2, v_day IN NUMBER,v_panodaynum IN NUMBER)
IS
  CURSOR pano_photo IS
  SELECT MEM_EMAIL,PHOTO_NAME,PANO_DAY  FROM YJ_TEMP_PHOTO WHERE MEM_EMAIL = v_email AND PANO_DAY = v_day;
BEGIN  
  FOR temp IN pano_photo LOOP 
   DBMS_OUTPUT.PUT_LINE('파일이름 : ' ||temp.PHOTO_NAME);
  INSERT INTO YJ_PANO_DAY_PHOTO (PANO_DAY_NO,PANO_DAY_PHOTO,PANO_DAY_PHOTO_NO) VALUES (v_panodaynum,temp.PHOTO_NAME, my_seq.nextval);
  END LOOP;

  commit;
END; 