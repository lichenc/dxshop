<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Random" %>
<% 
	Random rd = new Random();
	int id = rd.nextInt(1000000000);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.wffahuo-wffahuo *{margin:0;padding:0;border:0;list-style:none;}
	.wffahuo-wffahuo{position:relative;width:undefinedpx;height:undefinedpx;overflow:hidden;font:12px/1.5 Verdana,Geneva,sans-serif;text-align:left;background:#fff;}
	.wffahuo-wffahuo .loading{position:absolute;z-index:128128;width:100%;height:100%;color:#666;text-align:center;padding-top:28.5px;background:#fff url(http://nethd.zhongsou.com/wtimg/i_41956/28236-loading.gif) center 38px no-repeat;}
	.wffahuo-wffahuo .pic{position:relative;width:undefinedpx;height:95px;overflow:hidden;}
	.wffahuo-wffahuo .txt li,.wffahuo-wffahuo .txt li span,.wffahuo-wffahuo .txt-bg{width:undefinedpx;height:defaultpx!important;line-height:defaultpx!important;overflow:hidden;}
	.wffahuo-wffahuo .txt li p a{display:inline;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<title>在线订购 - 128</title>
<script type="text/javascript" src="./js/dxfh.js"></script>
<script type="text/javascript" src="./js/dxgd.js"></script> 
<script type="text/javascript" src="./js/jquery.js"></script>

<script type="text/javascript">wfFocus.set({id:'wffahuo',pattern:'wffahuo',time:3});</script>
<link href="./css/style/wfwap1style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon"type="image/x-icon" href="./resource/images/logo.jpg"media="screen" />
<style type="text/css">
#wforder{width:100%;background:#FFFFFF;}
.wffahuo_wrap{height:200px;}
.wfwarp{border:0px solid #00CC00;}
.wftitle,.wfsubbox input{background:#00CC00;text-align:center;}
.wfsubbox input:hover{background:#3BCC40;}
.wffahuo{background:#FFFFFF;}
.wffahuo ul li{background:#FFFFFF;}

.fahuo {
    width: 100%;
    font-size: 12px;
    line-height: 200%;
    background: #EFEFEF;
    text-align: left;
    /* border-top: 1px solid #DDDDDD; */
}
ul#fahuo li{
	background: #EFEFEF;
}
.mouon {
	padding:0 5px;
	border-radius:5px;
    color: #e30;
    border: 2px #e30 solid;
}
button{
	width:5%;
}
</style>
</head>
<body marginwidth="0" marginheight="0">
<div id="wforder">
    <div class="wfwarp">
        <form id="form" name="form" action="./submit.action" method="post" onsubmit="return verify()" target="_parent">
       
         <input type="hidden" name="price" value="128">                
      	 <input type="hidden" name="id" value="<%=id%>">   
        <div class="wftitle">在线快速订购</div>
        
        <div class="wfbdbox">
        	
            <label class="wfbdxx"><em>*</em>选择产品</label>
        <div class="wfdxbox red">
                <input type="radio" name="type" id="wfproduct0" checked="" alt="128" value="大笑牛皮新款绅士手包  128元" onclick="pricea()"><label for="wfproduct0" class="mouon">大笑牛皮新款绅士手包  128元</label><br> </div>

        </div>
               
                	
        <div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>产品颜色</label>
            <div class="wfdxbox">                        
                <p><input type="radio" name="color" checked="" id="wfproductc0" value="黑色"><label for="wfproductc0">黑色</label></p><p></p>            </div>
        </div>
        	<div class="wfbdbox">
            	<label class="wfbdxx"><em>*</em>数量</label>
            <div class="wftext3box">
                <button type="button" onclick="changePrice(2)"> - </button>  <input type="text" name="num" value="1"  id="num"><button type="button" onclick="changePrice(1)"> + </button>　总价<div id="showprice">128</div>元
            </div>
        </div>
        		        <div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>姓名</label>
            <div class="wftextbox">
                <input type="text" name="username" id="username">
            </div>
        </div>
		        <div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>手机号码</label>
            <div class="wftextbox">
                <input type="text" name="phone" id="phone">
            </div>
        </div>        
		<div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>所在地区</label>
            <div class="wfxlbox " id="show">
                <select id="province" name="province" class="wfdqxl" onchange="changeProvince()">
                	<!-- <option value="">请选择省份</option> -->
                </select>
                <select id="city" name="city" class="wfdqxl"  onchange="changeCity()">
                	<!-- <option value="">请选择城市</option> -->
                </select>
                <select id="region" name="region" class="wfdqxl">
                	<!-- <option value="">请选择区</option> -->
                </select>
                
            </div>
        </div>
         <div class="wfbdbox">
			<div>
			<!-- <select id="s_province" name="province"></select>  
		    <select id="s_city" name="city" ></select>  
		    <select id="s_county" name="county"></select> -->
		    <script class="resources library" src="./js/area.js" type="text/javascript"></script>
		    
		    <script type="text/javascript">_init_area();</script>
		    </div>
		    <div id="show"></div>
		</div>
		<div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>详细地址</label>
            <div class="wftextbox">
                <input type="text" name="detailAddress" id="detailAddress">
            </div>
        </div>
		<div class="wfbdbox">
            <label class="wfbdxx"><em>*</em>付款方式</label>
            <div class="wfdxbox">
                    <span class="paybr"><input type="radio" name="payType" id="wfpay1" checked="" value="货到付款" onclick=""><label for="wfpay1"><img src="./resource/images/pay.gif" disabled=""></label></span>
            </div>
        </div>
        <div class="wfbdbox">
            <label class="wfbdxx">客户留言</label>
            <div class="wftext2box">
                <textarea name="leaveMessage" onfocus="if(value=='请尽快安排发货，送货之前手机联系，谢谢！'){value=''}" onblur="if (value ==''){value='请尽快安排发货，送货之前手机联系，谢谢！'}">请尽快安排发货，送货之前手机联系，谢谢！</textarea>
            </div>
        </div>
        <div class="wfsubbox">
            <input type="button" name="wfsubmit" onclick="verify()" value="立即提交订单">
        </div>
        </form>
        
        <div style="height:10px;clear:both;mrigin-top:10px;">
        </div>
        <div class="wffahuo_wrap fahuo" >
            	<div  class="wffahuo wffahuo-wffahuo fahuo">
           			 <ul class="wffhlist fahuo" id="fahuo" style="margin-top: 0px;"><li style="opacity: 1;"><span>2017-07-16</span><span>四川的唐*</span><span>［159****7291］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-15</span><span>西藏的彭**</span><span>［137****8943］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>宁夏的贾*</span><span>［185****5959］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-15</span><span>山西的于**</span><span>［130****36128］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>吉林的陈**</span><span>［134****4506］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-15</span><span>浙江的高**</span><span>［181****2313］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-16</span><span>湖北的林**</span><span>［187****1678］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-14</span><span>广东的孙*</span><span>［147****4955］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-14</span><span>新疆的唐*</span><span>［184****5800］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>江苏的胡**</span><span>［178****8309］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-14</span><span>上海的郭*</span><span>［187****4534］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-14</span><span>四川的周*</span><span>［178****4533］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-15</span><span>广东的薛**</span><span>［135****8730］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>上海的吴**</span><span>［188****1126］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-14</span><span>广西的阎**</span><span>［137****4135］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>贵州的吴**</span><span>［133****5393］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-16</span><span>西藏的韩*</span><span>［138****4195］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-16</span><span>辽宁的苏**</span><span>［138****1222］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-16</span><span>北京的许**</span><span>［151****9467］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li style="opacity: 1;"><span>2017-07-15</span><span>江西的许**</span><span>［181****12832］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li><li class="ybg" style="opacity: 1;"><span>2017-07-16</span><span>四川的朱*</span><span>［155****7044］</span><br>您订购的 <font class="green">大笑牛皮新款绅士手包  128元</font> 已发货！</li>
                  	</ul>
        		</div>
        	</div>
        </div>
        
       
</div>
<script type="text/javascript" src="./js/area.js"></script>
<script type="text/javascript">
	
	function changePrice(flag)
	{
		if(document.getElementById("num").value == 5 && flag == "1")
		{
			alert("一次购买超过5个请咨询客服");
		}
		if(flag == "1" && document.getElementById("num").value < 5)
		{
			
			var num = document.getElementById("num").value;
			
			var sum = parseInt(num)+1;
			document.getElementById("num").value = sum;
			document.getElementById("showprice").innerHTML = sum * 128;
		}
		if(flag == "2" && document.getElementById("num").value > 1)
		{
			var num1 = document.getElementById("num").value;
			var sum1 = parseInt(num1)-1;
			document.getElementById("num").value = sum1;
			document.getElementById("showprice").innerHTML = sum1 * 128;
		}
		
	}
	
	function verify(){
		var name =document.getElementById("username");
		var phone = document.getElementById("phone");
		var province = document.getElementById("province");
		var city = document.getElementById("city");
		var region = document.getElementById("region");
		var detailAddress = document.getElementById("detailAddress");
		if(trim(name.value) == null || trim(name.value) == "")
		{
			 alert("请输入用户名");
			 name.focus();
			 return false;
		}
		
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	    if(!myreg.test(phone.value)) 
	    { 
	      alert('请输入有效的手机号码！'); 
	      phone.value ="";
	      phone.focus(); 
	      return false; 
	    } 
		
	    if(trim(province.value) == "")
	    {
	    	 alert('请选择省份！'); 
	    	 return false;
	    }else if(trim(city.value) ==""){
	    	alert('请选择城市或者县！'); 
	    	return false;
	    }
	    
	    if(trim(detailAddress.value)==null||trim(detailAddress.value)==""){
	    	alert('请输入详细地址！');
	    	return false;
	    }
	    
	    document.form.submit();
	}
	
	function trim(str)
	{
		return str.trim();
	}
	
	//addressInit('province', 'city', 'region', '', '', '');
	
	var Gid  = document.getElementById ;
	var showArea = function(){
	Gid('show').innerHTML = "<h3>省" + Gid('province').value + " - 市" + 	
	Gid('city').value + " - 县/区" + 
	Gid('region').value + "</h3>"
							}
	Gid('region').setAttribute('onchange','showArea()');

</script>
</body></html>