package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface MypageService {

	int getPanoTotalGroups(int userNo);

	int getPlanTotalGroups(int userNo);

	ArrayList<HashMap<String, String>> getPanoListByPage(int currPage);
	
}
