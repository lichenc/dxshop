<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>订单查询页面</title>


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resource/easyDialog/easydialog.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.easyui.min.js"></script>	 	
<%-- <script type="text/javascript"
	src="<%=basePath%>js/easyui-lang-zh_CN.js"></script> --%>
<script type="text/javascript"
	src="<%=basePath%>resource/easyDialog/easydialog.min.js"></script>
<link rel="shortcut icon"type="image/x-icon" href="./resource/images/logo.jpg"media="screen" />
<style type="text/css">
	html,body {
		height: 100%;
	}
	#table
	{
		border:1px solid rgb(224, 236, 255);
		border-collapse: collapse;
	}
	.tr{
		background-color:rgb(224, 236, 255);
		height:30px;
	}
	.tr th{
		border-style:ridge;
	}
	.tr1{
	
	}
	tr.tr1:hover
	{
		background-color:rgb(224, 236, 255);
	}
	
	.th{
		
		text-align:center;
		height:25px;
		border-style:ridge;
	}
	.a{
		background-color:blue;
	}
</style>
</head>

<body class="easyui-layout"">

	<!--< div region="center" border="true" title="center" style="border-left:0px;border-right:0px;overflow:hidden;"> -->	
		
		<div class="easyui-layout" id="subWrap" fit="true" style="width:100%;height:100%;">
			<div region="north" border="true" title="查询条件" split="false" style="height:209px;" data-options="iconCls:'icon-search'">
			<form action="batchDeleteItsmOrderDo" id="deleteIdsForm" >
				<input type="hidden" value="" name="deleteIds" id="deleteIdsInput" />
			</form>
			
			<!-- <h2>ItsmOrder查询</h2> -->
			<form action="#" onsubmit="return load();" id="queryFormId"
				method="post" style="margin-left:20px;margin-top:11px;">
				
				<table cellpadding="1">
					<tr>
						<td>买家名称:</td>
						<td><input class="easyui-textbox" name="username"
							style="width: 250px; height: 26px;">
						</td>
					</tr>
					<tr>
						<td>订单日期:</td>
						<!-- <td><input class="easyui-datetimebox" name="createTimeAfter"
							style="width: 250px; height: 26px;" editable="false"
							editable="false" /></td>
						<td>到</td>
						<td><input class="easyui-datetimebox" name="createTimeBefore"
							style="width: 250px; height: 26px;" editable="false"
							editable="false" /></td> -->
						<td>
							<select class="easyui-combobox" name="createTime"
							style="width: 250px; height: 26px;">
								<option value=''></option>
								<option value='0'>今天</option>
								<option value='1'>昨天</option>
								<option value='2'>本周</option>
								<option value='3'>上周</option>
								<option value='4'>本月</option>
								<option value='5'>上月</option>
								<option value='6'>半年</option>
								
							</select>
						</td>
					</tr>
					<tr>
						<td>数据状态:</td>
						<td>
							<select class="easyui-combobox" name="status"
							style="width: 250px; height: 26px;">
								<option value=''></option>
								<option value='0'>未发货</option>
								<option value='1'>已发货</option>
							</select>
						</td>
					</tr>
		
<!-- 								<tr id="advanced_0"> -->
<!-- 									<td>建立者:</td> -->
<!-- 									<td><input class="easyui-textbox" name="creator_like"  style="width:250px;height:26px;"></td>  -->
<!-- 								</tr> -->
<!-- 								<tr id="advanced_1"> -->
<!-- 									<td>建立时间:从</td> -->
<!-- 									<td><input class="easyui-datetimebox" name="createTimeAfter" style="width:250px;height:26px;" editable="false"  editable="false" /></td> -->
<!-- 									<td>到 </td> -->
<!-- 									<td><input class="easyui-datetimebox" name="createTimeBefore" style="width:250px;height:26px;"  editable="false"  editable="false" /></td> -->
<!-- 								</tr> -->
<!-- 								<tr id="advanced_2"> -->
<!-- 									<td>修改者:</td> -->
<!-- 									<td><input class="easyui-textbox" name="modifier_like"  style="width:250px;height:26px;"></td>  -->
<!-- 								</tr> -->
<!-- 								<tr id="advanced_3"> -->
<!-- 									<td>修改时间:从</td>  -->
<!-- 									<td><input class="easyui-datetimebox" name="modifyTimeAfter" style="width:250px;height:26px;" editable="false"  editable="false" /></td> -->
<!-- 									<td>到</td> -->
<!-- 									<td><input class="easyui-datetimebox" name="modifyTimeBefore" style="width:250px;height:26px;" editable="false"  editable="false" /></td>  -->
<!-- 								</tr> -->
					 <tr>
						<td><button class="easyui-linkbutton" type="button" value="查询"
								onclick="load()" data-options="iconCls:'icon-search'"
								style="width: 80px; height: 25px;">查询</button></td>
					</tr>
				</table>
			</form>
			</div>
			 <div region="center" border="true" title="查询结果" split="true"  data-options="iconCls:'icon-ok'" style="height: 220px;">
				<table width="100%" border="0" cellspacing="2" cellpadding="2" id="table" >
				    <tr class="tr">
				      <th class="th" >编号</th>
				      <th class="th" >用户名</th>
				      <th class="th" >产品类别</th>
				      <th class="th" >颜色</th>
				      <th class="th" >个数</th>
				      <th class="th" >手机</th>
				      <th class="th" >省份</th>
				      <th class="th" >城市</th>
				      <th class="th" >地区</th>
				      <th class="th" >详细地址</th>
				      <th class="th" >产品总价</th>
				      <th class="th" >留言</th>
				      <th class="th" >订单时间</th>
				      <th class="th" >状态</th>
				    </tr>
				</table>
			</div> 
			
   		 </div>
	<!-- </div> -->
<script type="text/javascript">
var pages = 0;
var pages =0;
var total = 0;
function load(){
    $.ajax({
        type:"post",//请求方式
        url:"./search.do?method=query&"+$('form').serialize(),//发送请求地址
        dataType:"json",
        data:{//发送给数据库的数据
        },
        //请求成功后的回调函数有两个参数
        success:function(data,textStatus){
        	
            var objs=eval(data); //解析json对象
            var obj = objs[0];
            var table = $("#table");
            var div = $("#page");
            table.empty();
            table.append('<thead><tr class="tr"><th class="th" >编号</th><th class="th" >订单号</th><th class="th" >用户名</th><th class="th" >产品类别</th>'+
            		'<th class="th" >颜色</th><th class="th" >个数</th><th class="th"  >手机</th>'+
            		'<th class="th" >省份</th><th class="th" >城市</th><th class="th" >地区</th>'+
            		'<th class="th" >详细地址</th><th class="th" >产品总价</th><th class="th">留言</th>'+
            		'<th class="th">订单时间</th><th class="th" >状态</th></tr></thead>');
            
            if(obj==null || obj==""){
                table.append('<tr><td colspan="5" style="text-align: center; color:red">暂无数据！</td></tr>')
                //$("#page").hide();
                return false;
            }
            
            var dataGrid = obj.DataGrid;
             total = obj.total;
             pages =  Math.ceil(total/10);
         
            for(var i=0;i < dataGrid.length; i++){
                var username = dataGrid[i].username;
                var color = dataGrid[i].color;
                var num = dataGrid[i].num;
                var type = dataGrid[i].type;
                var province = dataGrid[i].province;
                var city = dataGrid[i].city;
                var region = dataGrid[i].region;
                var detailAddress = dataGrid[i].detailAddress;
                var price = dataGrid[i].price;
                var leaveMessage = dataGrid[i].leaveMessage;
                var status = dataGrid[i].status;
                var uuid = dataGrid[i].id;
                var createTime = dataGrid[i].createTime;
                if(status == "0")
                {
                	status ="未发货";
                }else{
                	status ="已发货";
                } 
                var phone = dataGrid[i].phone;
                table.append('<thead><tr class="tr1"><td class="th" >'+(i+1)+'</td><td class="th" >'+uuid+'</td><td class="th"  >'+username+'</td>'+
                			 '<td class="th"  >'+type+'</td>'+'<td class="th" >'+color+'</td>'+
                			 '<td class="th" >'+num+'</td>'+'<td class="th" >'+phone+'</td>'+
                			 '<td class="th" >'+province+'</td><td class="th" >'+city+'</td>'+
                			 '<td class="th" >'+region+'</td><td class="th" >'+detailAddress+'</td>'+
                			 '<td class="th" >'+price+'</td><td class="th" >'+leaveMessage+'</td>'+
                			 '<td class="th" >'+createTime+'</td><td class="th"  ><a href="javascript:void(0);" onclick="changeStatus(this)" id="status'+i+'">'+status+'</a></td></tr></thead>')
                
            }
            table.append('<tr><td><span>第<input type=\"text\"/ value="1" id="currentpage" style="width:20px;"></span>页</td><td><span>总共'+pages+'页</span></td><td><span style=""><a href="javascript:void(0);" id="last" onclick="last(this)">上一页</a></span><span><a href="javascript:void(0);" id="next" onclick="next(this)">下一页</a></span></td></tr>')
            page = parseInt(document.getElementById("currentpage").value);
            disable();
            //为鼠标移动添加样式，鼠标所在行变色，鼠标离开行恢复原状
           /*  var tr= document.getElementsByTagName("tr");
            for(i=0;i<tr.length;i++)
            {
            	if(tr[i].className == 'tr1' && (i%2 == 0))
            	{
            		tr[i].style.backgroundColor = "rgb(224, 236, 255)";
            		
            	}
            } */
         	
        }
    });
}
	function changeStatus(e)
	{
		var td =  $(e).parents("tr").children("td:nth-child(2)").text();
		$.ajax({
	        type:"post",//请求方式
	        url:"./search.do?method=update&id="+td,//发送请求地址
	        dataType:"json",
	        data:{//发送给数据库的数据
	        },
	        //请求成功后的回调函数有两个参数
	        success:function(data,textStatus){
	        	 var objs=eval(data); //解析json对象
	             var obj = objs[0];
	        	 var flag = obj.flag;
	        	 if(flag == 1)
	        	 {
	        		 document.getElementById(e.id).innerHTML = "已发货";
	        		 alert("已发货");
	        	 }else{
	        		 alert("系统故障");
	        	 }
	        }
	     });
	}
	function next(e)
	{
	    page = parseInt(document.getElementById("currentpage").value);

		$.ajax({
	        type:"post",//请求方式
	        url:"./search.do?method=query&"+$('form').serialize()+"&page="+(page+1),//发送请求地址
	        dataType:"json",
	        data:{//发送给数据库的数据
	        },
	        //请求成功后的回调函数有两个参数
	        success:function(data,textStatus){
	        	
	            var objs=eval(data); //解析json对象
	            var obj = objs[0];
	            var table = $("#table");
	            var div = $("#page");
	            var startPage = (page)*10;
	            table.empty();
	            table.append('<thead><tr class="tr"><th class="th" >编号</th><th class="th" >订单号</th><th class="th" >用户名</th><th class="th" >产品类别</th>'+
	            		'<th class="th" >颜色</th><th class="th" >个数</th><th class="th"  >手机</th>'+
	            		'<th class="th" >省份</th><th class="th" >城市</th><th class="th" >地区</th>'+
	            		'<th class="th" >详细地址</th><th class="th" >产品总价</th><th class="th">留言</th>'+
	            		'<th class="th">订单时间</th><th class="th" >状态</th></tr></thead>');
	            
	            if(obj==null || obj==""){
	                table.append('<tr><td colspan="5" style="text-align: center; color:red">暂无数据！</td></tr>')
	                //$("#page").hide();
	                return false;
	            }
	            
	            var dataGrid = obj.DataGrid;
	            total = obj.total;
	            pages =  Math.ceil(total/10);
	            for(var i=0;i < dataGrid.length; i++){
	                var username = dataGrid[i].username;
	                var color = dataGrid[i].color;
	                var num = dataGrid[i].num;
	                var type = dataGrid[i].type;
	                var province = dataGrid[i].province;
	                var city = dataGrid[i].city;
	                var region = dataGrid[i].region;
	                var detailAddress = dataGrid[i].detailAddress;
	                var price = dataGrid[i].price;
	                var leaveMessage = dataGrid[i].leaveMessage;
	                var status = dataGrid[i].status;
	                var uuid = dataGrid[i].id;
	                var createTime = dataGrid[i].createTime;
	                if(status == "0")
	                {
	                	status ="未发货";
	                }else{
	                	status ="已发货";
	                } 
	                var phone = dataGrid[i].phone;
	                table.append('<thead><tr class="tr1"><td class="th" >'+(i+1+startPage)+'</td><td class="th" >'+uuid+'</td><td class="th"  >'+username+'</td>'+
	                			 '<td class="th"  >'+type+'</td>'+'<td class="th" >'+color+'</td>'+
	                			 '<td class="th" >'+num+'</td>'+'<td class="th" >'+phone+'</td>'+
	                			 '<td class="th" >'+province+'</td><td class="th" >'+city+'</td>'+
	                			 '<td class="th" >'+region+'</td><td class="th" >'+detailAddress+'</td>'+
	                			 '<td class="th" >'+price+'</td><td class="th" >'+leaveMessage+'</td>'+
	                			 '<td class="th" >'+createTime+'</td><td class="th"  ><a href="javascript:void(0);" onclick="changeStatus(this)" id="status'+i+'">'+status+'</a></td></tr></thead>')
	                
	            }
	            table.append('<tr><td><span>第<input type=\"text\"/ value="'+(parseInt(page)+1)+'"  id="currentpage" style="width:20px; "></span>页</td><td><span>总共'+pages+'页</span></td><td><span style=""><a href="javascript:void(0);" id="last" onclick="last()">上一页</a></span><span><a href="javascript:void();" id="next" onclick="next()">下一页</a></span></td></tr>')
	             nextDisable(page,pages);
	            //为鼠标移动添加样式，鼠标所在行变色，鼠标离开行恢复原状
	           /*  var tr= document.getElementsByTagName("tr");
	            for(i=0;i<tr.length;i++)
	            {
	            	if(tr[i].className == 'tr1' && (i%2 == 0))
	            	{
	            		tr[i].style.backgroundColor = "rgb(224, 236, 255)";
	            		
	            	}
	            } */
	         	
	        }
		 });
	}
	function last(e)
	{
		var page = parseInt(document.getElementById("currentpage").value);
		$.ajax({
	        type:"post",//请求方式
	        url:"./search.do?method=query&"+$('form').serialize()+"&page="+(page-1),//发送请求地址
	        dataType:"json",
	        data:{//发送给数据库的数据
	        },
	        //请求成功后的回调函数有两个参数
	        success:function(data,textStatus){
	        	
	            var objs=eval(data); //解析json对象
	            var obj = objs[0];
	            var table = $("#table");
	            var div = $("#page");
	            var startPage = (page-2)*10;
	            table.empty();
	            table.append('<thead><tr class="tr"><th class="th" >编号</th><th class="th" >订单号</th><th class="th" >用户名</th><th class="th" >产品类别</th>'+
	            		'<th class="th" >颜色</th><th class="th" >个数</th><th class="th"  >手机</th>'+
	            		'<th class="th" >省份</th><th class="th" >城市</th><th class="th" >地区</th>'+
	            		'<th class="th" >详细地址</th><th class="th" >产品总价</th><th class="th">留言</th>'+
	            		'<th class="th">订单时间</th><th class="th" >状态</th></tr></thead>');
	            
	            if(obj==null || obj==""){
	                table.append('<tr><td colspan="5" style="text-align: center; color:red">暂无数据！</td></tr>')
	                //$("#page").hide();
	                return false;
	            }
	            
	            var dataGrid = obj.DataGrid;
	            total = obj.total;
	            pages =  Math.ceil(total/10);
	          
	            for(var i=0;i < dataGrid.length; i++){
	                var username = dataGrid[i].username;
	                var color = dataGrid[i].color;
	                var num = dataGrid[i].num;
	                var type = dataGrid[i].type;
	                var province = dataGrid[i].province;
	                var city = dataGrid[i].city;
	                var region = dataGrid[i].region;
	                var detailAddress = dataGrid[i].detailAddress;
	                var price = dataGrid[i].price;
	                var leaveMessage = dataGrid[i].leaveMessage;
	                var status = dataGrid[i].status;
	                var createTime = dataGrid[i].createTime;
	                var uuid = dataGrid[i].id;
	                if(status == "0")
	                {
	                	status ="未发货";
	                }else{
	                	status ="已发货";
	                } 
	                var phone = dataGrid[i].phone;
	                table.append('<thead><tr class="tr1"><td class="th" >'+(i+1+startPage)+'</td><td class="th"  >'+uuid+'</td><td class="th"  >'+username+'</td>'+
	                			 '<td class="th"  >'+type+'</td>'+'<td class="th" >'+color+'</td>'+
	                			 '<td class="th" >'+num+'</td>'+'<td class="th" >'+phone+'</td>'+
	                			 '<td class="th" >'+province+'</td><td class="th" >'+city+'</td>'+
	                			 '<td class="th" >'+region+'</td><td class="th" >'+detailAddress+'</td>'+
	                			 '<td class="th" >'+price+'</td><td class="th" >'+leaveMessage+'</td>'+
	                			 '<td class="th" >'+createTime+'</td><td class="th"  ><a href="javascript:void(0);" onclick="changeStatus(this)" id="status'+i+'">'+status+'</a></td></tr></thead>')
	                
	            }
	            table.append('<tr><td><span>第<input type=\"text\"/ value="'+(parseInt(page)-1)+'"  id="currentpage" style="width:20px; "></span>页</td><td><span>总共'+pages+'页</span></td><td><span style=""><a href="javascript:void(0);" id="last" onclick="last()">上一页</a></span><span><a href="javascript:void();" id="next" onclick="next()">下一页</a></span></td></tr>')
	          	 disable();
	            //为鼠标移动添加样式，鼠标所在行变色，鼠标离开行恢复原状
	           /*  var tr= document.getElementsByTagName("tr");
	            for(i=0;i<tr.length;i++)
	            {
	            	if(tr[i].className == 'tr1' && (i%2 == 0))
	            	{
	            		tr[i].style.backgroundColor = "rgb(224, 236, 255)";
	            		
	            	}
	            } */
	         	
	        }
		 });
		
	}
	
		
	function disable(){
		var alast = document.getElementById("last");
		if(page == 1)
		{
			alast.setAttribute('disabled',"true");
			alast.setAttribute("onclick","");
		}
		
	}
	function nextDisable(page,total)
	{
		if(page == pages)
		{		
			anext.setAttribute('disabled',"true");
			alast.setAttribute("onclick","");
		}
	}
	</script>
</body>
</html>