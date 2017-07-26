package com.daxiao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daxiao.bean.MessageBean;
import com.daxiao.daoimpl.UpdateDaoImpl;
import com.sun.istack.internal.logging.Logger;


/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static Logger logger = Logger.getLogger(MessageServlet.class);
    UpdateDaoImpl updateDao = null;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  logger.info("****** start [do Post method]! ******");
		  /*
		   *  对客户端请求重新编码，防止中文乱码
		   */
		  request.setCharacterEncoding("UTF-8"); 
		  MessageBean mb = new MessageBean();
		  mb.setId(request.getParameter("id"));
		  mb.setType(request.getParameter("type"));
		  mb.setUsername(request.getParameter("username"));
		  mb.setColor(request.getParameter("color"));
		  mb.setNum(Integer.parseInt(request.getParameter("num")));
		  mb.setPrice(Integer.parseInt(request.getParameter("price")));
		  mb.setPhone(request.getParameter("phone"));
		  mb.setProvince(request.getParameter("province"));
		  mb.setCity(request.getParameter("city"));
		  mb.setRegion(request.getParameter("region"));
		  mb.setProvince(request.getParameter("province"));
		  mb.setDetailAddress(request.getParameter("detailAddress"));
		  mb.setPayType(request.getParameter("payType"));
		  mb.setLeaveMessage(request.getParameter("leaveMessage"));
		  updateDao = new UpdateDaoImpl();
		  updateDao.insertMenu(mb);
		  logger.info("*****MessageBean:"+mb.toString());
		  
		  System.out.println("*****MessageBean:"+mb.toString());
		  
		  /*response.setContentType("text/html");*/
		 /* PrintWriter out = response.getWriter();
		  out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		  out.println("<HTML>");
		  out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		  out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
		  out.println("  <BODY>");
		  out.print("   订单提交成功！ ");
		  out.println("  </BODY>");
		  out.println("</HTML>");
		  out.flush();
		  out.close();
*/		  request.setAttribute("messageBean", mb);
		  request.getRequestDispatcher("./successful.jsp").forward(request, response);  
	}

}
