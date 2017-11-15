﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script language="javascript" type="text/javascript">
        //保存成功的提示信息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="/resources/images/logo.png" alt="logo" class="left"/>
    <a href="#">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="/index" class="index_on"></a></li>
        <li><a href="/role/role_list" class="role_off"></a></li>
        <li><a href="/admin/admin_list" class="admin_off"></a></li>
        <li><a href="/fee/findAllFee" class="fee_off"></a></li>
        <li><a href="/account/account_list" class="account_off"></a></li>
        <li><a href="/service/service_list" class="service_off"></a></li>
        <li><a href="/bill/bill_list" class="bill_off"></a></li>
        <li><a href="/report/report_list" class="report_off"></a></li>
        <li><a href="/user/user_info" class="information_off"></a></li>
        <li><a href="/user/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，数据并发错误！-->
    <form action="/user/user_update" method="post" class="main_form">
        <input type="hidden" name="adminId" value="${admin.adminId}">
        <input type="hidden" name="password" value="${admin.password}"/>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" name="adminCode"
                                       value="${admin.adminCode}"/></div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info">
            <input type="text" readonly="readonly" class="readonly width400" name="role" value="${admin.role}"/>
        </div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" name="name" value="${admin.name}"/>
            <span class="required">*</span>
            <div class="validate_msg_long error_msg">${nameEr.defaultMessage}
                <c:if test="${nameEr ==null || nameEr == ''}">20长度以内的汉字、字母的组合</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="telephone" value="${admin.telephone}"/>
            <div class="validate_msg_medium">${telephoneEr.defaultMessage}
                <c:if test="${telephoneEr ==null || telephoneEr == ''}">电话号码格式：手机或固话</c:if></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="email" value="${admin.email}"/>
            <div class="validate_msg_medium">50长度以内，符合 email 格式</div>
        </div>
        <div class="text_info clearfix"><span>创建时间：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" name="enrolldate"
                                       value="${admin.enrolldate}"/></div>
        <div class="button_info clearfix">
            <input type="submit" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save"/>
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
