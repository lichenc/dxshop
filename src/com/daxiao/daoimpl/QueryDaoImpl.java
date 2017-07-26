package com.daxiao.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;


import com.daxiao.bean.MessageBean;
import com.daxiao.bean.MessageSearchBean;
import com.daxiao.dao.QueryDao;
import com.daxiao.util.JDBCUtil;


public class QueryDaoImpl implements QueryDao {
	private static Logger logger = Logger.getLogger(QueryDaoImpl.class);
	

	/*
	 * 查询全部的订单
	 * @see com.daoxiao.dao.QueryDao#selectAllMenu(om.daoxiao.bean.MessageBean)
	 * 
	 * id number(19,0) not null,
	 * category varchar2(50 char),
	 * color varchar2(64 char),
	 * num number(19,0),
	 * username varchar2(64 char) not null,
	 * phone varchar2(64 char),
     * province varchar2(64 char),
	 * city varchar2(64 char),
	 * region varchar2(64 char),
	 * detail_address varchar2(200 char),
	 * payType varchar2(64 char),
	 * price number(20,0),
	 * leave_message clob,
	 * create_time timestamp,
	 * modify_time timestamp,
	 * status char(1 char),
	 */
	//计算总数
	@Override
	public int count(MessageSearchBean msb){
	    Connection conn = null;
		PreparedStatement psmt = null;
		StringBuilder countSql = new StringBuilder();
		int count  = 0;
		//StringBuilder args = new StringBuilder();
		String sql = "select count(*) from MenuMessage where 1=1 ";
		ArrayList<String> args = new ArrayList<String>();
		
		countSql.append(sql);
		if(msb.getUsername_equ()!=null && !msb.getUsername_equ().equals(""))
		{
			countSql.append("AND ");
			countSql.append("username like ? ");
			args.add( "%"+msb.getUsername_equ()+ "%");
			
		}
		
		if(msb.getStatus_equ()!=null && msb.getStatus_equ()!="")
		{
			countSql.append("AND ");
			countSql.append("status=? ");
			args.add(msb.getStatus_equ());
		}
		if(msb.getCreateTimeBefore()!=null && msb.getCreateTimeBefore()!="")
		{
			//selectSql.append(" and create_time>=to_date(to_char(sysdate-?,'yyyy/mm/dd'),'yyyy/mm/dd')");
			if(Integer.parseInt(msb.getCreateTimeBefore()) == 0)
			{
				countSql.append(" and TO_DAYS( now() ) - TO_DAYS(create_time) = 0 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore())== 1)
			{
				countSql.append(" and TO_DAYS( now() ) - TO_DAYS(create_time) = 1 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 2)
			{
				countSql.append(" and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now()) ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 3)
			{
				countSql.append(" and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now())-1 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 4)
			{
				countSql.append(" and date_format(create_time,'%Y-%m')=date_format(now(),'%Y-%m')  ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 5)
			{
				countSql.append(" and date_format(create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')  ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 6)
			{
				countSql.append(" and create_time between date_sub(now(),interval 6 month) and now() ");
			}
			
			//args.add(msb.getCreateTimeBefore());
		}
		/*if(msb.getCreateTime()!=null)
		{
			countSql.append("AND ");
			countSql.append("create_time=? ");
		}*/
		
		try{
			conn = JDBCUtil.getConnection();
			psmt = conn.prepareStatement(countSql.toString());
			for(int i=0; args!=null && i<args.size();i++)
			{
				psmt.setString(i+1, args.get(i));
			}
			ResultSet rs = psmt.executeQuery();
			while(rs.next())
			{
				count = rs.getInt(1);
			}
			System.out.println("count:"+count);
			return count;
		}catch(SQLException e){
			System.out.println("SQLException");
		}finally{
			if(psmt != null)
			{
				try {
					psmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	
	
	//根据参数来查询
	@Override
	public List<MessageBean> selectMenu(MessageSearchBean msb) {
		System.out.println("start [ selectMenu ] method!");
		
		List<MessageBean> mbList = null;
	    Connection conn = null;
		PreparedStatement psmt = null;
		ArrayList<String> args = new ArrayList<String>();
		//select * from (select a.*,rownum rc from 表名 where rownum<=endrow) a where a.rc>=startrow
		StringBuilder selectSql = new StringBuilder();
		
		//开始值和结束值
		int startrow = msb.getStart();
		int endrow = msb.getNumber();
		
		//查询
		//oracle
		//selectSql.append("select * from(select a.*,rownum as rc from ( select * from MenuMessage where 1=1");
		//mysql
		//select * from MenuMessage where 1=1 and username=chenlichen and status=0 and TO_DAYS( now() ) - TO_DAYS(subscribeTime) = 0  limit 1,10
		selectSql.append("select * from MenuMessage where 1=1");
		if(msb.getUsername_equ()!=null && !msb.getUsername_equ().equals(""))
		{
			selectSql.append(" and username like ? ");
			args.add( "%"+msb.getUsername_equ()+ "%");
		}
		
		if(msb.getStatus_equ()!=null && msb.getStatus_equ()!="")
		{
			selectSql.append(" and status=?");
			args.add(msb.getStatus_equ());
		}
		/*
		 * 0 表示今天
		 * 1表示昨天
		 * 2表示本周
		 * 3表示上周
		 * 4表示当前月份
		 * 5表示上个月
		 * 6表示距离当前六个月的数据
		 */
		if(msb.getCreateTimeBefore()!=null && msb.getCreateTimeBefore()!="")
		{
			//selectSql.append(" and create_time>=to_date(to_char(sysdate-?,'yyyy/mm/dd'),'yyyy/mm/dd')");
			if(Integer.parseInt(msb.getCreateTimeBefore()) == 0)
			{
				selectSql.append(" and TO_DAYS( now() ) - TO_DAYS(create_time) = 0 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore())== 1)
			{
				selectSql.append(" and TO_DAYS( now() ) - TO_DAYS(create_time) = 1 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 2)
			{
				selectSql.append(" and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now()) ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 3)
			{
				selectSql.append(" and YEARWEEK(date_format(create_time,'%Y-%m-%d')) = YEARWEEK(now())-1 ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 4)
			{
				selectSql.append(" and date_format(create_time,'%Y-%m')=date_format(now(),'%Y-%m')  ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 5)
			{
				selectSql.append(" and date_format(create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')  ");
			}else if(Integer.parseInt(msb.getCreateTimeBefore()) == 6)
			{
				selectSql.append(" and create_time between date_sub(now(),interval 6 month) and now() ");
			}
			
			//args.add(msb.getCreateTimeBefore());
		}
		//oracle
		/*selectSql.append(") a");
		selectSql.append(" where rownum<="+endrow);
		selectSql.append(") a where a.rc>=");
		selectSql.append(startrow);*/
		
		//mysql
		selectSql.append(" limit "+startrow+",10");
		System.out.println("selectSql:"+selectSql);
		try{
			//获取连接
			conn = JDBCUtil.getConnection();
			psmt = conn.prepareStatement(selectSql.toString());
			
			for(int i=0; args!=null && i<args.size();i++)
			{
				psmt.setString(i+1, args.get(i));
			}
			//执行
			ResultSet rs = psmt.executeQuery();
			mbList = new ArrayList<MessageBean>();
			MessageBean mb = null;
			
			while(rs.next())
			{
				mb = new MessageBean();
				mb.setId(rs.getString("id"));
				mb.setType(rs.getString("category"));
				mb.setColor(rs.getString("color"));
				mb.setNum(Integer.parseInt(rs.getString("num")));
				mb.setUsername(rs.getString("username"));
				mb.setPhone(rs.getString("phone"));
				mb.setProvince(rs.getString("province"));
				mb.setCity(rs.getString("city"));
				mb.setRegion(rs.getString("region"));
				mb.setDetailAddress(rs.getString("detail_address"));
				mb.setPayType(rs.getString("payType"));
				mb.setPrice(Integer.parseInt(rs.getString("price")));
				mb.setLeaveMessage(rs.getString("leave_message"));
				SimpleDateFormat fmt =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date;
				date = fmt.format(fmt.parse(rs.getString("create_time")));
				mb.setCreateTime(date);
							
				mb.setStatus(rs.getString("status"));
				
				System.out.println("*********mb:"+mb.toString());
				
				mbList.add(mb);
			}
		}catch(SQLException e){
			e.printStackTrace();
		} catch (ParseException e) {
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
			if(conn!=null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println("end [ selectMenu ] method!");
		return mbList;
	}
	
}
