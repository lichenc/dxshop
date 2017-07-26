package com.daxiao.dao;

import java.util.List;

import com.daxiao.bean.MessageBean;
import com.daxiao.bean.MessageSearchBean;


public interface QueryDao {
	public List<MessageBean> selectMenu(MessageSearchBean msb);
	
	public int count(MessageSearchBean msb);
}
