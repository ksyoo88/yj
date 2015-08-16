package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface TogetherDao {

	ArrayList<HashMap<String, String>> getPanoList(HashMap<String, Object> map);

	ArrayList<HashMap<String, String>> getPlanList(HashMap<String, Object> map);

	int getPanoTotalCnt();

	int getPlanTotalCnt();

}
