package com.daxiao.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.daxiao.bean.MessageBean;
import com.daxiao.bean.MessageSearchBean;
import com.daxiao.daoimpl.QueryDaoImpl;
import com.daxiao.daoimpl.UpdateDaoImpl;

/**
 * Servlet implementation class MenuSearchServlet
 */
@WebServlet("/MenuSearchServlet")
public class MenuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取对应的请求参数		
        String method = request.getParameter("method");
        
        System.out.println("start ["+method+"] method!");
        //根据请求参数去调用对应的方法。
        if ("add".equals(method)) {
            add(request, response);

        }else if ("query".equals(method)) {
            query(request, response);
        }else if ("delete".equals(method)) {
            delete(request, response);
        }else if ("update".equals(method)) {
        	update(request, response);
        }else if("foward".equals(method)){
        	System.out.println("foward /WEB-INF/jsp/manager/searchMenu.jsp");
        	request.getRequestDispatcher("/WEB-INF/jsp/manager/searchMenu.jsp").forward(request, response); 
        }
        
        System.out.println("end ["+method+"] method!");
     }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	/*
	 * delete menu
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        System.out.println("delete");

    }

	/*
	 * query menu 
	 */
    private void query(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	/*
		 *  对客户端请求重新编码，防止中文乱码
		 */  	
    	request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
    	
    	String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
    	System.out.println("*****username:"+username);
    	MessageSearchBean msb = new MessageSearchBean();
        msb.setUsername_equ(username);
        msb.setStatus_equ(request.getParameter("status"));
        msb.setCreateTimeBefore(request.getParameter("createTime"));
        
        if(request.getParameter("page")!=null)
        {
        	msb.setNumber(Integer.parseInt(request.getParameter("page"))*10);
        	//msb.setStart((Integer.parseInt(request.getParameter("page"))-1)*10+1);//oracle
        	msb.setStart((Integer.parseInt(request.getParameter("page"))-1)*10);//mysql
        }else{
        	msb.setNumber(1*10);
        	msb.setStart(0);//mysql is 0, and oracle is 1
        }
        
        System.out.println("*****msb:"+msb.toString());
        
        List<MessageBean> mbList = new ArrayList<MessageBean>();
      
        int total = 0;
        QueryDaoImpl queryDaoImpl = new QueryDaoImpl();
        
        /*
         * query by condition
         */
        
        mbList = queryDaoImpl.selectMenu(msb);
    	total = queryDaoImpl.count(msb);
    	
    	/*
    	 * 
    	 */
    	JSONObject jsonObject = new JSONObject();
        jsonObject.put("DataGrid", mbList);
        jsonObject.put("total", total);
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(jsonObject);
        
        System.out.println(jsonArray);
        response.setContentType("text/html;charset=utf-8"); 
        response.setContentType("application/x-json");
        
        try{
        	 PrintWriter out = response.getWriter();
        	 out.println(jsonArray.toString());
             out.flush();
           	 out.close();
        }catch(IOException e)
        {
        	e.printStackTrace();
        }  
        
        /*
        if(username !=null&&username!= ""&&(status == null || status == ""))
        {
        	mb.setUsername(username);
        	mbList = queryDaoImpl.selectMenuByUsername(username);
        	total = queryDaoImpl.count(mb);
        	
        	JSONObject jsonObject = new JSONObject();
            jsonObject.put("DataGrid", mbList);
            jsonObject.put("total", total);
            JSONArray jsonArray = new JSONArray();
            jsonArray.add(jsonObject);
            
            System.out.println(jsonArray);
            response.setContentType("text/html;charset=utf-8"); 
            response.setContentType("application/x-json");
            try{
            	 PrintWriter out = response.getWriter();
            	 out.println(jsonArray.toString());
                 out.flush();
               	 out.close();
            }catch(IOException e)
            {
            	System.out.println("IOException");	
            }        	
        }else if(status != null && status != "" && (username ==null||username == ""))
        {
        	mb.setStatus(status);
        	
        	mbList = queryDaoImpl.selectMenuByStatus(status);
        	
        	total = queryDaoImpl.count(mb);
        	JSONObject jsonObject = new JSONObject();
            jsonObject.put("DataGrid", mbList);
            jsonObject.put("total", total);
            
            JSONArray jsonArray = new JSONArray();
            jsonArray.add(jsonObject);
            
            System.out.println(jsonArray);
            response.setContentType("text/html;charset=utf-8"); 
            response.setContentType("application/x-json");
            try{
            	 PrintWriter out = response.getWriter();
            	 out.println(jsonArray.toString());
                 out.flush();
               	 out.close();
            }catch(IOException e)
            {
            	System.out.println("IOException");	
            }        	
        }else{
        	total  = queryDaoImpl.count(mb);
        	mbList = queryDaoImpl.selectAllMenu();
        	JSONObject jsonObject = new JSONObject();
            jsonObject.put("DataGrid", mbList);
            jsonObject.put("total", total);
            JSONArray jsonArray = new JSONArray();
            jsonArray.add(jsonObject);
            
            System.out.println(jsonArray);
            response.setContentType("text/html;charset=utf-8"); 
            response.setContentType("application/x-json");
            try{
            	 PrintWriter out = response.getWriter();
            	 out.println(jsonArray.toString());
                 out.flush();
               	 out.close();
            }catch(IOException e)
            {
            	System.out.println("IOException");	
            }        	
        }*/
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        System.out.println("add");

    }
    
    private void update(HttpServletRequest request, HttpServletResponse response)
    {
    	System.out.println(" start [update] method! ");
    	
    	UpdateDaoImpl updatedl = new UpdateDaoImpl();
    	String id = request.getParameter("id");
    	
    	System.out.println("*******id"+id);
    	int flag = updatedl.changeStatus(id);
    	JSONObject jsonObject = new JSONObject();
        jsonObject.put("flag", flag);
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(jsonObject);
        
        System.out.println(jsonArray);
        response.setContentType("text/html;charset=utf-8"); 
        response.setContentType("application/x-json");
        try{
        	 PrintWriter out = response.getWriter();
        	 out.println(jsonArray.toString());
             out.flush();
           	 out.close();
        }catch(IOException e)
        {
        	e.printStackTrace();
        }  
    	
        System.out.println(" end [update] method! ");
    }
    
    public static void main(String[] args) {
    	
	}

}
