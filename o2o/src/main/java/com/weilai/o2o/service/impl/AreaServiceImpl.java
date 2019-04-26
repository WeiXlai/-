package com.weilai.o2o.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weilai.o2o.dao.AreaDao;
import com.weilai.o2o.entity.Area;
import com.weilai.o2o.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	AreaDao areaDao;
	
	
	@Override
	public List<Area> getAreaList() {
		// TODO Auto-generated method stub
		return areaDao.queryArea();
	}

}
