﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
    </head>
    <body onload="initialYearAndMonth();">
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="/index" class="index_off"></a></li>
                <li><a href="/role_list" class="role_off"></a></li>
                <li><a href="/admin_list" class="admin_off"></a></li>
                <li><a href="/findAllFee" class="fee_off"></a></li>
                <li><a href="/account_list" class="account_off"></a></li>
                <li><a href="/service_list" class="service_off"></a></li>
                <li><a href="/bill_list" class="bill_off"></a></li>
                <li><a href="/report_list" class="report_off"></a></li>
                <li><a href="/user_info" class="information_off"></a></li>
                <li><a href="/user_modi_pwd" class="password_on"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="">
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70">admin1</span></div>                            
                    <div>身份证：<span class="readonly width150">230101111111111111</span></div>
                    <div>姓名：<span class="readonly width70">张三</span></div>
                    <div>计费时间：<span class="readonly width70">2013年8月</span></div>
                    <div>总费用：<span class="readonly width70">34.78</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="location.href='bill_list.jsp';" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width70">账单明细ID</th>
                            <th class="width150">OS 账号</th>
                            <th class="width150">服务器 IP</th>
                            <th class="width70">账务账号ID</th>
                            <th class="width150">时长</th>
                            <th>费用</th>
                            <th class="width150">资费</th>
                            <th class="width50"></th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>openlab1</td>
                            <td>192.168.100.100</td>
                            <td>101</td>
                            <td>1小时3分15秒</td>
                            <td>43.45</td>
                            <td>包 20 小时</td>                          
                            <td><a href="bill_service_detail.jsp" title="业务详单">详单</a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>openlab1</td>
                            <td>192.168.100.20</td>
                            <td>101</td>
                            <td>3分15秒</td>
                            <td>3.45</td>
                            <td>包 20 小时</td>                          
                            <td><a href="bill_service_detail.jsp" title="业务详单">详单</a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>openlab1</td>
                            <td>192.168.0.23</td>
                            <td>101</td>
                            <td>13分15秒</td>
                            <td>13.45</td>
                            <td>包 40 小时</td>                          
                            <td><a href="bill_service_detail.jsp" title="业务详单">详单</a></td>
                        </tr>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)云科技有限公司 </p>
        </div>
    </body>
</html>
