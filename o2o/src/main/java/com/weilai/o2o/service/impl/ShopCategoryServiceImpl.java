package com.weilai.o2o.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weilai.o2o.dao.ShopCategoryDao;
import com.weilai.o2o.entity.ShopCategory;
import com.weilai.o2o.service.ShopCategoryService;
@Service
public class ShopCategoryServiceImpl implements ShopCategoryService {
	@Autowired
	ShopCategoryDao shopCategoryDao;
	/**
	 * 根据查询条件列出店铺类别
	 */
	@Override
	public List<ShopCategory> getShopCategory(ShopCategory shopCategoryCondition) {
		// TODO Auto-generated method stub
		return shopCategoryDao.queryShopCategory(shopCategoryCondition);
	}

}
