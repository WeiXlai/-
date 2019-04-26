package com.weilai.o2o.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weilai.o2o.dao.HeadLineDao;
import com.weilai.o2o.entity.HeadLine;
import com.weilai.o2o.service.HeadLineService;

@Service
public class HeadLineServiceImpl implements HeadLineService {
	@Autowired
	HeadLineDao headLineDao;
	
	/**
	 * 通过头条的一些条件查询头条列表
	 */
	@Override
	public List<HeadLine> getHeadLineList(HeadLine headLineCondition) {
		List<HeadLine> headLineList = headLineDao.queryHeadLineList(headLineCondition);
		
		return headLineList;
	}

}
