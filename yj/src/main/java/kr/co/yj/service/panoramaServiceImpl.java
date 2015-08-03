package kr.co.yj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.PanoramaDao;

@Service
public class panoramaServiceImpl implements PanoramaService {

	@Autowired
	PanoramaDao dao;
}
