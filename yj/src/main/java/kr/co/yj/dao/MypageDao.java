package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.Panorama;

public interface MypageDao {

	int getPanoTotalGroups(int userNo);

	int getPlanTotalGroups(int userNo);

	ArrayList<HashMap<String, String>> getPanoListByPage(HashMap<String, Object> map);

	ArrayList<HashMap<String, String>> getPlanListByPage(HashMap<String, Object> map);

}
