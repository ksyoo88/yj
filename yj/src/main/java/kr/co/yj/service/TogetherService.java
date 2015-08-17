package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface TogetherService {

	ArrayList<HashMap<String, String>> getPanoList(int currPage, String order);

	ArrayList<HashMap<String, String>> getPlanList(int currPage, String order);

	int getPanoTotalCnt();

	int getPlanTotalCnt();

}
