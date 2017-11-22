<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
    <form action="/role/role_add" method="post" class="main_form">
        <div class="text_info clearfix"><span>角色名称：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="roleName" value="${roleName}"/>
            <span class="required">*</span>
            <c:choose>
                <c:when test="${(roleNameEr == null || roleNameEr == '')&& (roleName == null || roleName == '')}">
                    <div class="validate_msg_medium error_msg">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </c:when>
                <c:otherwise>
                    <div class="validate_msg_medium error_msg">${roleNameEr.defaultMessage}</div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="text_info clearfix"><span>设置权限：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach var="privilege" items="${privilegeList}">
                        <li><input name="privilege" type="checkbox"
                                   value="${privilege.privilegeName}">${privilege.privilegeName}</li>
                    </c:forEach>
                </ul>
            </div>
            <span class="required">*</span>
            <c:choose>
                <c:when test="${privilegeEr == null || privilegeEr == ''}">
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </c:when>
                <c:otherwise>
                    <div class="validate_msg_tiny">${privilegeEr.defaultMessage}</div>
                </c:otherwise>
            </c:choose>

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
