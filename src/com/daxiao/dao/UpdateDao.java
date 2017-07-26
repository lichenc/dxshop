package com.daxiao.dao;

import com.daxiao.bean.MessageBean;

public interface UpdateDao {
	public void insertMenu(MessageBean mb); 
	
	public int changeStatus(String uuid);
}
