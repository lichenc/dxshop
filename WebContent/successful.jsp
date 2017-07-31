<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.daxiao.bean.MessageBean"  %>
 <%
	MessageBean mb = (MessageBean)request.getAttribute("messageBean"); 	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,aximum-scale=1.0, 
                                     user-scalable=no">
    <title>订单成功页面</title>
    <link href="./resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon"type="image/x-icon" href="./resource/images/logo.jpg"media="screen" />
    <style type="text/css">
    	#time{
    		color:red;
    		
    	}
    	.header{
    		
    		text-align:center;
    	}
    	.header img{
    		
    	}
    	.content{
    		margin-top:20px;
    		
    	}
    	.content .left{
    		font-size:15px;
    	}
    	
    	.content .right{
    		color:red;
    		font-size:15px;
    	}
    	.footer{
    		
    		margin-top:20px;
    		color:green;
    		padding:0;
    		margin:0;
    	}
    	hr{
    		margin: 10px 0;
    		padding:0;
    	}
    	img{
    		width:auto;max-width:100%;  margin:0 auto; padding:0;
    	}
    	
    </style>
</head>
    <body>    	
		<div class="container">
			<!-- header -->
			<div class="text-center col-xs-12">
				
					<img alt=""  class="img-responsive center-block" src="./resource/images/successful1.png">
			</div>
			
			
			<!-- content -->
			<div class="row content">
				<!--hr -->
			 <div class="col-xs-5 left" style="">
			 		 <p class="text-right">订单号:</p>
					 <p class="text-right">用户名:</p>	
				   	 <p class="text-right">手机:</p>
					 <p class="text-right">收货地址:</p>					
					 <p class="text-right">商品颜色:</p>
					 <p class="text-right">商品数量:</p>
					 <p class="text-right">付款方式:</p>
			   </div>	
			   <div class="col-xs-7 right">
			   		<p class="text-left"><%=mb.getId() %></p>
			   		<p class="text-left"><%=mb.getUsername() %></p>
			   		<p class="text-left"><%=mb.getPhone() %></p>
				   	<p class="text-left"><%=mb.getProvince() %><%=mb.getCity()%><%=mb.getRegion()%><%=mb.getDetailAddress() %></p>
				   	<p class="text-left"><%=mb.getColor() %></p>
				   	<p class="text-left"><%=mb.getNum() %></p>
				   	<p class="text-left"><%=mb.getPayType() %></p>
			   </div> 
			   
		   </div>
		</div>
		
		<!-- footer -->
		<div class="text-center col-xs-12 footer">
				<hr>
			   	<span>温馨提示：本页面将在</span><span id="time"></span><span>秒后自动返回</span><br/>
				<a href="./index.html">返回首页</a>
		</div>
    </body>
    
    <script type="text/javascript" src="./resource/bootstrap/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="./resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	var i=60;
    	document.getElementById("time").innerHTML=i;
    	function changeTime()
    	{
    		i--;
    		document.getElementById("time").innerHTML = i;
    		if(i<=0)
    		{
    			window.location.href='./index.html';
    		}
    	}
    	setInterval(function(){changeTime()},1000);
    </script>
</html>