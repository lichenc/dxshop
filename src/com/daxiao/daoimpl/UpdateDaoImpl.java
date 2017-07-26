package com.daxiao.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import com.daxiao.bean.MessageBean;
import com.daxiao.dao.UpdateDao;
import com.daxiao.util.JDBCUtil;

public class UpdateDaoImpl implements UpdateDao {
	
	private static Logger logger = Logger.getLogger(UpdateDaoImpl.class);
	Connection conn = null ;
	PreparedStatement psmt = null;
	
	@Override
	public void insertMenu(MessageBean mb) {
		
		/*
		 * id number(19,0) not null,
			category varchar2(50 char),
			color varchar2(64 char),
			num number(19,0),
			username varchar2(64 char) not null,
			phone varchar2(64 char),
			province varchar2(64 char),
			city varchar2(64 char),
			region varchar2(64 char),
			detail_address varchar2(200 char),
			payType varchar2(64 char),
			price number(20,0),
			leave_message clob,
			create_time timestamp,
			modify_time timestamp,
			status char(1 char),
		 */
		
		String sql = "INSERT INTO MenuMessage(id,category,color," +
					 "num,username,phone,province,city,region," +
					 "detail_address,payType,price,leave_message," +
					 "create_time,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";//CURRENT_DATE
		
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		System.out.println(dateString);
		try {
			conn = JDBCUtil.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,mb.getId());
			psmt.setString(2, mb.getType());
			psmt.setString(3, mb.getColor());
			psmt.setInt(4, mb.getNum());
			psmt.setString(5,mb.getUsername());
			psmt.setString(6, mb.getPhone());
			psmt.setString(7, mb.getProvince());
			psmt.setString(8, mb.getCity());
			psmt.setString(9, mb.getRegion());
			psmt.setString(10, mb.getDetailAddress());
			psmt.setString(11, mb.getPayType());
			psmt.setInt(12, mb.getPrice() * mb.getNum());
			psmt.setString(13, mb.getLeaveMessage());
			psmt.setString(14,dateString );
			psmt.setString(15, "0");
			psmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(psmt != null)
			{
				try {
					psmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
	
	}

	@Override
	public int changeStatus(String uuid) {
		String sql = "update MenuMessage set status=1 where id=? ";
		try{
			conn = JDBCUtil.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uuid);
			int i = psmt.executeUpdate();
			return i;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(psmt != null)
			{
				try {
					psmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
		return 0;
	}
}
