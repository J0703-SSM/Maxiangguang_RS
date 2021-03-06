﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
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
    <img src="../images/logo.png" alt="logo" class="left"/>
    <a href="${pageContext.request.contextPath}/exit">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="${pageContext.request.contextPath}/index" class="index_on"></a></li>
        <c:forEach items="${applicationScope.admin.roleList}" var="role">
            <c:forEach items="${role.privilegeList}" var="privilege">
                <c:if test="${privilege.privilegeId eq 1}">
                    <li><a href="${pageContext.request.contextPath}/role/role_list" class="role_off"></a></li>

                </c:if>
                <c:if test="${privilege.privilegeId eq 2}">
                    <li><a href="${pageContext.request.contextPath}/admin/admin_list" class="admin_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 3}">
                    <li><a href="${pageContext.request.contextPath}/fee/findAllFee" class="fee_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 4}">
                    <li><a href="${pageContext.request.contextPath}/account/account_list" class="account_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 5}">
                    <li><a href="${pageContext.request.contextPath}/service/service_list" class="service_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 6}">
                    <li><a href="${pageContext.request.contextPath}/bill/bill_list" class="bill_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 7}">
                    <li><a href="${pageContext.request.contextPath}/report/report_list" class="report_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <li><a href="${pageContext.request.contextPath}/user/user_info" class="information_off"></a></li>
        <li><a href="${pageContext.request.contextPath}/user/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_success">保存成功！</div>
    <form action="${pageContext.request.contextPath}/admin/admin_add" method="post" class="main_form">
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" name="name" value="${admin1.name}"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${nameEr.defaultMessage}
                <c:if test="${(nameEr == null || nameEr =='')&&(admin1.name ==null||admin1.name=='')}">20长度以内的汉字、字母、数字的组合</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info">
            <input type="text" name="adminCode" value="${admin1.adminCode}"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${adminCodeEr.defaultMessage}${error1}
                <c:if test="${(adminCodeEr == null || adminCodeEr =='')&&(admin1.adminCode ==null||admin1.adminCode=='')&&(error1==null||error1=='')}">30长度以内的汉字、字母、数字的组合</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password" name="password" value="${admin1.password}"/>
            <span class="required">*</span>
            <div class="validate_msg_long error_msg">
                ${passwordEr.defaultMessage}
                <c:if test="${(passwordEr == null || passwordEr =='')&&(admin1.password ==null||admin1.password=='')}">30长度以内的汉字、字母、数字的组合</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password" name="newPassword" value="${admin1.newPassword}"/>
            <span class="required">*</span>
            <div class="validate_msg_long error_msg">
                ${newPasswordEr.defaultMessage}
                <c:if test="${(newPasswordEr == null || newPasswordEr =='')&&(admin1.newPassword ==null||admin1.newPassword=='')}"> 两次密码必须相同</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="telephone" value="${admin1.telephone}"/>
            <span class="required">*</span>
            <div class="validate_msg_medium error_msg">
                ${telephoneEr.defaultMessage}${error3}
                <c:if test="${(telephoneEr == null || telephoneEr =='')&&(admin1.telephone ==null||admin1.telephone=='')&&(error3==null||error3=='')}">正确的电话号码格式：手机或固话</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="email" value="${admin1.email}"/>
            <span class="required">*</span>
            <div class="validate_msg_medium error_msg">
                ${emailEr.defaultMessage}${error2}
                <c:if test="${(emailEr == null || emailEr =='')&&(admin1.email ==null||admin1.email=='')&&(error2==null||error2=='')}">50长度以内，正确的 email 格式</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach var="role" items="${roleList}">
                        <li><input type="checkbox" name="role"
                                <c:forEach var="r" items="${roles}">
                                    <c:if test="${r == role.roleName}">
                                        checked
                                    </c:if>
                                </c:forEach>
                                   value="${role.roleName}"/>${role.roleName}</li>
                    </c:forEach>
                </ul>
            </div>
            <span class="required">*</span>
            <div class="validate_msg_tiny error_msg">
                ${roleEr.defaultMessage}
                <c:if test="${(roleEr == null || roleEr =='')&&(admin1.role ==null||admin1.role=='')}">至少选择一个</c:if>
            </div>
        </div>
        <div class="button_info clearfix">
            <input type="submit" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="window.history.back(-1)"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
